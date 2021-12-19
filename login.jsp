<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page import="java.lang.*"%>


  <html>
 <head> 
 <title>Login</title>
 <style>
 body{font-family: cursive; background-color: #f5f5f5}
 div{width: 400px; margin: 0px auto; boxshadow: 0px 1px 10px #a8a8a8; background-color: #fff; padding- bottom: 10px; position: absolute; top: 50%; left: 50%; transform: translate(-50%,-50%)}
 h1{backgroundcolor: #d1a134; text-align: center; margin-top: 0; padding: 20px; color: #fff}
 input{display: block; margin: auto; font-size: 20px}
 p{textalign: center; font-size: 20px; color : #6a595b; margin; 0}
 input{width: 70%; border: 1px solid #34cbd1; background-color: #fff; outline: none; borderradius :5px; height : 40px; padding : 10px}
 input[type='submit']:hover{background-color: #54b0bc; border: 0}
 input[type='submit']{background-color: #34cbd1; color: #fff; cursor: pointer};
 </style>
 </head>
 <body>
 <div>
<%Connection con=null;
Statement stm=null;
ResultSet rs=null; 
String email=request.getParameter("email");
String pass=request.getParameter("pass");
try
{
Class.forName("com.mysql.jdbc.Driver");
con= DriverManager.getConnection("jdbc:mysql://localhost:3306/psm","root","");
String query = "select * from student where email='"+email+"' and password='"+pass+"'";
stm= con.createStatement();
rs=stm.executeQuery(query);
if(rs.next()){%>
 <h1>Welcome</h1>
 <p>Name - <%=rs.getString("name")%>"</p> 
 <p>Account - <%=rs.getString("Account")%></p> 
 <p>Email - <%=rs.getString("email")%></p>
 <p>Amount - <%=rs.getString("Amount")%></p>
<%}else
{ %>
<p>PLEASE CHECK THE DETAILS!!!!!!!!!!</p>
<img src="error.jpg"><% }}
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
}}
%>
 <p><a href='login.html'>Back</a></p>
 </div>
 </body>
 </html>


