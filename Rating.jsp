<%-- 
    Document   : Rating
    Created on : Apr 11, 2018, 10:03:25 AM
    Author     : user
--%>


<jsp:useBean id="obj" class="DB.ConnectionClass"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
    
        String empName="", fID="",moduleName="";
        if(request.getParameter("btnsubmit") != null)
        {
            String ename=request.getParameter("selEmp");
            String rating=request.getParameter("txtfeedback");
            String module=request.getParameter("selModule");
            String ins="insert into tbl_rating (rating_value,emp_id,module_id) values('"+rating+"','"+module+"','"+ename+"')";
            boolean b=obj.executeCommand(ins);
            
            
        }
    
    %>
    <body>
        <h2 align="center">Comments</h2>
        <form method="post">
            <input type="hidden" name="hid" value="<%=fID%>" >
            <table align="center">
                <tr>
                    <td>Employee</td>
                    <td>
                         <select name="selEmp">

                            <option value="0">--Select--</option>

                            <%
                                String selq = "select * from tbl_emp";
                                ResultSet rs1 = obj.selectCommand(selq);
                                while (rs1.next()) 
                                {
                            %>
                            <option value="<%=rs1.getString("emp_id")%>" <% if (empName.equals(rs1.getString("emp_id"))) 
                            {%> selected<%}%>>


                                <%=rs1.getString("emp_name")%></option> 
                                <%
                                    }
                                %>

                        </select>
                    </td>
                </tr>
                 <tr>
                    <td>Module</td>
                    <td>
                          <select name="selModule">

                            <option value="0">--Select--</option>

                            <%
                                String selq1 = "select * from tbl_workmodule";
                                ResultSet rs2 = obj.selectCommand(selq1);
                                while (rs2.next()) 
                                {
                            %>
                            <option value="<%=rs2.getString("module_id")%>" <% if (moduleName.equals(rs2.getString("module_id"))) 
                            {%> selected <%}%>>


                                <%=rs2.getString("module_name")%></option> 
                                <%
                                    }
                                %>

                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Rating</td>
                    <td>
                        <input type="text" name="txtfeedback">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsubmit">
                    <input type="reset" name="btnreset"></td>
                </tr>
            </table>
        </form>
    </body>
</html>

