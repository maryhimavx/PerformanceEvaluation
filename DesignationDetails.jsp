<%-- 
    Document   : designation.jsp
    Created on : Feb 1, 2018, 11:08:21 AM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PerformanceEvaluation::Designation</title>
    </head>
    <%
        String desgId="",desgName="";      
        
        if(request.getParameter("btnsubmit") != null)
        {
           if(!request.getParameter("hid").equals(""))
           {
               String name=request.getParameter("txtdesgname");
               String upQuery="update tbl_desg set desg_name='"+name+"'where desg_id='"+request.getParameter("hid")+"'";
               boolean b=obj.executeCommand(upQuery);
               if(b == true)
               {
                   out.println("Success");
                   response.sendRedirect("DesignationDetails.jsp");
               
               }
               else
               {
                out.println(upQuery);
               
               }
               
               
           }
           else
           {           
          
            String desgname=request.getParameter("txtdesgname");
            String insQuery="insert into tbl_desg(desg_name) values ('"+desgname+"')";
                        
            boolean b=obj.executeCommand(insQuery);
            if(b == true)
            {
                out.println("success");   
                response.sendRedirect("DesignationDetails.jsp");
            }
            else
            {
                out.println(insQuery);
            }    
           }
           
        
        
        }
         if(request.getParameter("delid")!=null)
       {
           String del="delete from tbl_desg where desg_id='"+request.getParameter("delid")+"'";
           boolean b=obj.executeCommand(del);
           response.sendRedirect("DesignationDetails.jsp");
       
       }
       if(request.getParameter("edid")!= null)
       {
           String selQuery="select * from tbl_desg where desg_id='"+request.getParameter("edid")+"'";
           
           ResultSet rs1=obj.selectCommand(selQuery);
           if(rs1.next())
           {
               desgId=rs1.getString("desg_id");
               desgName=rs1.getString("desg_name");
           }
           
       }
    
    
    
    
    
    
    
    
    
    %>
    <body>
        <form method="post">
            <h1 align="center">Designation</h1>
            <input type="hidden" name="hid" value="<%=desgId%>">
            <table align="center">
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="txtdesgname"  value="<%=desgName%>"/></td>
                </tr>
                <tr>
                    <td align="center" colspan="2"><input type="submit" name="btnsubmit"></td>
                </tr>
            </table>
               <table border="1" align="center">
                
                <th>Sl.No</th>
                <th>DesignationName</th>
                <% 
                 int i=1;
                 String sel="select * from tbl_desg";
                 ResultSet rs=obj.selectCommand(sel);
                 while(rs.next())
                 {
                 
                %>
                
                
                    <tr>
                        <td><%=i%> </td>
                        <td><%=rs.getString("desg_name")%></td>
                        <td><a href="DesignationDetails.jsp?delid=<%=rs.getString("desg_id")%>">Delete</a></td>
                        <td><a href="DesignationDetails.jsp?edid=<%=rs.getString("desg_id")%>">Edit</a></td>
                    </tr>
                    <%
                    i++;
                
                 }
                %>
               </table>
            
            
            
        </form>
    </body>
</html>
