<%-- 
    Document   : uploadActionDataset
    Created on : Apr 12, 2018, 11:25:43 AM
    Author     : user
--%>

<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>



<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FamilyCourt::upload</title>
    </head>
    <body>
        <%
            
            String field_name="";
        FileItem f_item=null;
String file_name="";

File savedFile=null;
String fn="",pf="",file_path="";

String field[] = new String[20];
String value[]=new String[20];

//checking if request cotains multipart data
boolean isMultipart=ServletFileUpload.isMultipartContent(request);

if(isMultipart)
{
    System.out.println("ifff");

    FileItemFactory factory=new DiskFileItemFactory();
    ServletFileUpload upload=new ServletFileUpload(factory);

    //declaring a list of form fields
    List items_list=null;

    //assigning fields to list 'items_list'
    try
    {
    items_list=upload.parseRequest(request);
    }
    catch(FileUploadException ex)
    {
        out.println(ex);
    }

          //declaring iterator
   Iterator itr=items_list.iterator();
    int k=0;
    //iterating through the list 'items_list'
    while(itr.hasNext())
    {
        System.out.println("ifff 1");
        //typecasting next element in items_list as fileitem
        f_item=(FileItem)itr.next();

        //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
       if(f_item.isFormField())
        {
          System.out.println("ifff 2");
            //getting fieldname and value
            field[k]=f_item.getFieldName();
            value[k]=f_item.getString();
                System.out.println(k+" "+value[k]);
                k++;
        }
       else
       {
		   
		   
            //f_item=(FileItem)itr.next();
            
           file_name=f_item.getName();
           field_name=f_item.getFieldName();
           if(field_name.equals("txtdataset"))//name of file in fileUpload
           {
           String ext=file_name.substring(file_name.lastIndexOf("."));
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
             file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Admin\\txtdataset\\";
            Random r=new Random();
             int r_num=r.nextInt(1111)+999;
            
            fn="Dataset_"+r_num+ext;
            //creating a file object
            savedFile=new File(file_path+fn);
            try
            {
                //writing the file object
                f_item.write(savedFile);               
                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }
           
           
          
           
       }
           
           }
    //Strinh str1="insert into tbl_use
    
   
  String str1="insert into tbl_dataset (ds_dataset)values('"+fn+"')";
   System.out.println(str1);
   out.println(str1);
   
    boolean status=obj.executeCommand(str1);
    
    if(status==true)
    {
        
      %> 
       <script type="text/javascript">
            alert("Upload Successfully..");
            setTimeout(function(){window.location.href='fileUploadDataset.jsp'},100);
        </script>
     <%
    }
    }

//    else
//    {
//        %>
<!--//        <script>-->
<!--//            alert("Check the password entered");-->
<!--//        </script>-->
        <%
//    }
    // }   


      

        %>
      
             
    </body>
</html>
