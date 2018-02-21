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
        <title>PerformanceEvaluation: specialization</title>
        <script src="jq.js" type="text/javascript"></script>
        
        
        
        
        <script>
            function checkCount(t,e)
            {
               // alert(t+"&"+e);  
         
                $.ajax({url: "ajax_specialization.jsp?id="+t+"&emp="+e, success: function(result)
                {
               
                    var x=result.trim();
                   // alert(x);
                    if(x>0)
                    {
                        alert('Already Existing');
                        $('#sub').attr('disabled', true);
                       


                    }
                    else
                    {
                         
                        
                        // alert('inside else');
                        $('#sub').attr('disabled', false);
                       
                    }
            
            
            
                }});
            }
         </script>
    </head>
    <%
        String empName="",techName="",spID="",techCount="";
    
          if(request.getParameter("btnsubmit")!= null)
          {
            
            
           if(!request.getParameter("hid").equals(""))
           {
              String EmpName=request.getParameter("selEmp");
              String TechName=request.getParameter("selTech");
              
              String upQuery="update tbl_specialization set emp_id='"+EmpName+"',tech_id='"+TechName+"' where sp_id='"+request.getParameter("hid")+"'";
              boolean b=obj.executeCommand(upQuery);
              if(b==true)
              {
                  response.sendRedirect("Specialization.jsp");
              }
              else
              {
                  out.println(upQuery);
              }
               
           }
           else
           {
            String emp=request.getParameter("selEmp");
            String tech=request.getParameter("selTech");
            
            
            String insQuery="insert into tbl_specialization (emp_id,tech_id) values('"+emp+"','"+tech+"')";
            boolean b=obj.executeCommand(insQuery);
            if(b == true)
            {
               // out.println("success"); 
                response.sendRedirect("Specialization.jsp");
            }
            else
            {
                out.println(insQuery);
            }
           }
            
        }
            if(request.getParameter("delid")!=null)
       {
           String del="delete from tbl_specialization where sp_id='"+request.getParameter("delid")+"'";
           boolean b=obj.executeCommand(del);
           response.sendRedirect("Specialization.jsp");
       
       }
       if(request.getParameter("edid")!= null)
       {
           String selQuery="select * from tbl_specialization where sp_id='"+request.getParameter("edid")+"'";
           
           ResultSet rs1=obj.selectCommand(selQuery);
           if(rs1.next())
           {
             spID=rs1.getString("sp_id");
               empName=rs1.getString("emp_id");
               techName=rs1.getString("tech_id");
              
               
               
           }
           
       }
    
        
        
    
    
    
    
    %>
    <body>
        <form method="post">
            <h2 align="center">Specialization</h2>
            <input type="hidden" name="hid" value="<%=spID%>">
            <table align="center">
                <tr>
                    <td>Employee</td>
                    <td>
                        <select name="selEmp" >

                            <option>--Select--</option>

                            <%
                                String selq1 = "select * from tbl_emp";
                                ResultSet rs2 = obj.selectCommand(selq1);
                                while (rs2.next()) 
                                {
                            %>
                            <option value="<%=rs2.getString("emp_id")%>" <% if (empName.equals(rs2.getString("emp_id"))) 
                            {%> selected="true" <%}%>>


                                <%=rs2.getString("emp_name")%></option> 
                                <%
                                    }
                                %>

                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Technology</td>
                    <td>
                          <select name="selTech" onchange="checkCount(this.value,selEmp.value)">

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
                <th>Employee</th>
                <th>Specialization</th>
                
                
                    
                <% 
                 int i=1;
                 String sel="select * from tbl_emp e,tbl_technology t,tbl_specialization s where s.emp_id=e.emp_id and t.tech_id=s.tech_id";
                 ResultSet rs=obj.selectCommand(sel);
                 while(rs.next())
                 {
                 
                %>
                
                
                    <tr>
                        <td><%=i%> </td>
                        <td><%=rs.getString("emp_name")%></td>
                        <td><%=rs.getString("tech_name")%></td>
                        
                        
                        <td><a href="Specialization.jsp?delid=<%=rs.getString("sp_id")%>">Delete</a></td>
                        <td><a href="Specialization.jsp?edid=<%=rs.getString("sp_id")%>">Edit</a></td>
                    </tr>
                    <%
                    i++;
                
                 }
                %>
               </table>
            
        </form>

    </body>
</html>
