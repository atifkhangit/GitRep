<%@ page import ="java.sql.*" %>
<%
    String fname = request.getParameter("fname");    
    String lname = request.getParameter("lname");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String gender = request.getParameter("gender");
    String street = request.getParameter("street");    
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String zipcode = request.getParameter("zipcode");
    String country = request.getParameter("country");
    String uname = request.getParameter("uname");
    String pass = request.getParameter("pass");
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");
    String sql;
    sql="insert into ora11.reguser_temp(first_name,last_name,phone,email_id,gender,"
            + "street,city,state,zipcode,country,"
            +"username,password,creation_date)"
            +" values (?,?,?,?,?,?,?,?,?,?,?,?,SYSDATE)";
    
    
    PreparedStatement pst = con.prepareStatement(sql);
    pst.setString(1, fname);
    pst.setString(2, lname);
    pst.setString(3, phone);
    pst.setString(4, email);
    pst.setString(5, gender);
    pst.setString(6, street);
    pst.setString(7, city);
    pst.setString(8, state);
    pst.setString(9, zipcode);
    pst.setString(10, country);
    pst.setString(11, uname);
    pst.setString(12, pass);
    pst.executeUpdate();
 
    
 pst.close();
 con.close();
  response.sendRedirect("index.html");

%>