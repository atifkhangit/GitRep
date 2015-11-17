<%@ page language="java" contentType="text/html; charset=windows-1256"
        pageEncoding="windows-1256"%>
        <%@ page import="java.sql.*" %>
         <%@ page import="java.io.*" %>
<%
String imageid = request.getParameter("imgid");
Class.forName("oracle.jdbc.OracleDriver");
 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");
  
ResultSet rs = null;
PreparedStatement pstmt = null;
OutputStream oImage;
try {
pstmt = con.prepareStatement("select image from images_tab where image_id = ?");
pstmt.setString(1, imageid);
rs = pstmt.executeQuery();
    if(rs.next()) {
        byte barray[] = rs.getBytes(1);
        response.setContentType("image/jpg");
        oImage=response.getOutputStream();
        oImage.write(barray);
        oImage.flush();
        oImage.close();
    }
}
catch(Exception ex){
    //ex.printStackTrace();
}finally {
    try{
    if(con!=null)
       con.close();
    }catch(Exception ex){
       // ex.printStackTrace();
    }
}
%>
