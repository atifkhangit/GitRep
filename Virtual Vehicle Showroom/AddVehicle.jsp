<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ page import="java.sql.*"%>

 
<%
    
String vname = ""; 
    String vmodel ="";
    String vprice ="";
    String vdescription = "";
    String uploadedBy=(String)session.getAttribute("username");
    String sql1;
    String prevModel = "";
    int imageNoSeq;
    int vendId = 0;
    File savedFile = null;    
    FileInputStream fis=null;
    sql1="select nvl(max(image_no),0) image_seq from images_tab";
    String sql2="insert into ora11.images_tab "
            + "(IMAGE_ID,IMAGE_NO,UPLOADED_BY,IMAGE,MODEL)"
            + "values(seq_image.NEXTVAL,?,?,?,?)";
    String sql3 = " select vendor_id from ora11.vendor where username=?";
    
    String sql4 ="insert into ora11.vehicle (VID,VEHICLE_NAME,MODEL,"
            + "VEHICLE_DESCRIPTION,COST,CREATION_DATE,IMAGE_ID,MANAGED_BY)"
            + "values (seq_vehicle.NEXTVAL,?,?,?,?,SYSDATE,?,?)";
    
    String sql5 ="select max(image_id) from ora11.images_tab where "
            + "uploaded_by = ?";
    
    String sql6 = " update ora11.vendor set manages = ? where vendor_id= ?";
   
   Class.forName("oracle.jdbc.OracleDriver");
 Connection cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","ora11","tiger");
 PreparedStatement ps1 = cn.prepareStatement(sql1);
 PreparedStatement ps2 = cn.prepareStatement(sql2);
 PreparedStatement ps3 =  cn.prepareStatement(sql3);
 PreparedStatement ps4 =  cn.prepareStatement(sql4);
 PreparedStatement ps5 = cn.prepareStatement(sql5);
 PreparedStatement ps6 = cn.prepareStatement(sql6);
 
 ps3.setString(1, uploadedBy);
  
 ResultSet rs=ps1.executeQuery();
 imageNoSeq = -1;
 
 

 if (rs.next()) {
   imageNoSeq = rs.getInt("image_seq");  
}
 if(imageNoSeq==0)
 {
     imageNoSeq=100;
 }
 else
 {
    imageNoSeq++; 
 }
     Statement  st=cn.createStatement();
  

try
{
String ImageFile="";
String itemName = "";
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if (!isMultipart)
{
}
else
{
FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
List items = null;
try
{
items = upload.parseRequest(request);
}
catch (FileUploadException e)
{
e.getMessage();
}
 
Iterator itr = items.iterator();
while (itr.hasNext())
{
FileItem item = (FileItem) itr.next();
if(item.isFormField())
{
    String name = item.getFieldName();
String value = item.getString();
if(name.equals("vmodel"))
{
vmodel=value;
}
if(name.equals("vname"))
{
vname=value;
}
if(name.equals("vdescription"))
{
vdescription=value;
}
if(name.equals("vprice"))
{
vprice=value;
}

}
else 
{

try
{ 
   itemName="car1.jpg";
//File savedFile1 = new File(config.getServletContext().getRealPath("/")+"/serverimages/"+itemName);
//item.write(savedFile1);
 //savedFile = new File(config.getServletContext().getRealPath("/")+"/serverimages/"+itemName);
 //item.write(savedFile);
 fis=new FileInputStream(config.getServletContext().getRealPath("/")+"/serverimages/"+itemName);
    ResultSet rs3 = ps3.executeQuery();
    
    if (rs3.next())
    {
        ps2.setInt(2, rs3.getInt(1));
         vendId = rs3.getInt(1);
    }
          //  while (rs3.next()) {
               
               
                ps2.setInt(1, imageNoSeq);
                ps2.setInt(2, rs3.getInt(1));
                ps2.setString(3,vmodel);
                  
                ps4.setString(1,vname);
                ps4.setString(2,vmodel);
                ps4.setString(3,vdescription);
                ps4.setString(4, vprice);
                ps4.setInt(6,rs3.getInt(1));
                 
                  
                  out.println(fis);
ps2.setBinaryStream(4, (InputStream)fis, (int)(savedFile.length()));
                if (itemName.length()> 1) {
        
                    ps2.executeUpdate();
                }  
              
              
                  vendId = rs3.getInt(1);
                 
            //}
             ps5.setInt(1,vendId); 
             ResultSet rs5 = ps5.executeQuery();
             while(rs5.next())
             {
                 ps4.setInt(5,rs5.getInt(1));
                 ps4.executeUpdate();
                 ps6.setInt(1,rs5.getInt(1));
                 ps6.setInt(2,vendId);
                 ps6.executeUpdate();
             }
             
             
              
              
}
catch(Exception el)
{
out.println("Inserting error"+el.getMessage());
}
}
}}
}
catch (Exception e){
out.println(e.getMessage());
}
//response.sendRedirect("VendorHome.jsp");

%>