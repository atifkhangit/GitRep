<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<% 

  Class.forName("oracle.jdbc.OracleDriver");
 Connection cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");

  String strSQL = "begin "+
" for i in (select constraint_name, table_name from user_constraints) LOOP" +
 " execute immediate 'alter table '||i.table_name||' disable constraint '||i.constraint_name||'';"
+" end loop;"
+" end;";
  
  CallableStatement  cs = cn.prepareCall(strSQL); 

 //   + "WHERE (ImageID=" + request.getParameter("imageid") + ")"; 

%> 