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
   function go()
{
var id=myValue("userid");
var query="?id="+id;
var d=document.getElementById("destination").value;
if(d=="RSP")
{
query=query+"&amt=10";
}
else if(d=="PKN")
{
query=query+"&amt=15";
}
else if(d=="BGPT")
{
query=query+"&amt=20";
}
else if(d=="AMPT")
{
query=query+"&amt=25";
}
   window.location.href="afterdeducted.jsp"+query;
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
background-image:url('paradisemetro.jpg');
background-repeat: no-repeat;
background-attachment: fixed;
background-size: 100% 100%;
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
width: 500px;
height: 350px;
padding : 50px;
padding-top: 30px;
margin: auto ;
margin-top:150px;
margin-bottom:100px;
 }
</style>
</head>
    <body ><center>
<%
    String id=request.getParameter("userid");
  try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/snithika","root","Shravya@123");
PreparedStatement ps=con.prepareStatement("select * from amount where Userid=?");
ps.setString(1,id);
ResultSet r=ps.executeQuery();
if(r.next())
{
       %><div class="box">
<label >You are at paradise.</label><br><br>
<label class="font_style">Please select your destination</label><br><br>
<select id="destination" >
   <option value="RSP">Rasulpura - Rs 10</option>
   <option value="PKN">Prakash Nagar - Rs 15</option>
   <option value="BGPT">Begumpet - Rs 20</option>
   <option value="AMPT">Ameerpet - Rs 25</option>
</select><br><br>
<button onclick="go()">Go</button></div>
<%
}
else
{
%>
<label>Get an id..!</label>
<%
}
con.close();
    }
    catch(Exception e)
      {
    e.printStackTrace();
   }
%>
    </center>
</body>
</html>
