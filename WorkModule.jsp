<%-- 
    Document   : WorkModule
    Created on : Feb 15, 2018, 10:03:24 AM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PerformanceEvaluation:WorkModule</title>
    </head>
    <%
        String workName="",mID="",moduleName="";
        if(request.getParameter("btnsubmit") != null)
        {
          if(!request.getParameter("hid").equals(""))  
          {
             String Work=request.getParameter("selWork");
             String Module=request.getParameter("txtmodule");
             String upQuery="update tbl_workmodule set module_name='"+Module+"',work_id='"+Work+"' where module_id='"+request.getParameter("hid")+"'";
             boolean b=obj.executeCommand(upQuery);
             if(b == true)
             {
                 response.sendRedirect("WorkModule.jsp");
                 
             }
             else
             {
                 out.println(upQuery);
             }
              
          }
          else
          {
            String work=request.getParameter("selWork");
            String module=request.getParameter("txtmodule");
            
            String insQuery="insert into tbl_workmodule (module_name,module_status,work_id) values ('"+module+"','0','"+work+"')";
            boolean b=obj.executeCommand(insQuery);
            if(b == true)
            {
                response.sendRedirect("WorkModule.jsp");
            }
            else
            {
                out.println(insQuery);
            }
          }
            
            
        }
           if(request.getParameter("delid")!=null)
       {
           String del="delete from tbl_workmodule where module_id='"+request.getParameter("delid")+"'";
           boolean b=obj.executeCommand(del);
           response.sendRedirect("WorkModule.jsp");
       
       }
       if(request.getParameter("edid")!= null)
       {
           String selQuery="select * from tbl_workmodule where module_id='"+request.getParameter("edid")+"'";
           
           ResultSet rs1=obj.selectCommand(selQuery);
           if(rs1.next())
           {
               mID=rs1.getString("module_id");
               workName=rs1.getString("work_id");
               moduleName=rs1.getString("module_name");
               
           }
           
       }
    
    
    %>
    <body>
        <form method="post">
            <h2 align="center">Work Module</h2>
            <input type="hidden" name="hid" value="<%=mID%>">
            <table align="center">
                <tr>
                    <td>Work</td>
                    <td>
                        <select name="selWork">

                            <option value="0">--Select--</option>

                            <%
                                String selq = "select * from tbl_clientwork where work_status='1' ";
                                ResultSet rs1 = obj.selectCommand(selq);
                                while (rs1.next()) 
                                {
                            %>
                            <option value="<%=rs1.getString("work_id")%>" <% if (workName.equals(rs1.getString("work_id"))) 
                            {%> selected="true" <%}%>>


                                <%=rs1.getString("work_name")%></option> 
                                <%
                                    }
                                %>

                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Module</td>
                    <td><input type="text" name="txtmodule" value="<%=moduleName%>"></td>
                </tr>
               
                <tr>
                    <td align="center"><input type="submit" name="btnsubmit"></td>
                    <td colspan="2" align="center"><input type="reset" name="btnreset"></td>
                </tr>
            </table>
            <table border="1" align="center">
                 <th>Sl.No</th>
                <th>Work</th>
                <th>Module</th>
                               
                <% 
                 int i=1;
                 String sel="select * from tbl_workmodule m,tbl_clientwork c where m.work_id=c.work_id";
                 ResultSet rs=obj.selectCommand(sel);
                 while(rs.next())
                 {
                 
                %>
                
                
                    <tr>
                        <td><%=i%> </td>
                        <td><%=rs.getString("work_id")%></td>
                        <td><%=rs.getString("module_name")%></td>
                        
                        
                        <td><a href="WorkModule.jsp?delid=<%=rs.getString("module_id")%>">Delete</a></td>
                        <td><a href="WorkModule.jsp?edid=<%=rs.getString("module_id")%>">Edit</a></td>
                    </tr>
                    <%
                    i++;
                
                 }
                %>
                
                                   
            </table>
        </form>
    </body>
</html>
