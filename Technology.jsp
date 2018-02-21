<%-- 
    Document   : Technology
    Created on : Feb 7, 2018, 11:00:34 AM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PerformanceEvaluation: Technology</title>
        
        
        
    </head>
    <%
        String techId="",techName="";      
        
        if(request.getParameter("btnsubmit") != null)
        {
           if(!request.getParameter("hid").equals(""))
           {
               String name=request.getParameter("txttechnology");
               String upQuery="update tbl_technology set tech_name='"+name+"'where tech_id='"+request.getParameter("hid")+"'";
               boolean b=obj.executeCommand(upQuery);
               if(b == true)
               {
                   out.println("Success");
                   response.sendRedirect("Technology.jsp");
               }
               else
               {
                out.println(upQuery);
               
               }
               
               
           }
           else
           {
               
          
            String techname=request.getParameter("txttechnology");
            String insQuery="insert into tbl_technology(tech_name) values ('"+techname+"')";
                        
            boolean b=obj.executeCommand(insQuery);
            if(b == true)
            {
                out.println("success"); 
                response.sendRedirect("Technology.jsp");
            }
            else
            {
                out.println(insQuery);
            }    
           }
           
        
        
        }
         if(request.getParameter("delid")!=null)
       {
           String del="delete from tbl_technology where tech_id='"+request.getParameter("delid")+"'";
           boolean b=obj.executeCommand(del);
           response.sendRedirect("Technology.jsp");
       
       }
       if(request.getParameter("edid")!= null)
       {
           String selQuery="select * from tbl_technology where tech_id='"+request.getParameter("edid")+"'";
           
           ResultSet rs1=obj.selectCommand(selQuery);
           if(rs1.next())
           {
               techId=rs1.getString("tech_id");
               techName=rs1.getString("tech_name");
           }
           
       }
    
    
    
    
    
    
    
    
    
    %>
    
    
    <body>
        <form method="post">
             <h1 align="center">Technology</h1>
              <input type="hidden" name="hid" value="<%=techId%>">
             <table align="center">
                 <tr>
                     <td>Technology</td>
                     <td><input type="text" name="txttechnology" value="<%=techName%>"></td>
                 </tr>
                 <tr>
                     <td align="center" colspan="2"><input type="submit" name="btnsubmit"></td>
                 </tr>
             </table>
              <table border="1" align="center">                
                <th>Sl.No</th>
                <th>Technology</th>
                <% 
                 int i=1;
                 String sel="select * from tbl_technology";
                 ResultSet rs=obj.selectCommand(sel);
                 while(rs.next())
                 {
                 
                %>
                
                
                    <tr>
                        <td><%=i%> </td>
                        <td><%=rs.getString("tech_name")%></td>
                        <td><a href="Technology.jsp?edid=<%=rs.getString("tech_id")%>">Edit</a></td>
                        <td><a href="Technology.jsp?delid=<%=rs.getString("tech_id")%>">Delete</a></td>
                        
                         
                    </tr>
                    <%
                    i++;
                
                 }
                %>
               </table>
            
        </form>
    </body>
</html>
