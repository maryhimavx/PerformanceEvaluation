<%-- 
    Document   : ClientWork
    Created on : Feb 14, 2018, 11:04:07 AM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PerformanceEvaluation: ClientWork</title>
    </head>
    <%
    
        String clientName="", wname="", description="",postDate="",budget="",estimatedEnd="",wid="";
        if(request.getParameter("btnSubmit") != null)
        {
           if(!request.getParameter("hid").equals(""))
           {
           
            String Wname=request.getParameter("txtWorkName");
            String Description=request.getParameter("txtDescription");
            String PostDate=request.getParameter("txtPostDate");
            String Budget=request.getParameter("txtBudget");
            String EstimatedEnd=request.getParameter("txtEstimatedEnd");
            String ClientID=request.getParameter("selClient");
            
            
            
            
            String upQuery="update tbl_clientwork set work_name='"+Wname+"',work_description='"+Description+"',client_id='"+session.getAttribute("user_id")+"',work_postdate='"+PostDate+"',work_budget='"+Budget+"',work_estimatedend='"+EstimatedEnd+"' where client_id='"+request.getParameter("hid")+"'";
            boolean b=obj.executeCommand(upQuery);
            if(b == true)
            {
                response.sendRedirect("ClientWork.jsp");
            }
            else
            {
                out.println(upQuery);
            }
            
           }
           else
           {
            
            String workName=request.getParameter("txtWorkName");
            String workDescription=request.getParameter("txtDescription");
            String workPostDate=request.getParameter("txtPostDate");
            String workBudget=request.getParameter("txtBudget");
            String workEstimatedEnd=request.getParameter("txtEstimatedEnd");
            String clientID=request.getParameter("selClient");
            
            
        
            String insQuery="insert into tbl_clientwork (work_name,work_description,client_id,work_postdate,work_budget,work_estimatedend,work_status,work_filename) values ('"+workName+"','"+workDescription+"','"+session.getAttribute("user_id")+"','"+workPostDate+"','"+workBudget+"','"+workEstimatedEnd+"','0','file1')";
            boolean b=obj.executeCommand(insQuery);
            if(b == true)
            {
                response.sendRedirect("ClientWork.jsp");
            }
            else
            {
                out.println(insQuery);
            }
           }
        
        }
         if(request.getParameter("delid")!=null)
       {
           String del="delete from tbl_clientwork where work_id='"+request.getParameter("delid")+"'";
           boolean b=obj.executeCommand(del);
           response.sendRedirect("ClientWork.jsp");
       
       }
       if(request.getParameter("edid")!= null)
       {
           String selQuery="select * from tbl_clientwork where work_id='"+request.getParameter("edid")+"'";
           
           ResultSet rs1=obj.selectCommand(selQuery);
           if(rs1.next())
           {
               clientName=rs1.getString("client_id");
               wname=rs1.getString("work_name");
               description=rs1.getString("work_description");
               postDate=rs1.getString("work_postdate");
               budget=rs1.getString("work_budget");
               estimatedEnd=rs1.getString("work_estimatedend");
               
           }
           
       }
       if(request.getParameter("rateid")!=null)
       {
           session.setAttribute("work", request.getParameter("rateid"));
           response.sendRedirect("Rating.jsp");
       }
    
    
    
    
    %>
    <body>
        <form method="post">
            <h2 align="center">Client's Work Details</h2>
            <input type="hidden" name="hid" value="<%=clientName%>">
            <table align="center">
               
                <tr>
                    <td>Name of the work</td>
                    <td><input type="text" name="txtWorkName" value="<%=wname%>"></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><input type="text" name="txtDescription" value="<%=description%>"></td>
                </tr>
                <tr>
                    <td>Post Date</td>
                    <td><input type="Date" name="txtPostDate" value="<%=postDate%>"></td>
                </tr>
                <tr>
                    <td>Budget</td>
                    <td><input type="text" name="txtBudget" value="<%=budget%>"></td>
                </tr>
                <tr>
                    <td>Estimated End</td>
                    <td><input type="Date" name="txtEstimatedEnd" value="<%=estimatedEnd%>"></td>
                </tr>
                <tr>
                    
                    <td align="center" ><input type="Submit" name="btnSubmit"></td>
                    <td align="center" colspan="2"><input type="Reset" name="btnSubmit"></td>
                    
                </tr>
                
                
            </table>
            <table border="1" align="center">
                
                <th>Sl.No</th>
                
                <th>Name of the work</th>
                <th>Description</th>
                <th>Post Date</th>
                <th>Budget</th>
                <th>Estimated End</th>
                
                <% 
                 int i=1;
                 String sel="select * from tbl_clientwork cw,tbl_client c where cw.client_id=c.client_id and cw.client_id="+session.getAttribute("user_id");
                 ResultSet rs=obj.selectCommand(sel);
                 while(rs.next())
                 {
                 
                %>
                
                
                    <tr>
                        <td><%=i%> </td>
                       
                        <td><%=rs.getString("work_name")%></td>
                        <td><%=rs.getString("work_description")%></td>
                        <td><%=rs.getString("work_postdate")%></td>
                        <td><%=rs.getString("work_budget")%></td>
                        <td><%=rs.getString("work_estimatedend")%></td>
                        <td><%=rs.getString("work_filename")%></td>
                        
                        <td><a href="ClientWork.jsp?delid=<%=rs.getString("work_id")%>">Delete</a></td>
                        <td><a href="ClientWork.jsp?edid=<%=rs.getString("work_id")%>">Edit</a></td>
                        <td><a href="ClientWork.jsp?rateid=<%=rs.getString("work_id")%>">Rate</a></td>
                    </tr>
                    <%
                    i++;
                
                 }
                %>
               </table>
            
        </form>
    </body>
</html>
