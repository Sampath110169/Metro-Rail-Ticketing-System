<%@ page import="java.sql.*"%>
<html>
    <head>
   <script>
function back(){
window.location.href="SHome.html";
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
<body>
   <%
    String id=request.getParameter("id");
  try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/snithika","root","Shravya@123");
PreparedStatement ps=con.prepareStatement("select * from amount where Userid=?");
ps.setString(1,id);
ResultSet r=ps.executeQuery();
if(r.next())
{
       PreparedStatement p=con.prepareStatement("update amount set balance=? where Userid=?");
p.setInt(1,(Integer.parseInt(r.getString("balance"))+Integer.parseInt(request.getParameter("money"))));
p.setString(2,request.getParameter("id"));
p.executeUpdate();
       %>
<div class="box">
<center>
   <label>Money added successfully.</label><br><br>

<%
p=con.prepareStatement("select * from amount where Userid=?");
p.setString(1,request.getParameter("id"));
r=p.executeQuery();
if(r.next())
{
%>
<label class="font_style"> Available balance is <%=r.getString("Balance")%></label>
<br><br><button onclick="back()">Another ticket</button></center>
<div>
<%
}
}
con.close();
    }
    catch(Exception e)
      {
    e.printStackTrace();
   }
%>
</body>
</html>
