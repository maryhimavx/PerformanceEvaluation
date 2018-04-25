<%-- 
    Document   : AlgSection
    Created on : Apr 20, 2018, 11:14:08 AM
    Author     : user
--%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="sentimentalanalysis.PESentimentAnalysis" %>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Algorithm Section</title>
    </head>
    <body>
        <%
        
            
            //Phrase dictionary
            
            String name="";
            String sel="select ds_dataset from tbl_dataset";
            ResultSet rs=obj.selectCommand(sel);
            if(rs.next())
            {
               name=rs.getString("ds_dataset");
            }
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\Admin\\txtdataset\\";
            PESentimentAnalysis pes=new PESentimentAnalysis();
            String filepath=file_path+name;
            System.out.println("path2222"+filepath);
            filepath = filepath.replace('\\', '/');
                    //replace("\\", "//")
//             System.out.println("path222211111"+filepath);
              filepath = filepath.replace("/", "//");
              
               System.out.println("path33333333"+filepath);
           pes.getData(filepath);
        
        %>
    </body>
</html>
