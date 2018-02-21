<%-- 
    Document   : Employee
    Created on : Feb 7, 2018, 2:12:42 PM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PerformanceEvaluation: EmployeeRegistration</title>
    </head>
    <body>  
        <%

            if (request.getParameter("btnsubmit") != null)
            {
                String loginID = "";
                String eName = request.getParameter("txtname");
                String eDesg = request.getParameter("selDesg");
                String eAdd = request.getParameter("txtaddress");
                String eContact = request.getParameter("txtcontact");
                String eMail = request.getParameter("txtemail");
                String eDob = request.getParameter("txtdob");
                String eDoj = request.getParameter("txtdoj");
                String eUname = request.getParameter("txtuname");
                String ePassword = request.getParameter("txtpassword");
                //   String =request.getParameter("");
                

                String insQuery1 = "insert into tbl_login (login_uname,login_password,login_utype) values('" + eUname + "','" + ePassword + "','emp')";
                boolean b = obj.executeCommand(insQuery1);
                 //out.println(eDesg);
                if(b==true)
                {

                String selQuery1 = "select max(login_id) as login from tbl_login";
                ResultSet rs1 = obj.selectCommand(selQuery1);
                    if (rs1.next()) 
                    {
                     loginID = rs1.getString("login");
                    }
                String insQuery2="insert into tbl_emp (emp_name,emp_address,emp_contact,emp_dob,emp_doj,emp_email,desg_id,login_id) values ('"+eName+"','"+eAdd+"','"+eContact+"','"+eDob+"','"+eDoj+"','"+eMail+"','"+eDesg+"','"+loginID+"')";
                obj.executeCommand(insQuery2);
                //insert into tbl_emp (emp_name,emp_address,emp_contact,emp_dob,emp_doj,emp_email,desg_id,login_id)
                }
              
               
            }


        %>

        <form method="post">
            <h1 align="center">Employee Registration</h1>

            <table align="center">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtname" ></td>
                </tr>
                <tr>
                    <td>Designation</td>
                    <td>
                        <select name="selDesg">
                            <option value="sel">--Select--</option>
                            <%
                                  String sel="select * from tbl_desg";
                                  ResultSet rs=obj.selectCommand(sel);
                                  while(rs.next())
                                  {
                                      %>
                              
                                      <option value="<%=rs.getString("desg_id")%>"><%=rs.getString("desg_name")%></option>
                                      
                                      <%
                                  }
                                      
                                  
                                          
                            
                            
                            
                            %>
                            
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="txtaddress" ></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><input type="text" name="txtcontact" ></td>
                </tr>
                <tr>
                    <td>Email Id</td>
                    <td><input type="text" name="txtemail" ></td>
                </tr>
                <tr>
                    <td>Date of Birth</td>
                    <td><input type="date" name="txtdob" ></td>

                </tr>
                <tr>
                    <td>Date of Join</td>
                    <td><input type="date" name="txtdoj"></td>
                </tr>
                <tr>
                    <td>Username</td>
                    <td><input type="text" name="txtuname"/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="text" name="txtpassword"/></td>
                </tr>


                <tr>
                    <td align="center" colspan="2"><input type="submit" name="btnsubmit"></td>
                </tr>
            </table>

        </form>
    </body>
</html>
