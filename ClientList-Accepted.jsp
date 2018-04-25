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
        <style>
            
/*                #customers {
                    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                    border-collapse: collapse;

                }

                #customers td, #customers th {
                    border: 1px solid #ddd;
                    padding: 8px;
                }

                #customers tr:nth-child(even){background-color: #f2f2f2;}

                #customers tr:hover {background-color: #ddd;}

                #customers th {
                    padding-top: 12px;
                    padding-bottom: 12px;
                    text-align: left;
                    background-color: #4CAF50;
                    color: white;
                }     
            */
            
            
            
            
            
           
            table {
                border-collapse: collapse;
                //width: 100%;
            }

            th, td {
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even){background-color: #f2f2f2}

            th {
                background-color:  #9fc69f;
                color: white;
            }

        </style>
    </head>
    
    <body>
        
        <form method="post">
            <table align="center" border="0" id="customers" style="box-shadow: 5px 10px 8px 2px #888888">
                <th>SL NO</th>
                <th>Name</th>
                <th>Address</th>
                <th>Contact</th>
                <th>E-Mail</th>
                    <%
                        int i = 1;
                        String sel = "select * from tbl_client where client_status='1'";
                        ResultSet rs = obj.selectCommand(sel);
                        while (rs.next()) {

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
