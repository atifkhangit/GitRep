<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<!DOCTYPE html>

<HTML>
<HEAD>
<TITLE>Admin Page</TITLE>
</HEAD>
<body bgcolor="#FFFFFF" text="#000000"> 
    <TABLE cellpadding="6" border="1" width="750">
  <tr>
     <td colspan=2><jsp:include page="AdminHeader.jsp" flush="true" />                  
     </td>
  </tr>
  <tr>
  <td valign="top"><jsp:include page="AdminMenu.jsp"  flush="true"/>
  </td>
  <td valign="top" halign="center" >
      <TABLE>
       <TR>
        <TD><FONT FACE="Arial" SIZE="4" WIDTH="50%"><B>First Name</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="4" WIDTH="50%"><B>Last Name</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="4" WIDTH="50%"><B>Phone</B>
              <TD><FONT FACE="Arial" SIZE="4" WIDTH="50%"><B>Email</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="4" WIDTH="50%"><B>Street</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="4" WIDTH="50%"><B>City</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="4" WIDTH="50%"><B>State</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="4" WIDTH="50%"><B>ZipCode</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="4" WIDTH="50%"><B>Country</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="4" WIDTH="50%"><B>Username</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="4" WIDTH="50%"><B>Password</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="4" WIDTH="50%"><B>Creation Date</B></FONT></TD>
       </TR>
       <%
           Class.forName("oracle.jdbc.OracleDriver");
          Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");
           String adminUname=(String)session.getAttribute("username");
         String categoryId=request.getParameter("category");
          String sql;
 
         if (categoryId.contains("1"))
          {
             out.println("inside cat1");
            sql = "select first_name,last_name,phone,email_id,street,city,state,zipcode,country,username,password,creation_date "
                    + " from ora11.vendor_temp";      
            PreparedStatement ps = con.prepareStatement(sql);          
              ResultSet rs = ps.executeQuery();
              while (rs.next()) {
                  String uname = rs.getString(10);
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
                        out.println("<TD>" + rs.getString(10) + "</TD>");
                        out.println("<TD>" + rs.getString(11) + "</TD>");
                        out.println("<TD>" + rs.getString(12) + "</TD>");
                        out.println("<TD>");
                        %>
                        <A href="ApproveVendortemp.jsp?usern=<%=uname%>&admin=<%=adminUname%>">Approve</a>
      <%    
     out.println("</TD>");
                  
      // out.println("<TD><A href=rejectVendortemp.jsp?uname="+uname+">Reject</a></TD>");
                        out.println("</TR>");
                      
             }
        
            }
         else
         {
             out.println("not in if");
         }
     %>
      </TABLE>     
    </TABLE>
</body>
</html>