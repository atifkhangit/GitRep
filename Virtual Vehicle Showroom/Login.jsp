<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ page import ="java.sql.*" %>
<%@ page session="true" %>
 <% 
  String username=request.getParameter("username");
  String password=request.getParameter("password");
  String usertype=request.getParameter("usertype");
 
  String sql1="select username,password from ora11.vendor";
  String sql2="select username,password from ora11.administrator";
  String sql3="select username,password from ora11.reguser";
    
     Class.forName("oracle.jdbc.OracleDriver");
 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");
 PreparedStatement ps1 = con.prepareStatement(sql1); 
 ResultSet rs1=ps1.executeQuery();
  
 PreparedStatement ps2 = con.prepareStatement(sql2); 
 ResultSet rs2=ps2.executeQuery();
 
 PreparedStatement ps3 = con.prepareStatement(sql3); 
 ResultSet rs3=ps3.executeQuery();
 

  if(usertype.equals("vendor"))
  {
      while(rs1.next())
      {
          if((username.equals(rs1.getString(1)) && password.equals(rs1.getString(2)))) 
             {
                 session.setAttribute("username",username); 
                 response.sendRedirect("VendorHome.jsp");
             } 
          
      }
      
      
  }
  else if(usertype.equals("admin"))
  {
      while(rs2.next())
      {
          if((username.equals(rs2.getString(1)) && password.equals(rs2.getString(2)))) 
             {
                 session.setAttribute("username",username);                 
                 response.sendRedirect("AdminManager.jsp");
             } 
         
      }
      
  }
  else if (usertype.equals("user"))
  {
      while(rs3.next())
      {
          if((username.equals(rs3.getString(1)) && password.equals(rs3.getString(2)))) 
             {
                 session.setAttribute("username",username); 
                 response.sendRedirect("UserViewVehicle.jsp");
             } 
          
          
      }
      
  }
  else response.sendRedirect("LoginError.jsp");
  
  %>

