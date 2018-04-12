<%-- 
    Document   : dictionary
    Created on : Apr 11, 2018, 10:55:18 AM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PerformanceEvaluation:polarityDictionary</title>
    </head>
    <%
        String pdID="",polarityName="",Word="";
        if(request.getParameter("btnsubmit") != null)
        {
            String word=request.getParameter("txtword");
            String polarity=request.getParameter("selModule");
           
            String ins="insert into tbl_polaritydictionary (pd_word,p_id)values('"+word+"','"+polarity+"')";
            boolean b=obj.executeCommand(ins);
            if(b == true)
            {
                response.sendRedirect("ploarityDictionary.jsp");
            }
            else
            {
                out.println(ins);
            }
            
            
        }
          if (request.getParameter("delid") != null)
          {
             
                  String del = "delete from tbl_polaritydictionary where pd_id='" + request.getParameter("delid") + "'";

                  obj.executeCommand(del);
                

              }
    
    
    
    
    %>
    <body>
        <form>
        <h1 align="center">Dictionary</h1>
        <table align="center">
            <tr>
                <td>Word</td>
                <td><input type="text" name="txtword" value="<%=Word%>"></td>
            </tr>
            <tr>
                <td>
                    polarity
                </td>
                <td>
                     <select name="selModule">

                            <option value="0">--Select--</option>

                            <%
                                String selq1 = "select * from  tbl_polarity";
                                ResultSet rs2 = obj.selectCommand(selq1);
                                while (rs2.next()) 
                                {
                            %>
                           <option value="<%=rs2.getString("p_id")%>" >


                                <%=rs2.getString("p_polarity")%></option> 
                                <%
                                    }
                                %>

                        </select>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <input type="submit" name="btnsubmit">
                    <input type="reset" name="btnreset">
                </td>
                
            </tr>
        </table>
        <table align="center" border="1">
                <th>SL NO</th>
                
                <th>Word</th>
                <th>Polarity</th>
                
                <% 
                 int i=1;
                 String sel="select * from tbl_polaritydictionary pd inner join tbl_polarity p where pd.p_id=p.p_id";
                 ResultSet rs=obj.selectCommand(sel);
                 while(rs.next())
                 {
                 
                %>
                
                
                    <tr>
                        <td><%=i%> </td>
                        <td><%=rs.getString("pd_word")%></td>
                        <td><%=rs.getString("p_polarity")%></td>
                        <td><a href="ploarityDictionary.jsp?delid=<%=rs.getString("pd_id")%>">Delete</a></td>
                                           
                        
                       
                        
                    </tr>
                    <%
                    i++;
                
                 }
                %>
               </table>
                
        </form>
    </body>
</html>
