<%@ page import="java.sql.*" %>
<%!Statement st=null;
Connection cn=null;
%>
<%
Class.forName("oracle.jdbc.OracleDriver");
           cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");
         Statement st =cn.createStatement();
%>