<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<HTML>
<HEAD>
<TITLE>Delete Vehicle Form</TITLE>
</HEAD>
<body bgcolor="#FFFFFF" text="#000000">
<table cellpadding="6" border="1" width="750">
  <tr>
     <td colspan=2><jsp:include page="VendorHeader.jsp" flush="true" />                  
     </td>
  </tr>
  <tr>
  <td valign="top"><jsp:include page="VendorMenu.jsp"  flush="true"/>
  </td>
  <td valign="top" halign="center" >
      <table border="1">         
  <TR>
        <TD><FONT FACE="Arial" SIZE="4" WIDTH="300%"><B>Vehicle_name</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="4" WIDTH="300%"><B>Model</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="4" WIDTH="300%"><B>Price</B>
              <TD><FONT FACE="Arial" SIZE="4" WIDTH="300%"><B>Creation_date</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="4" WIDTH="300%"><B>Action</B></FONT></TD>
       </TR>
       <%
         String sql1;
         String sql2;
          Class.forName("oracle.jdbc.OracleDriver");
          Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");
          String vendorUname=(String)session.getAttribute("username");
          int vendorId;
          
       
            sql2 ="select vendor_id from ora11.vendor where username=?";

           
            PreparedStatement s2 = con.prepareStatement(sql2);
              s2.setString(1,vendorUname);
              ResultSet rs2 = s2.executeQuery();
              vendorId = -1;
             if (rs2.next()) {
             vendorId = rs2.getInt(1);  
                             }
             
                   sql1 = "select vid,vehicle_name,model,cost,creation_date from ora11.vehicle "
                    + "where managed_by =? "; 
             PreparedStatement s1 = con.prepareStatement(sql1);
             s1.setInt(1,vendorId);
              ResultSet rs1 = s1.executeQuery();
              while (rs1.next()) {
              String vid=rs1.getString(1);
                        out.println("<TR>");
                        out.println("<TD>" + rs1.getString(2) + "</TD>");
                        out.println("<TD>&nbsp;&nbsp;" + rs1.getString(3) + "</TD>");
                        out.println("<TD>&nbsp;&nbsp;" + rs1.getString(4) + "</TD>");
                        out.println("<TD>&nbsp;&nbsp;" + rs1.getString(5) + "</TD>");%>                      
                        <TD>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                            <A href="DeleteVehicle.jsp?vehicleId=<%=vid%>&vendorId<%=vendorId%>">Delete</a> 
                       <%  out.println("</TD>");                        
                       out.println("</TR>");
              }
              rs1.close();            
           rs2.close();
           s1.close();
           s2.close(); 
  
    %>
</TABLE>  
    </td> 
</TABLE>
</body>
</html>