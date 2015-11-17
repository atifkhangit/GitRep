<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String vname = request.getParameter("vehicle");
    String managedBy = request.getParameter("vendorId");
    String model = request.getParameter("model");
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
      <div id="wb_Form1" style="position:absolute;width:354px;height:399px;">
<form name="contact" method="post" action="InquiryProcessing.jsp?username=<%=session.getAttribute("username")%>&vendor=<%=managedBy%>&vehicle=<%=vname%>&model=<%=model%>" id="contact">
<div id="wb_Text2" style="position:absolute;left:19px;top:20px;width:65px;height:16px;z-index:30;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Name:</span></div>
<input type="text" id="name" style="position:absolute;left:123px;top:16px;width:198px;height:23px;line-height:23px;z-index:31;" name="name" value="">
<div id="wb_Text3" style="position:absolute;left:19px;top:53px;width:72px;height:16px;z-index:32;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Phone:</span></div>
<input type="text" id="phone" style="position:absolute;left:122px;top:49px;width:198px;height:23px;line-height:23px;z-index:33;" name="phone" value="">
<div id="wb_Text4" style="position:absolute;left:19px;top:86px;width:86px;height:16px;z-index:34;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Email:</span></div>
<input type="text" id="email" style="position:absolute;left:122px;top:84px;width:198px;height:23px;line-height:23px;z-index:35;" name="email" value="">
<div id="wb_Text9" style="position:absolute;left:19px;top:187px;width:93px;height:16px;z-index:36;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Comments:</span></div>
<textarea name="comments" id="comments" style="position:absolute;left:122px;top:188px;width:198px;height:98px;z-index:37;" rows="5" cols="27"></textarea>
<input type="submit" id="Button1" name="" value="Send" style="position:absolute;left:60px;top:318px;width:96px;height:25px;z-index:38;">
<input type="reset" id="Button2" name="" value="Reset" style="position:absolute;left:208px;top:318px;width:96px;height:25px;z-index:39;">
<div id="wb_Text1" style="position:absolute;left:19px;top:125px;width:90px;height:16px;z-index:40;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Vehicle:</span></div>
<div id="wb_Text5" style="position:absolute;left:22px;top:154px;width:88px;height:16px;z-index:41;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;">Model:</span></div>
<div id="wb_Text6" style="position:absolute;left:121px;top:124px;width:208px;height:16px;z-index:42;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;"><%=vname%></span></div>
<div id="wb_Text7" style="position:absolute;left:122px;top:158px;width:201px;height:16px;z-index:43;text-align:left;">
<span style="color:#000000;font-family:Arial;font-size:13px;"><%=model%></span></div>
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