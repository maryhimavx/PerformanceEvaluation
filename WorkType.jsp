<%-- 
    Document   : worktype
    Created on : Feb 1, 2018, 12:22:44 PM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PerformanceEvaluation: WorkType</title>
    </head>
      <%
        String typeId="",typeName="";      
        
        if(request.getParameter("btnsubmit") != null)
        {
           if(!request.getParameter("hid").equals(""))
           {
               String name=request.getParameter("txttypename");
               String upQuery="update tbl_worktype set type_name='"+name+"'where type_id='"+request.getParameter("hid")+"'";
               boolean b=obj.executeCommand(upQuery);
               if(b == true)
               {
                   out.println("Success");
                   response.sendRedirect("WorkType.jsp");
               }
               else
               {
                out.println(upQuery);
               
               }
               
               
           }
           else
           {           
          
            String typename=request.getParameter("txttypename");
            String insQuery="insert into tbl_worktype (type_name) values ('"+typename+"')";
                        
            boolean b=obj.executeCommand(insQuery);
            if(b == true)
            {
                out.println("success"); 
                response.sendRedirect("WorkType.jsp");
            }
            else
            {
                out.println(insQuery);
            }    
           }
           
        
        
        }
         if(request.getParameter("delid")!=null)
       {
           String del="delete from tbl_worktype where type_id='"+request.getParameter("delid")+"'";
           boolean b=obj.executeCommand(del);
           response.sendRedirect("WorkType.jsp");
       
       }
       if(request.getParameter("edid")!= null)
       {
           String selQuery="select * from tbl_worktype where type_id='"+request.getParameter("edid")+"'";
           
           ResultSet rs1=obj.selectCommand(selQuery);
           if(rs1.next())
           {
               typeId=rs1.getString("type_id");
               typeName=rs1.getString("type_name");
           }
           
       }
    
    
    
    
    
    
    
    
    
    %>
    <body>
        <form method="post">
            <h1 align="center">Work Type</h1>
            <input type="hidden" name="hid" value="<%=typeId%>">
            <table align="center">
                <tr>
                    <td>WorkType</td>
                    <td><input type="text" name="txttypename"  value="<%=typeName%>"/></td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><input type="submit" name="btnsubmit"></td>
                </tr>
            </table>
               <table border="1" align="center">
                
                <th>Sl.No</th>
                <th>WorkType</th>
                <% 
                 int i=1;
                 String sel="select * from tbl_worktype";
                 ResultSet rs=obj.selectCommand(sel);
                 while(rs.next())
                 {
                 
                %>
                
                
                    <tr>
                        <td><%=i%> </td>
                        <td><%=rs.getString("type_name")%></td>
                        <td><a href="WorkType.jsp?delid=<%=rs.getString("type_id")%>">Delete</a></td>
                        <td><a href="WorkType.jsp?edid=<%=rs.getString("type_id")%>">Edit</a></td>
                    </tr>
                    <%
                    i++;
                
                 }
                %>
               </table>
            
            
            
        </form>
    </body>
</html>
