<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<HTML>
<HEAD>
<TITLE>Administrator Page</TITLE>
</HEAD>
<body bgcolor="#FFFFFF" text="#000000">
<table cellpadding="6" border="1" width="750">
  <tr>
     <td colspan=2><jsp:include page="AdminHeader.jsp" flush="true" />                  
     </td>
  </tr>
  <tr>
  <td valign="top"><jsp:include page="AdminMenu.jsp"  flush="true"/>
  </td>
  <td valign="top" halign="center" >
      <table border="1">         
  <TR>
        <TD widht="50"><FONT FACE="Arial" SIZE="3" WIDTH="300%"><B>First Name&nbsp;&nbsp;</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="3" WIDTH="300%"><B>Last Name</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="3" WIDTH="300%"><B>Phone</B>
              <TD><FONT FACE="Arial" SIZE="3" WIDTH="300%"><B>Email</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="3" WIDTH="300%"><B>Street</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="3" WIDTH="300%"><B>City</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="3" WIDTH="300%"><B>State</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="3" WIDTH="300%"><B>ZipCode</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="3" WIDTH="300%"><B>Country</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="3" WIDTH="300%"><B>Username</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="3" WIDTH="300%"><B>Password</B></FONT></TD>
              <TD width="100"><FONT FACE="Arial" SIZE="3" WIDTH="300%"><B>Date&nbsp;&nbsp</B></FONT></TD>
       </TR>
       <%
          String category = request.getParameter("category");
          String sql;
          Class.forName("oracle.jdbc.OracleDriver");
          Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");
          String adminUname=(String)session.getAttribute("username");
          if (category.contains("1"))
          {
            sql = "select first_name,last_name,phone,email_id,street,city,state,zipcode,country,username,password,creation_date"
                   + " from ora11.vendor_temp";  
            PreparedStatement s = con.prepareStatement(sql);
            
              ResultSet rs = s.executeQuery(sql);
              while (rs.next()) {
              String uname=rs.getString(10);
                        out.println("<TR>");
                        out.println("<TD>" + rs.getString(1) + "</TD>");
                        out.println("<TD>" + rs.getString(2) + "</TD>");
                        out.println("<TD>" + rs.getString(3) + "</TD>");
                        out.println("<TD>" + rs.getString(4) + "</TD>");
                        out.println("<TD>" + rs.getString(5) + "</TD>");
                        out.println("<TD>" + rs.getString(6) + "</TD>");
                        out.println("<TD>" + rs.getString(7) + "</TD>");
                        out.println("<TD>" + rs.getString(8) + "</TD>");
                        out.println("<TD>" + rs.getString(9) + "</TD>");
                        out.println("<TD>" + uname + "</TD>");
                        out.println("<TD>" + rs.getString(11) + "</TD>");
                        out.println("<TD>" + rs.getString(12) + "</TD>");
                        out.println("<TD>");%>                      
                        <A href="ApproveVendortemp.jsp?usern=<%=uname%>&admin=<%=adminUname%>">Approve</a>
                        <% out.println("</TD>");
                        out.println("<TD>");%>
                        <A href="RejectVendortemp.jsp?uname=<%=uname%>">Reject</a>
                      <%  out.println("</TD>");
                       out.println("</TR>");
              }
            
          }
      
          else if (category.contains("2"))
          {
            sql = "select vendor_id,first_name,last_name,phone,email_id,street,city,state,zipcode,country,username,password,creation_date"
                    + " from ora11.vendor";
               
            PreparedStatement s = con.prepareStatement(sql);
              ResultSet rs = s.executeQuery();
              while (rs.next()) {
              String vendorId=rs.getString(1);
                        out.println("<TR>");
                        out.println("<TD>" + rs.getString(2) + "</TD>");
                        out.println("<TD>" + rs.getString(3) + "</TD>");
                        out.println("<TD>" + rs.getString(4) + "</TD>");
                        out.println("<TD>" + rs.getString(5) + "</TD>");
                        out.println("<TD>" + rs.getString(6) + "</TD>");
                        out.println("<TD>" + rs.getString(7) + "</TD>");
                        out.println("<TD>" + rs.getString(8) + "</TD>");
                        out.println("<TD>" + rs.getString(9) + "</TD>");
                        out.println("<TD>" + rs.getString(10) + "</TD>");
                        out.println("<TD>" + rs.getString(11) + "</TD>");
                        out.println("<TD>" + rs.getString(12) + "</TD>");
                        out.println("<TD>" + rs.getString(13) + "</TD>");
                        out.println("<TD>");%>
                        <A href="DeleteVendor.jsp?vendorId=<%=vendorId%>">Reject</a>
                        <% out.println("</TD>");
                        out.println("</TR>");
              }
              rs.close();
             s.close();
          
          
          }
          else if (category.contains("3"))
          {
            sql = "select first_name,last_name,phone,email_id,street,city,state,zipcode,country,username,password,creation_date"
                    + " from ora11.reguser_temp";
            PreparedStatement s = con.prepareStatement(sql);
            
              ResultSet rs = s.executeQuery();
              while (rs.next()) {
              String uname=rs.getString(10);
                        out.println("<TR>");
                        out.println("<TD>" + rs.getString(1) + "</TD>");
                        out.println("<TD>" + rs.getString(2) + "</TD>");
                        out.println("<TD>" + rs.getString(3) + "</TD>");
                        out.println("<TD>" + rs.getString(4) + "</TD>");
                        out.println("<TD>" + rs.getString(5) + "</TD>");
                        out.println("<TD>" + rs.getString(6) + "</TD>");
                        out.println("<TD>" + rs.getString(7) + "</TD>");
                        out.println("<TD>" + rs.getString(8) + "</TD>");
                        out.println("<TD>" + rs.getString(9) + "</TD>");
                        out.println("<TD>" + uname + "</TD>");
                        out.println("<TD>" + rs.getString(11) + "</TD>");
                        out.println("<TD>" + rs.getString(12) + "</TD>");
                        out.println("<TD>");%>
                        <a href="ApproveUsertemp.jsp?uname=<%=uname%>&admin=<%=adminUname%>">Approve</a>
                         <%out.println("</TD>");
                        out.println("<TD>"); %>
                        <a href="RejectUsertemp.jsp?uname=<%=uname%>">Reject</a>
                        <% out.println("</TD>");
                        out.println("</TR>");
              }
              rs.close();
             s.close();
          
         }
          else if (category.contains("4"))
          {
            sql = "select regid,first_name,last_name,phone,email_id,street,city,state,zipcode,country,username,password,creation_date"
                    + " from ora11.reguser";
            PreparedStatement s = con.prepareStatement(sql);
            
              ResultSet rs = s.executeQuery();
              while (rs.next()) {
              String regid=rs.getString(1);
                        out.println("<TR>");
                        out.println("<TD>" + rs.getString(2) + "</TD>");
                        out.println("<TD>" + rs.getString(3) + "</TD>");
                        out.println("<TD>" + rs.getString(4) + "</TD>");
                        out.println("<TD>" + rs.getString(5) + "</TD>");
                        out.println("<TD>" + rs.getString(6) + "</TD>");
                        out.println("<TD>" + rs.getString(7) + "</TD>");
                        out.println("<TD>" + rs.getString(8) + "</TD>");
                        out.println("<TD>" + rs.getString(9) + "</TD>");
                        out.println("<TD>" + rs.getString(10) + "</TD>");
                        out.println("<TD>" + rs.getString(11) + "</TD>");
                        out.println("<TD>" + rs.getString(12) + "</TD>");
                        out.println("<TD>" + rs.getString(13) + "</TD>");
                        out.println("<TD>");%>
                        <a href="DeleteUser.jsp?regid=<%=regid%>">Delete</a>
                      <%  out.println("</TD>");
                        out.println("</TR>");
              }
              rs.close();
           s.close(); 
          }
                      
          else 
          {
            sql = "select regid,first_name,last_name,phone,email_id,street,city,state,zipcode,country,username,password,creation_date"
                    + " from ora11.reguser";
            PreparedStatement s = con.prepareStatement(sql);
            
              ResultSet rs = s.executeQuery();
              while (rs.next()) {
              String regid=rs.getString(1);
                        out.println("<TR>");
                        out.println("<TD>" + rs.getString(2) + "</TD>");
                        out.println("<TD>" + rs.getString(3) + "</TD>");
                        out.println("<TD>" + rs.getString(4) + "</TD>");
                        out.println("<TD>" + rs.getString(5) + "</TD>");
                        out.println("<TD>" + rs.getString(6) + "</TD>");
                        out.println("<TD>" + rs.getString(7) + "</TD>");
                        out.println("<TD>" + rs.getString(8) + "</TD>");
                        out.println("<TD>" + rs.getString(9) + "</TD>");
                        out.println("<TD>" + rs.getString(10) + "</TD>");
                        out.println("<TD>" + rs.getString(11) + "</TD>");
                        out.println("<TD>" + rs.getString(12) + "</TD>");
                        out.println("<TD>" + rs.getString(13) + "</TD>");
                        out.println("<TD>");%>
                        <a href="DeleteUser.jsp?regid=<%=regid%>">Delete</a>
                      <%  out.println("</TD>");
                        out.println("</TR>");
              }
              rs.close();
           s.close(); 
          
          }
          
  
     %>
</TABLE>  
    </td>
</TABLE>
</body>
</html>