<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<HTML>
<HEAD>
<TITLE>Manage Review</TITLE>
</HEAD>
<body bgcolor="#FFFFFF" text="#000000">
  
<table cellpadding="2" border="0" width="750">
 
  <tr>
  <br>
  <br>
  <br>
  <td valign="top"><jsp:include page="VendorMenu.jsp"  flush="true"/>
  </td>
  <td valign="top" halign="center" >
      <div id="tab" style="position:absolute;left:250px;">
      <table border="1" style="left:600px" cellpadding="12">         
  <TR>
               <TH><FONT FACE="Arial" SIZE="2" WIDTH="300%"><B>Review</B></FONT></TH>
              <TH><FONT FACE="Arial" SIZE="2" WIDTH="300%"><B>Rating</B></FONT></TH>
              <TH><FONT FACE="Arial" SIZE="2" WIDTH="300%"><B>Vehicle</B></FONT></TH>
              <TH><FONT FACE="Arial" SIZE="2" WIDTH="300%"><B>Model</B></TH>
              <TH><FONT FACE="Arial" SIZE="2" WIDTH="800%"><B>Vendor</B></FONT></TH>
              <TH><FONT FACE="Arial" SIZE="2" WIDTH="800%"><B>User</B></FONT></TH>
  </TR>
         <%
         
          Class.forName("oracle.jdbc.OracleDriver");
          Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");

           String sql ="select rev_id,review_desc,rating,vehicle_name,"
                   + "model,vendor,submitted_by from ora11.review";

           
            PreparedStatement s = con.prepareStatement(sql);
              
              ResultSet rs = s.executeQuery();
             
              while (rs.next()) {
                        out.println("<TR>");
                        out.println("<TD>" + rs.getString(2) + "</TD>");
                        out.println("<TD>" + rs.getString(3) + "</TD>");
                        out.println("<TD>" + rs.getString(4) + "</TD>");
                        out.println("<TD>" + rs.getString(5) + "</TD>");
                        out.println("<TD>" + rs.getString(6) + "</TD>");
                        out.println("<TD>" + rs.getString(7) + "</TD>");   
                        %>
                         <TD>
                             <A href="DeleteReview.jsp?revId=<%=rs.getString(1)%>">Delete Review</a>
             </TD>
             <%
                       out.println("</TR>");
              }
              rs.close();            
           con.close();
           
  
    %>
</TABLE>  
       </div>
    </td>
</TABLE>
</body>
</html>