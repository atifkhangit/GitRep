<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<HTML>
<HEAD>
<TITLE>Vendor Page</TITLE>
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
      <b> Please select an option from menu</b>      
    </td>
</TABLE>
  </body>
</html>