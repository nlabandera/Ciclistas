
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<%
out.println("<style>  p {font-family: arial;"
           + " color: red; font-size: 16;   }; "
           + "</style>");
out.println("<style>  a,b {font-family: arial;"
           + " color: blue; font-size: 16;   }; "
           + "</style>");

%>
<% 
String strId =request.getParameter("id");
int id = Integer.parseInt(strId);
Connection con = null;
String url = "jdbc:mysql://localhost:3306/";;
String db = "users";
String driver = "com.mysql.jdbc.Driver";
try{
Class.forName(driver);
con = DriverManager.getConnection(url+db,"root","1234");
try{
Statement st = con.createStatement();
String nombre=request.getParameter("nombre");
String edad=request.getParameter("edad");
String nomequipo=request.getParameter("nomequipo");
int in = st.executeUpdate("UPDATE ciclista SET nombre='"+nombre+"'"
                          + ",edad='"+edad+"',phone='"+nomequipo+"' "
                          + "WHERE id='"+id+"'");
con.close();
out.println("<p> The record of " +"<b>"+ nombre +"</b>" + " is successfully updated. </p>");
out.println("<br>");
out.println("<a href='index.jsp'> RETURN TO MAIN PAGE </a>");
}
catch (SQLException ex){
System.out.println("SQL statement is not executed!");
}
}
catch (Exception e){
e.printStackTrace();
}
%>
