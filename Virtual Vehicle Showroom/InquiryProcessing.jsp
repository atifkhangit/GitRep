
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<% 
     Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");
   String name = request.getParameter("name");
  String phone = request.getParameter("phone");
    String email = request.getParameter("email");
  String comments = request.getParameter("comments");
    String username = request.getParameter("username");
  String vendor = request.getParameter("vendor");
    String vehicle = request.getParameter("vehicle");
    String model = request.getParameter("model");
  int vid =0;
  
  //  username="aatif";

    String sql1= "insert into ora11.inquiry (INQ_ID,NAME,PHONE,EMAIL,COMMENTS,USERNAME,VENDOR,VEHICLE)"
 +"values(seq_inq.NEXTVAL,?,?,?,?,?,?,?)";
    
    String sql2 = "select vid from ora11.vehicle where vehicle_name=? and model=?";
    
    PreparedStatement pst2 = con.prepareStatement(sql2);
    
    PreparedStatement pst = con.prepareStatement(sql1); 
    
    pst2.setString(1, vehicle);
    pst2.setString(2,model);
    
    
   ResultSet rs= pst2.executeQuery();
    while (rs.next())
    {
      vid = rs.getInt(1);
  
    
    pst.setString(1,name);
    pst.setString(2,phone);
    pst.setString(3,email);
    pst.setString(4,comments);
    pst.setString(5,username);
    pst.setString(6,vendor);
    pst.setInt(7,vid);
    
 
        pst.execute();
         con.commit();
         }
         pst.close();
         con.close();
    
 response.sendRedirect("UserViewVehicle.jsp");
         
%>
