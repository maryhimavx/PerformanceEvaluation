<%-- 
    Document   : ViewEmployee
    Created on : 23 Apr, 2018, 10:23:38 AM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Employee</title>
    </head>
    <body>
       
        <form>
            <%
            
                if(request.getParameter("btnsubmit")!=null)
                {
                    String phase=request.getParameter("ddlphase");
                    session.setAttribute("phase", phase);
                    response.sendRedirect("EmployeeValidation.jsp");
                }
                
            if(request.getParameter("empid")!=null)
            {
                session.setAttribute("emp", request.getParameter("empid"));
                %>
                <br>
                <br>
                <table align="center" border="1">
                    <tr>
                    <th>Select Phase</th>
                    <td>
                        <select name="ddlphase" required="">
                            <option value="">--select--</option>
                            <%
                            String sel="select * from tbl_phase";
                            ResultSet rs=obj.selectCommand(sel);
                            while(rs.next())
                            {
                                %>
                                <option value="<%=rs.getString("phase_id")%>"><%=rs.getString("phase_name")%></option>
                                <%
                            }
                            %>
                        </select>
                    </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <input type="submit" name="btnsubmit" value="Submit">
                        </td>
                       </tr>
                </table>
                <%
            }
            
            
            %>
            <br>
            <br>
            <!--select emp_id,emp_name,emp_address,emp_contact,emp_dob,emp_doj,emp_email,desg_name,-->
            <table align="center" border="1">
                <tr>
                    <th>S.No</th>
                    <th>Employee Name</th>
                    <th>Contact</th>
                    <th>Email</th>
                    <th>Designation</th>
                    <th>Date of Join</th>
                    <th>Date of Birth</th>
                    <th>Address</th>
                </tr>
                <%
                    int i=0;
                    String sel="select emp_id,emp_name,emp_address,emp_contact,emp_dob,emp_doj,emp_email,desg_name from tbl_emp e inner join tbl_desg d on e.desg_id=d.desg_id";
                    ResultSet rs=obj.selectCommand(sel);
                    while(rs.next())
                    {
                     i++;
                        %>
                        <tr>
                            <td><%=i%></td>
                            <td><%=rs.getString("emp_name")%></td>
                            <td><%=rs.getString("emp_contact")%></td>
                            <td><%=rs.getString("emp_email")%></td>
                            <td><%=rs.getString("desg_name")%></td>
                            <td><%=rs.getString("emp_doj")%></td> 
                            <td><%=rs.getString("emp_dob")%></td>
                            <td><%=rs.getString("emp_address")%></td>
                            <td><a href="ViewEmployee.jsp?empid=<%=rs.getString("emp_id")%>">Validate Employee</a></td> 
                              
                        </tr>
                        <%
                    }
                %>
                
            </table>
        </form>
    </body>
</html>
