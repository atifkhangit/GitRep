<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<HTML>
<HEAD>
<TITLE>Administrator Page</TITLE>
</HEAD>
<body bgcolor="#FFFFFF" text="#000000">
<table cellpadding="6" border="0" width="750">
  <tr>
     <td colspan=2><jsp:include page="VendorHeader.jsp" flush="true" />                  
     </td>
  </tr>
  <tr>
  <td valign="top"><jsp:include page="VendorMenu.jsp"  flush="true"/>
  </td>
  <td valign="top" halign="center" >
<div id="wb_Form1" style="position:absolute;left:300px;width:695px;height:594px;">
<form name="AddV" method="post" action="trial.jsp" enctype="multipart/form-data" id="AddV" >
<input type="text" id="vmodel" style="position:absolute;left:195px;top:121px;width:179px;height:18px;line-height:18px;z-index:51;" name="vmodel" value="">
<input type="text" id="vprice"  style="position:absolute;left:193px;top:297px;width:143px;height:18px;line-height:18px;z-index:52;" name="vprice" value="">
<div id="wb_Text1" style="position:absolute;left:95px;top:79px;width:91px;height:16px;z-index:53;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Vehicle Name:</span></div>
<div id="wb_Text2" style="position:absolute;left:94px;top:123px;width:93px;height:16px;z-index:54;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Model Number:</span></div>
<div id="wb_Text3" style="position:absolute;left:71px;top:169px;width:117px;height:32px;z-index:55;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Vehicle Description:</span></div>
<div id="wb_Text4" style="position:absolute;left:147px;top:301px;width:39px;height:16px;z-index:56;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Price:</span></div>
<input type="submit" id="submit"  name="submit" value="Submit" style="position:absolute;left:139px;top:447px;width:89px;height:24px;z-index:57;">
<div id="wb_TextArt1" style="position:absolute;left:132px;top:19px;width:410px;height:31px;z-index:58;">
</div>
<textarea name="vdescription" id="vdescription" style="position:absolute;left:193px;top:169px;width:339px;height:107px;z-index:59;" rows="5" cols="50"></textarea>
<div id="wb_Text6" style="position:absolute;left:107px;top:339px;width:86px;height:32px;z-index:60;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Upload image:</span></div>
<input type="file" id="image1" style="position:absolute;left:193px;top:340px;width:207px;height:17px;z-index:61;" name="image1">
<input type="file" id="image2" style="position:absolute;left:193px;top:373px;width:207px;height:17px;z-index:62;" name="image2">
<input type="file" id="image3" style="position:absolute;left:193px;top:406px;width:207px;height:17px;z-index:63;" name="image3">
<input type="reset" id="reset" name="" value="Reset" style="position:absolute;left:337px;top:447px;width:89px;height:23px;z-index:64;">
<select name="vname" size="1" id="vname" style="position:absolute;left:196px;top:78px;width:180px;height:20px;z-index:65;">
<option value="BMW" title="BMW">BMW</option>
<option value="MERCEDES" title="MERCEDES">MERCEDES-BENZ</option>
<option value="NISSAN" title="NISSAN">NISSAN</option>
<option value="FORD" title="FORD">FORD</option>
</select>
<div id="wb_Text5" style="position:absolute;left:244px;top:495px;width:58px;height:16px;z-index:66;text-align:left;">
    <span style="color:#000000;font-family:Arial;font-size:13px;"><a href="VendorHome.jsp">Go Back</a></span></div>
</form>
</div>
    </td>
</TABLE>
</body>
</html>