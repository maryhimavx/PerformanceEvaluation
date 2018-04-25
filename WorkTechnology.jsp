<%-- 
    Document   : Specialization
    Created on : Feb 21, 2018, 11:10:07 AM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PerformanceEvaluation: WorkTechnology</title>
       
        
        
        <script src="jq.js" type="text/javascript"></script>
        
        <script>
            function checkCount(t,w)
            {
                //alert(t+"&"+w);  
         
                $.ajax({url: "ajax_WorkTechnology.jsp?id="+t+"&work="+w, success: function(result)
                {
               
                    var x=result.trim();
                  //  alert(x);
                    if(x>0)
                    {
                        alert('Already Existing');
                        $('#sub').attr('disabled', true);
                       


                    }
                    else
                    {
                         
                        
                    //    alert('inside else');
                        $('#sub').attr('disabled', false);
                       
                    }
            
            
            
                }});
            }
         </script>
    </head>
    <%
        String workName="",techName="",wtechID="",techCount="";
    
          if(request.getParameter("btnsubmit")!= null)
          {
            
            
           if(!request.getParameter("hid").equals(""))
           {
              String WorkName=request.getParameter("selWork");
              String TechName=request.getParameter("selTech");
              
              String upQuery="update tbl_worktechnology set work_id='"+WorkName+"',tech_id='"+TechName+"' where worktech_id='"+request.getParameter("hid")+"'";
              boolean b=obj.executeCommand(upQuery);
              if(b==true)
              {
                  response.sendRedirect("WorkTechnology.jsp");
              }
              else
              {
                  out.println(upQuery);
              }
               
           }
           else
           {
            String work=request.getParameter("selWork");
            String tech=request.getParameter("selTech");
            
            
            String insQuery="insert into tbl_worktechnology (work_id,tech_id) values('"+work+"','"+tech+"')";
            boolean b=obj.executeCommand(insQuery);
            if(b == true)
            {
               // out.println("success"); 
                response.sendRedirect("WorkTechnology.jsp");
            }
            else
            {
                out.println(insQuery);
            }
           }
            
        }
            if(request.getParameter("delid")!=null)
       {
           String del="delete from tbl_worktechnology where worktech_id='"+request.getParameter("delid")+"'";
           boolean b=obj.executeCommand(del);
           response.sendRedirect("WorkTechnology.jsp");
       
       }
       if(request.getParameter("edid")!= null)
       {
           String selQuery="select * from tbl_worktechnology where worktech_id='"+request.getParameter("edid")+"'";
           
           ResultSet rs1=obj.selectCommand(selQuery);
           if(rs1.next())
           {
             wtechID=rs1.getString("worktech_id");
               workName=rs1.getString("work_id");
               techName=rs1.getString("tech_id");
              
               
               
           }
           
       }
    
        
        
    
    
    
    
    %>
    <body>
        <form method="post">
            <h2 align="center">Work Technology</h2>
            <input type="hidden" name="hid" value="<%=wtechID%>">
            <table align="center">
                <tr>
                    <td>Work</td>
                    <td>
                        <select name="selWork" >

                            <option>--Select--</option>

                            <%
                                String selq1 = "select * from tbl_clientwork where client_id="+session.getAttribute("user_id");
                                ResultSet rs2 = obj.selectCommand(selq1);
                                while (rs2.next()) 
                                {
                            %>
                            <option value="<%=rs2.getString("work_id")%>" <% if (workName.equals(rs2.getString("work_id"))) 
                            {%> selected="true" <%}%>>


                                <%=rs2.getString("work_name")%></option> 
                                <%
                                    }
                                %>

                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Technology</td>
                    <td>
                          <select name="selTech" onchange="checkCount(this.value,selWork.value)">

                            <option>--Select--</option>

                            <%
                                String selq2 = "select * from tbl_technology";
                                ResultSet rs3 = obj.selectCommand(selq2);
                                while (rs3.next()) 
                                {
                            %>
                            <option value="<%=rs3.getString("tech_id")%>" <% if (techName.equals(rs3.getString("tech_id"))) 
                            {%> selected="true" <%}%>>


                                <%=rs3.getString("tech_name")%></option> 
                                <%
                                    }
                                %>

                        </select>
                        
                    </td>
                </tr>
           <tr>
                    <td><input align="center" type="submit" id="sub" name="btnsubmit"></td>
                    <td align="center" colspan="2"><input type="reset" name="btnreset"></td>
                </tr>
                              
            </table>
                 <table border="1" align="center">
                
                <th>Sl.No</th>
                <th>Work</th>
                <th>Specialization</th>
                
                
                    
                <% 
                 int i=1;
                 String sel="select * from tbl_worktechnology wt,tbl_technology t,tbl_clientwork cw where wt.tech_id=t.tech_id and wt.work_id=cw.work_id";
                 ResultSet rs=obj.selectCommand(sel);
                 while(rs.next())
                 {
                 
                %>
                
                
                    <tr>
                        <td><%=i%> </td>
                        <td><%=rs.getString("work_name")%></td>
                        <td><%=rs.getString("tech_name")%></td>
                        
                        
                        <td><a href="WorkTechnology.jsp?delid=<%=rs.getString("worktech_id")%>">Delete</a></td>
                        <td><a href="WorkTechnology.jsp?edid=<%=rs.getString("worktech_id")%>">Edit</a></td>
                    </tr>
                    <%
                    i++;
                
                 }
                %>
               </table>
            
        </form>

    </body>
</html>
