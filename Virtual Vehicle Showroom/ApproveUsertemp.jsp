
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<% 
     Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");
   String user = request.getParameter("uname");
  String admin = request.getParameter("admin");
    
    
    String sql2= "select admin_id from administrator where username=?"; 
    String sql3 = "delete from ora11.reguser_temp where username in (select"
            + "username from ora11.reguser)";
    
    PreparedStatement st2 = con.prepareStatement(sql2); 
    PreparedStatement st3 = con.prepareStatement(sql3); 
    st2.setString(1,admin);
    ResultSet rs = st2.executeQuery();
    while(rs.next())
    {
    String adminId =rs.getString(1);
    String sql1= "insert into ora11.reguser (regid,first_name,last_name,phone,email_id,"
            + "gender,street,city,state,zipcode,country,username,password,creation_date,managed_by)"
            +"select seq_reguser.NEXTVAL,first_name,last_name,phone,email_id,gender,street,city,state,"
            + "zipcode,country,username,password,creation_date,?" + 
            " from reguser_temp where username=?";
  
    PreparedStatement st1 = con.prepareStatement(sql1); 
    st1.setString(1,adminId);
    st1.setString(2,user);
    
 int i = st1.executeUpdate();
    }
    st3.executeUpdate();
    con.commit();
    con.close();
 response.sendRedirect("AdminManager.jsp?Category=1");
         

%>
