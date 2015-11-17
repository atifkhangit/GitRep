<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.portlet.RenderRequest" %>
<!DOCTYPE html>

<HTML>
<HEAD>
<TITLE>Administrator Page</TITLE>
</HEAD>
<body bgcolor="#FFFFFF" text="#000000">
   <div id="wb_Form2" style="position:absolute;width:126px;height:34px;">
<form name="welcome_message" method="post" action="" id="Form2">
<input type="text" name="username" value="Welcome:  <%=session.getAttribute("username")%>">
</form>
</div>
<table cellpadding="2" border="1" width="750">
 
  <tr>
  <br>
  <br>
  <br>
  <td valign="top"><jsp:include page="indexMenu.jsp"  flush="true"/>
  </td>
  <td valign="top" halign="center" >
      <div id="tab" style="position:absolute;left:250px;">
      <table border="1" style="left:600px" cellpadding="12">         
  <TR>
              <TD><FONT FACE="Arial" SIZE="3" WIDTH="300%"><B>Company</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="3" WIDTH="300%"><B>Model</B></FONT></TD>
              <TD><FONT FACE="Arial" SIZE="3" WIDTH="300%"><B>Vehicle Details</B></TD>
              <TD><FONT FACE="Arial" SIZE="3" WIDTH="300%"><B>Price</B></FONT></TD>
       </TR>
       <%
          
          String sql1="";
          String sql2="";
          int managedBy;
          int imageId;
          String model="";
          String image;
          Class.forName("oracle.jdbc.OracleDriver");
          Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");
          String adminUname=(String)session.getAttribute("username");
          
          sql1="select vehicle_name,model,vehicle_description,cost,managed_by,image_id from vehicle";
          PreparedStatement pst1 = con.prepareStatement(sql1);
         ResultSet rs1= pst1.executeQuery();
         
         sql2="select image_id,image_no,image from images_tab where image_no "
                 + "=(select image_no from images_tab where image_id=? and "
                 + "model_name=? and uploaded_by=?) ";
         
         PreparedStatement pst2 = con.prepareStatement(sql2);
         
         while(rs1.next())
         {   managedBy= rs1.getInt(5);
             imageId= rs1.getInt(6);
             model=rs1.getString(2);
             
             pst2.setInt(1, 235);
             pst2.setString(2, "222");
             pst2.setInt(3,101);
             
             
             ResultSet rs2= pst2.executeQuery();
             
             out.println("<TR>");
             out.println("<TD>" + rs1.getString(1) + "</TD>");
             out.println("<TD>" + rs1.getString(2) + "</TD>");
             out.println("<TD>" + rs1.getString(3) + "</TD>");
             out.println("<TD>" + rs1.getString(4) + "</TD>");
            
             {out.println("session is  null");
             while(rs2.next())
              {   image = rs2.getString("image");
                  out.println("<TD>");%>
                  <img src="/images/<%=image%> width="100" height="100" />
                  <%
                  out.println("</TD>");
                  
              }
             
             }
             
             out.println("</TR>");
             
         }
          
          
     %>
</TABLE>  
       </div>
    </td>
</TABLE>
</body>
</html>