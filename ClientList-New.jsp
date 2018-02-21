<%-- 
    Document   : ClientList-New
    Created on : Feb 7, 2018, 10:51:37 AM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
       
         if(request.getParameter("aid")!=null)
       {
      
           // out.println(request.getParameter("aid"));
           String upQuery1="update tbl_client set client_status='1' where client_id='"+request.getParameter("aid")+"'";
           boolean b=obj.executeCommand(upQuery1);
           if(b == true)
           {
               response.sendRedirect("ClientList-New.jsp");
           }
           else
           {
               out.println(upQuery1);
           }
           
          
           
          
           
       
       }
       if(request.getParameter("rid")!= null)
       {
            
          String upQuery2="update tbl_client set client_status='2' where client_id='"+request.getParameter("rid")+"'";
           boolean b=obj.executeCommand(upQuery2);
           
            if(b == true)
           {
               response.sendRedirect("ClientList-New.jsp");
           }
           else
           {
               out.println(upQuery2);
           }
           
           
       }
    
    
    
    
    
    %>
    <body>
        <form method="post">
            <table align="center" border="1">
                <th>SL NO</th>
                
                 <th>Name</th>
                <th>Address</th>
                <th>Contact</th>
                <th>E-Mail</th>
                <% 
                 int i=1;
                 String sel="select * from tbl_client where client_status='0'";
                 ResultSet rs=obj.selectCommand(sel);
                 while(rs.next())
                 {
                 
                %>
                
                
                    <tr>
                        <td><%=i%> </td>
                        <td><%=rs.getString("client_name")%></td>
                        <td><%=rs.getString("client_address")%></td>
                        <td><%=rs.getString("client_contact")%></td>
                        <td><%=rs.getString("client_email")%></td>
                        <td><a href="ClientList-New.jsp?aid=<%=rs.getString("client_id")%>">Approve</a></td><br>
                        <td><a href="ClientList-New.jsp?rid=<%=rs.getString("client_id")%>">Reject</a></td>
                        
                       
                        
                    </tr>
                    <%
                    i++;
                
                 }
                %>
               </table>
                
            
               
            
        </form>
    </body>
</html>
