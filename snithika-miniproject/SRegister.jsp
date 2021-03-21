SRegister.jsp

<%@ page import="java.sql.*"%>
<html><head>
<%
  String id=request.getParameter("id");
  try{
	  Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/snithika","root","Shravya@123");
PreparedStatement ps=con.prepareStatement("select * from amount where Userid=?");
ps.setString(1,id);%><%="selected" %><%
ResultSet r=ps.executeQuery();%><%="1" %><%
RequestDispatcher rs;
if(r.next())
{ %><%="2" %><%
           
rs=request.getRequestDispatcher("./SRegister.html");
     rs.forward(request,response);
            }
            else
            {%><%="3" %><%
PreparedStatement st = con.prepareStatement("insert into registrationtable(id,Firstname,Lastname) values(?, ?, ?)");
st.setString(1,request.getParameter("id"));
st.setString(2,request.getParameter("fname"));
st.setString(3,request.getParameter("lname"));%><%="4" %><%
st.executeUpdate();%><%="5" %><%
st= con.prepareStatement("insert into amount(Userid) values(?)");
st.setString(1,request.getParameter("id"));%><%="6" %><%
st.executeUpdate();%><%="7" %><%
st.close();%><%="8" %><%
rs=request.getRequestDispatcher("./addmoney.html?id="+id);
rs.forward(request,response);
}
}
catch(Exception e)
{
e.printStackTrace();
}
%>
</head>
<body>
</body>
</html>

