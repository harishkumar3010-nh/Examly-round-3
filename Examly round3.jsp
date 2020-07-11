<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
 
<%
String SeatNum,Name;
String ans1,ans2,ans3,ans4,ans5;
int a1,a2,a3,a4,a5;
a1=a2=a3=a4=a5=0;
Connection connect=null;
Statement stmt=null;
ResultSet rs=null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
String url = "jdbc:odbc:StudentDB1";
connect = DriverManager.getConnection(url," "," ");
if(request.getParameter("action")!=null)
{
SeatNum = request.getParameter("Seat_no");
Name = request.getParameter("Name");
ans1 =request.getParameter("group1");
if(ans1.equals("True"))
a1=5;
else
a1=0;
ans2 = request.getParameter("group2");
if(ans2.equals("True"))
a2=0;
else
a2=5;
ans3 = request.getParameter("group3");
if(ans3.equals("True"))
a3=0;
else
a3=5;
ans4 = request.getParameter("group4");
if(ans4.equals("True"))
a4=5;
else
a4=0;
ans5 = request.getParameter("group5");
if(ans5.equals("True"))
a5=0;
else
a5=5;
int Total=a1+a2+a3+a4+a5;
stmt = connect.createStatement();
String query = "INSERT INTO StudentTable (" + "Seat_no,Name,Marks" + ")VALUES ('" +SeatNum + "', '" + Name + "', '"+Total+ "')";
int result = stmt.executeUpdate(query);
 
stmt.close();
stmt = connect.createStatement();
query = "SELECT * FROM StudentTable WHERE Name="+"'"+Name+"'";
rs = stmt.executeQuery(query);
%>
<html><head><title>Student Mark List</title></head>
<body bgcolor=khaki>
<center>
Students Marksheet
Name of the College : JCE College of Engineering
<table border="1" cellspacing="0" cellpadding="0">
<tr>
<td><b>Seat_No</b></td>
<td><b>Name</b></td>
<td><b>Marks</b></td>
</tr>
<%
while(rs.next())
{
%>
<tr>
<td><%=rs.getInt(1)%></td>
<td> <%=rs.getString(2)%></td>
<td> <%=rs.getString(3)%></td>
</tr>
<%
}
rs.close();
stmt.close();
connect.close();
%>
</table>
</center>
<br/> <br/><br/>
<table>
<tr><td><b>Date:<%=new java.util.Date().toString() %></td></tr>
<tr><td><b>Signature: X.Y.Z. <b></td></tr>
</table>
<div>
Click here to go back
</body>
</html>
<%}else{%>
<html>
<head><title>Online Examination</title>
<script language="javascript">
 
function validation(Form_obj)
{
if(Form_obj.Seat_no.value.length==0)
{
alert("Please,fill up the Seat Number");
Form_obj.Seat_no.focus();
return false;
}
if(Form_obj.Name.value.length==0)
{
alert("Please,fill up the Name");
Form_obj.Name.focus();
return false;
}
return true;
}
</script>
</head>
<body bgcolor=lightgreen>
<center>
Online Examination
</center>
<form action="OnlineExam.jsp" method="post"
name="entry" onSubmit="return validation(this)">
<input type="hidden" value="list" name="action">
<hr/>
<table>
<tr>
<td>
Seat Number : </td>
<td><input type="text" name="Seat_no"></td>
</tr>
<tr>
<td>
Name : </td>
<td><input type="text" name="Name" size="50"></td>
</tr>
<tr>
<td><b>Total Marks:5*5=25 </b></td>
<td></td><td></td><td></td><td><b>Time: 15 Min.</b></td>
</tr>
</table>
<hr/>
<b>1. XML enables you to collect information once and reuse it in a
variety of ways.</b><br/>
<input type="radio" name="group1" value="True">True
<input type="radio" name="group1" value="False">False<br>
<br/>
 
<b>2. In Modern PC there is no cache memory.</b><br/>
<input type="radio" name="group2" value="True">True
<input type="radio" name="group2" value="False">False<br>
<br/>
<b>3. JavaScript functions cannot be used to create script fragments
that can be used over and over again</b><br/>
<input type="radio" name="group3" value="True">True
<input type="radio" name="group3" value="False">False<br>
<br/>
<b>4.The DriverManager class is used to open a connection to a
database via
a JDBC driver.</b><br/>
<input type="radio" name="group4" value="True">True
<input type="radio" name="group4" value="False">False<br>
<br/>
<b>5. The JDBC and ODBC does not share a common parent</b><br/>
<input type="radio" name="group5" value="True">True
<input type="radio" name="group5" value="False">False<br>
<hr/>
<center>
<input type = "submit" value="Submit">
<input type = "reset" value="Clear"><br><br>
</center>
</form>
<%}%>