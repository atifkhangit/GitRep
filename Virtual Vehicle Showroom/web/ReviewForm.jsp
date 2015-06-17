<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String vname = request.getParameter("vehicle");
    String vFname = request.getParameter("vendorFname");
    String vLname = request.getParameter("vendorLname");
    String model = request.getParameter("model");
     String vendor = vFname + "  " + vLname; 
            
    %>

<HTML>
<HEAD>
<TITLE>Submit Inquiry</TITLE>
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
      <div id="tab" style="position:absolute;left:250px;">
      <table border="0" style="left:600px" cellpadding="12">         
          <TR>
              <TD>
    <div id="wb_Form1" style="position:absolute;width:421px;height:399px;">
<form name="contact" method="post" action="ReviewProcessing.jsp?username=<%=session.getAttribute("username")%>&vFname=<%=vFname%>&vLname=<%=vLname%>&vehicle=<%=vname%>&model=<%=model%>" id="Form1">
<div id="wb_Text2" style="position:absolute;left:19px;top:19px;width:65px;height:16px;z-index:44;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Vendor:</span></div>
<div id="wb_Text3" style="position:absolute;left:25px;top:162px;width:72px;height:16px;z-index:45;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Review:</span></div>
<input type="submit" id="Button1" name="" value="Send" style="position:absolute;left:71px;top:318px;width:96px;height:25px;z-index:46;">
<input type="reset" id="Button2" name="" value="Reset" style="position:absolute;left:272px;top:318px;width:96px;height:25px;z-index:47;">
<div id="wb_Text1" style="position:absolute;left:28px;top:244px;width:90px;height:16px;z-index:48;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Rating:</span></div>
<div id="wb_Text8" style="position:absolute;left:117px;top:17px;width:200px;height:16px;z-index:49;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;"><%=vendor%></span></div>
<textarea name="review" id="review" style="position:absolute;left:117px;top:163px;width:199px;height:59px;z-index:50;" rows="2" cols="27"></textarea>
<select name="rating" size="1" id="rating" style="position:absolute;left:119px;top:242px;width:117px;height:20px;z-index:51;">
<option value="1" title="1">1</option>
<option value="2" title="2">2</option>
<option value="3" title="3">3</option>
<option value="4" title="4">4</option>
<option value="5" title="5">5</option>
</select>
<div id="wb_Text4" style="position:absolute;left:25px;top:66px;width:57px;height:16px;z-index:52;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Vehicle:</span></div>
<div id="wb_Text5" style="position:absolute;left:25px;top:106px;width:62px;height:16px;z-index:53;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Model:</span></div>
<div id="wb_Text6" style="position:absolute;left:117px;top:70px;width:134px;height:16px;z-index:54;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;"><%=vname%></span></div>
<div id="wb_Text7" style="position:absolute;left:117px;top:110px;width:125px;height:16px;z-index:55;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;"><%=model%></span></div>
<div id="wb_Text9" style="top:280px">
<span style="color:#000000;font-family:Arial;font-size:13px;"> </span>

<div id="wb_Text9" style="position:absolute;left:28px;top:275px;width:550px;height:16px;z-index:48;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">1 -&nbsp; Excellent&nbsp;&nbsp;&nbsp;&nbsp; 2 - Very Good&nbsp;&nbsp;&nbsp;&nbsp; 3 - Good&nbsp;&nbsp;&nbsp;&nbsp; 4 - Fair&nbsp;&nbsp;&nbsp;&nbsp; 5 - Poor</span></div>

</div>
</form>
</div>
              </TD>
          </TR>
</TABLE>  
       </div>
    </td>
</TABLE>
</body>
</html>