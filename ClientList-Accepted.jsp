<%-- 
    Document   : ClientList-Accepted
    Created on : Feb 7, 2018, 10:51:57 AM
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
                 String sel="select * from tbl_client where client_status='1'";
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
                        
                        
                       
                        
                    </tr>
                    <%
                    i++;
                
                 }
                %>
               </table>
            
        </form>
    </body>
</html>
