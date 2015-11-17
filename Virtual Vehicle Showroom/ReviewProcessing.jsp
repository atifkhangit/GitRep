
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<% 
     Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");
   String review = request.getParameter("review");
  String rating = request.getParameter("rating");
    String username = request.getParameter("username");
  String vLname = request.getParameter("vLname");
    String vFname = request.getParameter("vFname");
   
    String vendorName = vFname + " " + vLname;
     
    String vehicle = request.getParameter("vehicle");
    String model = request.getParameter("model");
  int vid =0;
  
    username="aatif";

    String sql= "insert into ora11.review (REV_ID,REVIEW_DESC,RATING,SUBMIT_DATE,"
            + "VEHICLE_NAME,MODEL,VENDOR,SUBMITTED_BY)	"	
            + "values(seq_rev.NEXTVAL,?,?,SYSDATE,?,?,?,?)";
    
    PreparedStatement pst = con.prepareStatement(sql); 
    
    pst.setString(1,review);
    pst.setString(2,rating);
    pst.setString(3,vehicle);
    pst.setString(4,model);
    pst.setString(5,vendorName);
    pst.setString(6,username);
    
   
   
        pst.execute();
         con.commit();
         
         pst.close();
         con.close();
    
 response.sendRedirect("UserViewVehicle.jsp");
         
%>
