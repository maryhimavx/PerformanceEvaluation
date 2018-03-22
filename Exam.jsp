<%-- 
    Document   : Exam
    Created on : Mar 21, 2018, 3:22:00 PM
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
        <script src="../HR/jq.js" type="text/javascript"></script>
        <script>
    
    window.history.forward();
    
    
    var now2 = new Date().getTime();
 now2=now2+(1000*60);
var countDownDate = now2;

// Update the count down every 1 second
var x = setInterval(function() {

    // Get todays date and time
    var now = new Date().getTime();
    
    // Find the distance between now an the count down date
    var distance = countDownDate - now;
    
    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
    // Output the result in an element with id="demo"
    document.getElementById("demo").innerHTML = minutes + "m " + seconds + "s ";
    
    // If the count down is over, write some text 
    if (distance < 0) {
        clearInterval(x);
       // var id=document.getElementById('exid').value;
        document.getElementById("demo").innerHTML = "EXPIRED";
        window.location.href="Result.jsp";
    }
}, 1000);
</script>

        <script>
            
            function insertOptions(o,q)
            {
                
                alert(o+"&"+q)
                $.ajax(
                {
                    url: "ajax_exam.jsp",
                    data: {opt:o,qid:q},
                    success: function (result) {
                        
                    }
                })
                
                
            }
            
        </script>
    </head>
    
    <body>
        <p id="demo"></p>
        <form method="post">
            <table>
                <tr>
                    
                        <%
                            int cnt=0;
                            String sel="select * from tbl_question limit 4";
                            ResultSet rs=obj.selectCommand(sel);
                            String q="";
                            while(rs.next())
                            {
                                q=rs.getString("q_id");
                                
                                %>
                                <td><%=rs.getString("q_question")%></td>
                </tr>
              
                        <%


                                cnt++;
                                String sel1="select * from tbl_option where q_id='"+q+"'";
                                 ResultSet rs1=obj.selectCommand(sel1);
                                 String opt="";
                                while(rs1.next())
                                {
                                    %>
                                    <tr><td><input type="radio" name="answer<%=cnt%>" onclick="insertOptions(this.value,<%=q%>)" value="<%=rs1.getString("opt_id")%>"><%=rs1.getString("opt_name")%></td></tr>
                                
                                
                                <%




                                }
                            }

        
        
        
        
        
        %>
                  
                
            </table>
        <table>
            <tr>
                <td>
                    <a href="Result.jsp">Result</a>
                </td>
            </tr>
        </table>
        </form>
    </body>
</html>
