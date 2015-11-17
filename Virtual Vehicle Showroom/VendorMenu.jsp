
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<table cellpadding="5" border="1" width="180">
  <td width="180"  valign="top" bgcolor="#AABBCC" text="#000000">
     <br><br>
     <a href="VendorHome.jsp">Home</a><br><br>
     <a href="AddVehicleForm.jsp">Add New Vehicle</a><br><br>
     <a href="DeleteVehicleForm.jsp">Delete Vehicle</a><br><br>
     <a href="UpdateVehicleForm.jsp">Update Vehicle</a><br><br>
     <a href="VendorManageReview.jsp">Manage Reviews</a><br><br>
     <a href="Logout.jsp">Log Out</a><br><br>
     <br><br><br>
</td>
</table>
    <div id="wb_Text1" style="position:absolute;left:1109px;top:7px;width:65px;height:16px;z-index:1;text-align:left;">
      <span style="color:#000000;font-family:Arial;font-size:13px;"><B>Welcome:&nbsp;&nbsp;<%=session.getAttribute("username")%></B></span></div>

</body>
</html>
 
