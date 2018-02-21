<%-- 
    Document   : WorkApproval
    Created on : Feb 15, 2018, 11:35:13 AM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PerformanceEvaluation:Work-Approval</title>
    </head>
    <%
       
         if(request.getParameter("aid")!=null)
       {
      
           // out.println(request.getParameter("aid"));
           String upQuery1="update tbl_clientwork set work_status='1' where work_id='"+request.getParameter("aid")+"'";
           boolean b=obj.executeCommand(upQuery1);
           if(b == true)
           {
               response.sendRedirect("WorkApproval.jsp");
           }
           else
           {
               out.println(upQuery1);
           }
           
       }
       if(request.getParameter("rid")!= null)
       {
            
          String upQuery2="update tbl_clientwork set work_status='2' where work_id='"+request.getParameter("rid")+"'";
           boolean b=obj.executeCommand(upQuery2);
           
            if(b == true)
           {
               response.sendRedirect("WorkApproval.jsp");
           }
           else
           {
               out.println(upQuery2);
           }
           
           
       }
    
    
    
    
    
    %>
    <body>
        <form method="post">
             <table border="1" align="center">
                
                <th>Sl.No</th>
                <th>Client</th>
                <th>Name of the work</th>
                <th>Description</th>
                <th>Post Date</th>
                <th>Budget</th>
                <th>Estimated End</th>
                <th>Specification</th>
                
                <% 
                 int i=1;
                 String sel="select * from tbl_clientwork cw,tbl_client c where cw.client_id=c.client_id and work_status='0'";
                 ResultSet rs=obj.selectCommand(sel);
                 while(rs.next())
                 {
                 
                %>
                
                
                    <tr>
                        <td><%=i%> </td>
                        <td><%=rs.getString("client_name")%></td>
                        <td><%=rs.getString("work_name")%></td>
                        <td><%=rs.getString("work_description")%></td>
                        <td><%=rs.getString("work_postdate")%></td>
                        <td><%=rs.getString("work_budget")%></td>
                        <td><%=rs.getString("work_estimatedend")%></td>
                        <td><%=rs.getString("work_filename")%></td>
                        
                        <td><a href="WorkApproval.jsp?aid=<%=rs.getString("work_id")%>">Accept</a></td>
                        <td><a href="WorkApproval.jsp?rid=<%=rs.getString("work_id")%>">Reject</a></td>
                    </tr>
                    <%
                    i++;
                
                 }
                %>
               </table>
               
            
        </form>
    </body>
</html>
