
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<% 
     Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");
   String vid = request.getParameter("vehicleId");
   String vendorId = request.getParameter("vendorId");
    String sql1="delete from vehicle where vid =?" ;
    
    //String sql2="select image_no from images_tab i,vehicle v "
      //      + "where i.image_id=v.image_id and v.vid='111'" ;//+vid+"'" ;
    
    String sql3 = "delete from images_tab where image_no in (select image_no from images_tab i where i.image_id =?) ";
    
    PreparedStatement st1 = con.prepareStatement(sql1); 
    st1.setString(1,vid);
    st1.execute();
   // PreparedStatement st2 = con.prepareStatement(sql2); 
    //st2.execute();
    PreparedStatement st3 = con.prepareStatement(sql3); 
    st3.setString(1,vid);
    st3.execute();
    
    con.commit();
    st1.close();
    //st2.close();
    con.close();
 response.sendRedirect("DeleteVehicleForm.jsp");  
 
 
%>
