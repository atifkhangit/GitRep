<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ page import="java.sql.*"  %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<HTML>
<HEAD>
<TITLE>User Page</TITLE>
</HEAD>
<body bgcolor="#FFFFFF" text="#000000">
  
<table cellpadding="2" border="0" width="750">
 
  <tr>
  <br>
  <br>
  <br>
  <td valign="top"><jsp:include page="UserMenu.jsp"  flush="true"/>
  </td>
  <td valign="top" halign="center" >
      <div id="tab" style="position:absolute;left:150px;">
      <table border="1" style="left:100px" cellpadding="12">         
  <TR>
              <TH><FONT FACE="Arial" SIZE="3" ><B>Company</B></FONT></TH>
              <TH><FONT FACE="Arial" SIZE="3" ><B>Model</B></FONT></TH>
              <TH><FONT FACE="Arial" SIZE="3" ><B>Vehicle Details</B></TH>
              <TH><FONT FACE="Arial" SIZE="3" ><B>Price</B></FONT></TH>
               <TH colspan="3"><FONT FACE="Arial" SIZE="3" ><B>Image</B></FONT></TH>
               <TH colspan="2"><FONT FACE="Arial" SIZE="3" ><B>Action</B></FONT></TH>
       </TR>
       <%
          
          String sql1="";
          String sql2="";
          int managedBy;
          int imageId;
          String model="";
          String image;
          String vname;
          int imageNo;
          Class.forName("oracle.jdbc.OracleDriver");
          Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");
          String username=(String)session.getAttribute("username");
          
          sql1="select vehicle_name,model,vehicle_description,cost,managed_by,image_id from vehicle order by image_id desc";
          PreparedStatement pst1 = con.prepareStatement(sql1);
         ResultSet rs1= pst1.executeQuery();
         
         sql2="select image_id,image_no,image from images_tab where image_no "
                 + "=(select image_no from images_tab where image_id=?  "
                 + " and uploaded_by=?) ";
         
         PreparedStatement pst2 = con.prepareStatement(sql2);
         
         String sql3 = "select first_name,last_name from ora11.vendor where vendor_id =?";
        
          PreparedStatement ps3 = con.prepareStatement(sql3);
          
          
         while(rs1.next())
         {   
             if(rs1.getString(1) != null)
             {
             managedBy= rs1.getInt(5);
             imageId= rs1.getInt(6);
             model=rs1.getString(2);
             vname=rs1.getString(1);
             pst2.setInt(1, imageId);
             pst2.setInt(2,managedBy);
             
             
             ResultSet rs2= pst2.executeQuery();
              ps3.setInt(1,managedBy);
              ResultSet rs3 = ps3.executeQuery();
              
             out.println("<TR>");
             out.println("<TD>" + rs1.getString(1) + "</TD>");
             out.println("<TD>" + rs1.getString(2) + "</TD>");
             out.println("<TD>" + rs1.getString(3) + "</TD>");
             out.println("<TD>" + rs1.getString(4) + "</TD>");
            
          
             while(rs2.next())
              {  // image = rs2.getString("image");
               imageNo=rs2.getInt(1);
               
               //out.println(imageNo);
                  %>
                 
                 <TD>
                  <img src="GetImageDetails.jsp?imgid=<%=imageNo%>" width="150" height="150" /></TD>

                  <% 
                              
              }
             %>
             <TD>
             <A href="Inquiry.jsp?vendorId=<%=managedBy%>&vehicle=<%=vname%>&model=<%=model%>">Contact Vendor</a>
             </TD>
               <TD>
              <%
              while(rs3.next())
                   {    
                       String vFname = rs3.getString(1);
                       String vLname = rs3.getString(2);
              %>     
             <A href="ReviewForm.jsp?vendorFname=<%=vFname%>&vendorLname=<%=vLname%>&vehicle=<%=vname%>&model=<%=model%>">Submit Review</a>
             <%}%>
             </TD>
             
             <%
             }
             }
             out.println("</TR>");    
     %>
</TABLE>  
       </div>
    </td>
</TABLE>
</body>
</html>