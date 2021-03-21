

<%@ page import="java.sql.*"%>
<html>
    <head>
   <script>
   function myValue(msg)
{
  var query=location.search.substring(1);
  var a=query.split("&");
  for(var i=0;i<a.length;i++)
  {
     var value=a[i].split('=');
 if(value[0]==msg)
     return value[1];
  }
}
function getTicket()
{
var query="?id="+myValue('id');
   window.location.href="getTicket.html"+query;
}
   </script>
   <style>
label{
font-size:40px;
color: Red;
}
.font_style{
color:black;
font-size:25px;
}
body{
background-color:snow;
}
button {
   background-color:Darkblue;
border: none;
color: white;
padding: 10px 40px;
text-decoration: none;
margin: 4px;
cursor: pointer;
   }
*{
            box-sizing: border-box;  
 }
 .box{
   background-color: snow;
align: center;
width: 800px;
height: 350px;
padding : 50px;
padding-top: 30px;
margin: auto ;
margin-top:150px;
margin-bottom:100px;
 }
</style>
</head>
    <body><div class="box">
<%
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/snithika","root","Shravya@123");
PreparedStatement p=con.prepareStatement("select * from amount where Userid=?");
p.setString(1,request.getParameter("id"));
ResultSet rs=p.executeQuery();
if(rs.next()){
PreparedStatement ps=con.prepareStatement("update amount set balance=? where Userid=?");
ps.setInt(1,Integer.parseInt(rs.getString("balance"))-Integer.parseInt(request.getParameter("amt")));
ps.setString(2,request.getParameter("id"));
ps.executeUpdate(); }
            p=con.prepareStatement("select * from amount where Userid=?");
p.setString(1,request.getParameter("id"));
rs=p.executeQuery();
if(rs.next()){
%><center>
   <label>Money deducted from your account.<br><br>Thanks for travelling.</label><br><br><br>
<label class="font_style">Balance available in your account is
<%=rs.getString("balance")
%><br><br></label><button onclick="getTicket()">Get Ticket</button><br><br>
</center></div><%
       } con.close();}
   catch(Exception e)
      {
    e.printStackTrace();
   }
%>
   
</body>
</html>