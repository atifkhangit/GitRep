<%@ page session="true" %>
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
    String sql1;
    String sql2;
    
    String managedBy = session.getAttribute("username").toString();
    
    sql1="insert into ora11.vendor ( VENDOR_ID,FIRST_NAME,LAST_NAME,PHONE,EMAIL_ID,"
            + "STREET,CITY,STATE,ZIPCODE,COUNTRY,USERNAME,PASSWORD,CREATION_DATE,"
            + "MANAGES,MANAGED_BY)"
            +" values "
            + "(seq_vendor.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,SYSDATE,?,?)";
    sql2 = "select admin_id from ora11.administrator where username=?";
    int i=0;
    /*
    out.println(fname);
    out.println(lname);
    out.println(phone);
    out.println(email);
    out.println(street);
    out.println(city);
    out.println(state);
    out.println(zipcode);
    out.println(country);
    out.println(uname);
    out.println(pass);
    */
    
    PreparedStatement st2 = con.prepareStatement(sql2);
    st2.setString(1,managedBy);
    ResultSet rs2 = st2.executeQuery();
    while(rs2.next())
    { out.println(rs2.getInt(1));
        if(fname!=null)
        {
    PreparedStatement st = con.prepareStatement(sql1);
     st.setString(1,fname);
      st.setString(2,lname);
       st.setString(3,phone);
        st.setString(4,email);
         st.setString(5,street);
          st.setString(6,city);
          st.setString(7,state);
           st.setString(8,zipcode);
            st.setString(9,country);
             st.setString(10,uname);
              st.setString(11,pass);
                st.setInt(12,i);
               st.setInt(13,rs2.getInt(1));
     st.executeUpdate();
        }
    }
 st2.close();
 con.close();
  response.sendRedirect("AdminManager.jsp");

%>  