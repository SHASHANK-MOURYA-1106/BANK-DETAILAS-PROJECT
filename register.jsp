<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.lang.*"%>


<html>
<head>
<title>Register</title>
<style>
body{font-family: cursive; background-color: #f5 f5f5}
div{width: 50%; margin: 0px auto; boxshadow: 0px 1px 10px #a8a8a8; background-color: #fff; padding-bottom: 10px; position: absolute; top: 50%; left: 50%; transform: translate(-50%,-50%); }
h1{backgroundcolor: #222222; text-align: center; margin-top: 0; padding: 20px; color: #fff}
pftextalign: center; font-size: 20px; color: #6a595b; margin;0}
</style>
</head>
<body style="background-color: bisque;">
<div>
<%Connection con=null;
Statement stm=null;
ResultSet resultSet = null;
String name=request.getParameter("name");
String account= request.getParameter("account");
//int roll=Integer.parseInt(request.getParameter("roll"));
String email=request.getParameter("email");
String Amount=request.getParameter("amount");
String pass=request.getParameter("pass");
try{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/psm","root","");
String query ="insert into student values('"+name+"',"+account+",'"+email+"','"+pass+"','"+Amount+"')"; 
stm=con.createStatement();
int count=stm.executeUpdate(query );
if(count != 0 ) 
%>
 
<p>Registration sucessfull</p><%}

catch(ClassNotFoundException e){
out.println(e);
}
catch(SQLException e){
out.println(e);
}
finally
{
try
{
stm.close();
con.close();
}
catch(SQLException e){
out.println(e);
}
}%>
<p><a href='register.html'>Back</a></p>
</div>
</body> 
</html>


