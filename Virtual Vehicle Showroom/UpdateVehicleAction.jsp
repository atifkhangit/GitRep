<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import ="java.sql.*" %>
<%@ page session="true" %>
<% 
     String vid = request.getParameter("vidnew"); 
    String vname = request.getParameter("vnamenew");    
    String vmodel = request.getParameter("vmodelnew");
    String vprice = request.getParameter("vpricenew");
    String vdescription = request.getParameter("vdescriptionnew");
    String sql;
    int price=0;
    
    out.println(vprice);
    out.println(vname);
    out.println(vmodel);
     out.println(vid);
    sql="update vehicle set VEHICLE_NAME=?,MODEL=?,"
        + "VEHICLE_DESCRIPTION=?,COST=? where vid='"+vid+"'";
    
   Class.forName("oracle.jdbc.OracleDriver");
 Connection cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");
 PreparedStatement  pst=cn.prepareStatement(sql);
 //price = Integer.getInteger(vprice);
 
 
 pst.setString(1,vname);
 pst.setString(2,vmodel);
 pst.setString(3,vdescription);
 //pst.setInt(4,price);
 
 //pst.executeUpdate();

pst.close();
cn.close();
//response.sendRedirect("UpdateVehicleForm.jsp");  
%> 
