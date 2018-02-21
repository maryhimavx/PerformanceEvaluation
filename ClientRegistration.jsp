<%-- 
    Document   : ClientRegistration
    Created on : Feb 7, 2018, 10:50:50 AM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PerformanceEvaluation:ClientRegistration</title>
    </head>
    <body>
        <%
            if (request.getParameter("btnsubmit") != null) 
            {
                String loginID = "";
                String Name = request.getParameter("txtname");
                String Add = request.getParameter("txtadd");
                String Contact = request.getParameter("txtcontact");
                String Mail = request.getParameter("txtemail");
                String Uname = request.getParameter("txtuname");
                String Password = request.getParameter("txtpassword");
                //String =request.getParameter("");

                String insQuery1 = "insert into tbl_login (login_uname,login_password,login_utype) values('" + Uname + "','" + Password + "','clent')";
                boolean b = obj.executeCommand(insQuery1);
                //out.println(eDesg);
                if (b == true) 
                {

                    String selQuery1 = "select max(login_id) as login from tbl_login";
                    ResultSet rs1 = obj.selectCommand(selQuery1);
                    if (rs1.next()) 
                    {
                        loginID = rs1.getString("login");
                    }
                    String insQuery2 = "insert into tbl_client(client_name,client_address,client_contact,client_email,login_id,client_status) values('"+Name+"','"+Add+"','"+Contact+"','"+Mail+"','"+loginID+"','0')";
                    
                    obj.executeCommand(insQuery2);
                    //insert into tbl_emp (emp_name,emp_address,emp_contact,emp_dob,emp_doj,emp_email,desg_id,login_id)
                }

            }


        %>
        <form method="post">

            <h1 align="center">CLIENT REGISTRATION</h1>
            <table align="center">
                <tr>
                    <td> Name</td>
                    <td><input type="text" name="txtname"></td>
                </tr>
                <tr>
                    <td> Address</td>
                    <td><input type="text" name="txtadd"></td>
                </tr>
                <tr>
                    <td>Contact </td>
                    <td><input type="text" name="txtcontact"></td>
                </tr>
                <tr>
                    <td>Email </td>
                    <td><input type="text" name="txtemail"></td>
                </tr>
                <tr>
                    <td>User Name </td>
                    <td><input type="text" name="txtuname"></td>
                </tr>
                <tr>
                    <td>Password </td>
                    <td><input type="text" name="txtpassword"></td>
                </tr>


                <tr>
                    <td align="center" colspan="2"><input type="submit" name="btnsubmit"></td>
                </tr>
            </table>

        </form>
    </body>
</html>
