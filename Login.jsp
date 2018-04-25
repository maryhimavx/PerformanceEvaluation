<%-- 
    Document   : Login
    Created on : Feb 7, 2018, 10:52:40 AM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="guest_header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    
     
    <body>
         <%
        String type = "", status = "", uid = "";
            if (request.getParameter("btnloginsubmit") != null) 
            {

                String uname = request.getParameter("txtusername");
                String password = request.getParameter("txtpassword");

                String selQuery = "select * from tbl_login where login_uname='" + uname + "' and login_password='" + password + "'";

                ResultSet rs = obj.selectCommand(selQuery);
                if (rs.next()) 
                {
                    uid = rs.getString("login_id");

                    type = rs.getString("login_utype");
                    if (type.equals("admin")) 
                    {
                        response.sendRedirect("../Admin/HomePage.jsp");

                    } 
                    else if (type.equals("hr")) 
                    {

                        String selQuery1 = "select * from tbl_hr where login_id='" + uid + "'";

                        ResultSet rs1 = obj.selectCommand(selQuery1);
                        if (rs1.next()) 
                        {
                            session.setAttribute("user_id", rs1.getString("hr_id"));
                            response.sendRedirect("../HR/HomePage.jsp");
                        }
                    } 
                    else if (type.equals("emp")) 
                    {
                        String selQuery2 = "select * from tbl_emp where login_id='" + uid + "'";

                        ResultSet rs2 = obj.selectCommand(selQuery2);
                        if (rs2.next()) 
                        {
                            session.setAttribute("user_id", rs2.getString("emp_id"));
                            response.sendRedirect("../Employee/HomePage.jsp");
                        }

                    } 
                    else if (type.equals("client")) 
                    {
                        String selQuery1 = "select * from tbl_client where login_id='" + uid + "'and client_status='1'";
                        ResultSet rs1 = obj.selectCommand(selQuery1);
                        if (rs1.next())
                        {
                            session.setAttribute("user_id", rs1.getString("client_id"));
                            response.sendRedirect("../Client/HomePage.jsp");
                        }
                       

                    }

                } 
                else 
                {
                    %>
                    <script>
                        alert("Unauthorized access")
                    </script>
                    <%
                    //status = "Invalid username/password!!";
                   
                }

            }


    
    
    
    
    %>
   
        
        <form method="post">
            <h1 align="center">Login</h1>
            <div>
            <table align="center">
            <tr>
                
                <td >User Name</td>
                <td><input type="text"    name="txtusername"></td>
            </tr>
            <tr>
                <td >Password</td>
                <td><input type="text"  name="txtpassword"></td>
            </tr>
            <tr>
                <td align="center" colspan="2"><input type="submit" class="button" value="LOGIN" name="btnloginsubmit"></td>
            </tr>
        </table>
            </div>
            
        </form>
             
     </body>
       
    
</html>
<%@include file="guest_footer.jsp" %>