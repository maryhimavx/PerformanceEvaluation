<%-- 
    Document   : fileUploadDataset
    Created on : Apr 12, 2018, 11:22:59 AM
    Author     : user
--%>

<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center">Upload File</h1>
            
    <form name="frm_adc" action="uploadActionDataset.jsp" method="post" enctype="multipart/form-data">

        <table align="center">
            
            <tr>
                <td>Upload file</td>
                <td><input type="file" name="txtdataset"></td>
                    
            </tr>
            <tr>
                
                <td><input type="submit" name="btnsub"></td>
                    
            </tr>
        </table>
        </form>
    </body>
</html>
