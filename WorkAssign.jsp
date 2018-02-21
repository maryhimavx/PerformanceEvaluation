<%-- 
    Document   : WorkAssign
    Created on : Feb 15, 2018, 1:32:54 PM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PerformanceEvaluation: Work-Assign</title>
    </head>
    <%
        String empName="",moduleName="",deadLine="",actualDate="",AssignID="";
        if(request.getParameter("btnsubmit")!= null)
        {
           if(!request.getParameter("hid").equals(""))
           {
              String Name=request.getParameter("selEmp");
              String mName=request.getParameter("selModule");
              String deadline=request.getParameter("txtdeadline");
              String actualend=request.getParameter("txtactualdate");
              
              String upQuery="update tbl_workassign set emp_id='"+Name+"',module_id='"+mName+"',assign_deadline='"+deadline+"',assign_actualend='"+actualend+"' where assign_id='"+request.getParameter("hid")+"'";
              boolean b=obj.executeCommand(upQuery);
              if(b==true)
              {
                  response.sendRedirect("WorkAssign.jsp");
              }
              else
              {
                  out.println(upQuery);
              }
               
           }
           else
           {
            String EmpName=request.getParameter("selEmp");
            String ModName=request.getParameter("selModule");
            String DeadLine=request.getParameter("txtdeadline");
            String ActualEnd=request.getParameter("txtactualdate");
            
            String insQuery="insert into tbl_workassign (assign_date,emp_id,module_id,assign_status,assign_deadline,assign_actualend) values(curdate(),'"+EmpName+"','"+ModName+"','0','"+DeadLine+"','"+ActualEnd+"')";
            boolean b=obj.executeCommand(insQuery);
            if(b == true)
            {
                out.println("success"); 
                response.sendRedirect("WorkAssign.jsp");
            }
            else
            {
                out.println(insQuery);
            }
           }
            
        }
            if(request.getParameter("delid")!=null)
       {
           String del="delete from tbl_workassign where assign_id='"+request.getParameter("delid")+"'";
           boolean b=obj.executeCommand(del);
           response.sendRedirect("WorkAssign.jsp");
       
       }
       if(request.getParameter("edid")!= null)
       {
           String selQuery="select * from tbl_workassign where assign_id='"+request.getParameter("edid")+"'";
           
           ResultSet rs1=obj.selectCommand(selQuery);
           if(rs1.next())
           {
               AssignID=rs1.getString("assign_id");
               empName=rs1.getString("emp_id");
               moduleName=rs1.getString("module_id");
              
               deadLine=rs1.getString("assign_deadline");
               actualDate=rs1.getString("assign_actualend");
           }
           
       }
    
        
        
        
        
    
    
    
    
    
    %>
    <body>
        <form method="post">
            <input type="hidden" name="hid" value="<%=AssignID%>">
            <h2 align="center">Work Assign</h2>
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
                            {%> selected="true" <%}%>>


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
                            {%> selected="true" <%}%>>


                                <%=rs2.getString("module_name")%></option> 
                                <%
                                    }
                                %>

                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Dead line</td>
                    <td><input type="date" name="txtdeadline" value="<%=deadLine%>"></td>
                </tr>
                <tr>
                    <td>Actual End</td>
                    <td><input type="date" name="txtactualdate" value="<%=actualDate%>"></td>
                </tr>
                <tr>
                    <td><input align="center" type="submit" name="btnsubmit"></td>
                    <td align="center" colspan="2"><input type="reset" name="btnreset"></td>
                </tr>
                              
            </table>
                 <table border="1" align="center">
                
                <th>Sl.No</th>
                <th>Employee</th>
                <th>Module</th>
                <th>Dead line</th>
                <th>Actual End</th>
                
                    
                <% 
                 int i=1;
                 String sel="select * from tbl_emp e,tbl_workmodule m, tbl_workassign a where a.emp_id=e.emp_id and a.module_id=m.module_id";
                 ResultSet rs=obj.selectCommand(sel);
                 while(rs.next())
                 {
                 
                %>
                
                
                    <tr>
                        <td><%=i%> </td>
                        <td><%=rs.getString("emp_name")%></td>
                        <td><%=rs.getString("module_name")%></td>
                        <td><%=rs.getString("assign_deadline")%></td>
                        <td><%=rs.getString("assign_actualend")%></td>
                        
                        <td><a href="WorkAssign.jsp?delid=<%=rs.getString("assign_id")%>">Delete</a></td>
                        <td><a href="WorkAssign.jsp?edid=<%=rs.getString("assign_id")%>">Edit</a></td>
                    </tr>
                    <%
                    i++;
                
                 }
                %>
               </table>
            
        </form>
    </body>
</html>
