<%@ page session="true" %>
<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
     String vid = request.getParameter("vehicleId"); 
    String vname = request.getParameter("vname");    
    String vmodel = request.getParameter("vmodel");
    String vprice = request.getParameter("vprice");
    String vdescription = request.getParameter("vdescription");
   
//session.getAttribute("username").;
%>
    
    

<HTML>
<HEAD>
<TITLE>Update Vehicle</TITLE>
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
<div style="position:absolute;left:300px;width:695px;height:594px;">
<form name="Form1" method="post" action="UpdateVehicleAction.jsp" enctype="multipart/form-data" >
    <input type="hidden" id="vidnew" name="vidnew" value="<%=vid%>"/>
<input type="text" id="vmodelnew"  style="position:absolute;left:195px;top:121px;width:179px;height:18px;line-height:18px;z-index:51;" name="vmodelnew" value="<%=vmodel%>">
<input type="text" id="vpricenew" style="position:absolute;left:193px;top:297px;width:143px;height:18px;line-height:18px;z-index:52;" name="vpricenew" value="<%=vprice%>">
<div id="wb_Text1" style="position:absolute;left:95px;top:79px;width:91px;height:16px;z-index:53;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Vehicle Name:</span></div>
<div id="wb_Text2" style="position:absolute;left:94px;top:123px;width:93px;height:16px;z-index:54;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Model Number:</span></div>
<div id="wb_Text3" style="position:absolute;left:71px;top:169px;width:117px;height:32px;z-index:55;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Vehicle Description:</span></div>
<div id="wb_Text4" style="position:absolute;left:147px;top:301px;width:39px;height:16px;z-index:56;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Price:</span></div>

 <A href="UpdateVehicleAction.jsp?vehicleId=<%=vid%>&vname=<%=vname%>&vmodel=<%=vmodel%>&vdescription=<%=vdescription%>&vprice=<%=vprice%>">
                             
<input type="submit"  name="submit" value="Update" style="position:absolute;left:139px;top:350px;width:89px;height:24px;z-index:57;">
Update</a>
<div id="wb_TextArt1" style="position:absolute;left:132px;top:19px;width:410px;height:31px;z-index:58;">
<img src="/vendor/addvehicle.png"  alt="Update vehicle details below" title="Update vehicle details below" style="border-width:0;width:410px;height:31px;"></div>
<textarea name="vdescriptionnew" id="vdescriptionnew" style="position:absolute;left:193px;top:169px;width:339px;height:107px;z-index:59;" rows="5" cols="50"><%=vdescription%></textarea>
<input type="reset"  name="reset" value="Reset" style="position:absolute;left:337px;top:350px;width:89px;height:23px;z-index:64;">
<select name="vnamenew" id="vnamenew" size="1" style="position:absolute;left:196px;top:78px;width:180px;height:20px;z-index:65;">
<option value="BMW" title="BMW">BMW</option>
<option value="MERCEDES" title="MERCEDES">MERCEDES-BENZ</option>
<option value="NISSAN" title="NISSAN">NISSAN</option>
<option value="FORD" title="FORD">FORD</option>
</select>
<div id="wb_Text5" style="position:absolute;left:244px;top:400px;width:58px;height:16px;z-index:66;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Go Back</span></div>

</form>

</div>
    </td>
</TABLE>
</body>
</html>

