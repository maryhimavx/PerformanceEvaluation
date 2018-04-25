<%-- 
    Document   : feedback
    Created on : Mar 22, 2018, 9:54:38 AM
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
    
        String empName="", fID="";
        if(request.getParameter("btnsubmit") != null)
        {
            String ename=request.getParameter("selEmp");
            String feedback=request.getParameter("txtfeedback");
            String ins="insert into tbl_feedback (feedback_details,feedback_date,emp_id,hr_id) values('"+feedback+"',curdate(),'"+ename+"','"+session.getAttribute("user_id")+"')";
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
                    <td>Comments</td>
                    <td>
                        <textarea name="txtfeedback" cols="50" rows="5"></textarea>
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
