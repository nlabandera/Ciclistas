<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div align="center" width="200%">
		<br>
		<h2>Ciclistas</h2>
		<br>
		<div align="left" width="200%">
			<%
				out.println("<a class='space' href='insert.jsp'> ADD RECORD </a>");
			%>
		</div>
		<br>
		<table border="1" borderColor="black" cellPadding="0" cellSpacing="0"
			width="920" height="80">
			<tbody>
				<td bgColor="cyan" width="150" align="center" height="19"><font
					color="red"><b> DORSAL</b></font></td>
				<td bgColor="cyan" width="290" height="19"><font color="red"><b>NOMBRE</b></font></td>
				<td bgColor="cyan" width="290" height="19"><font color="red"><b>EDAD</b></font></td>
				<td bgColor="cyan" width="230" height="19"><font color="red"><b>NOMBRE
							DEL EQUIPO</b></font></td>
				<td bgColor="cyan" width="290" height="19"><font color="red"><b>
					</b></font></td>
				<td bgColor="cyan" width="290" height="19"><font color="red"><b>
					</b></font></td>
				<%
					String DRIVER = "com.mysql.jdbc.Driver";
					Class.forName(DRIVER).newInstance();
					Connection con = null;
					ResultSet rst = null;
					Statement stmt = null;
					try {

						String url = "jdbc:mysql://localhost:3306/ciclismo?user=root&password=1234";
						int i = 1;
						con = DriverManager.getConnection(url);
						stmt = con.createStatement();
						rst = stmt.executeQuery("SELECT * FROM ciclista ORDER BY nombre ASC ");
						while (rst.next()) {

							if (i == (i / 2) * 2) {
				%>
				<tr>
					<td bgColor="lightgreen" vAlign="top" width="80" height="19"><%=i%></td>
					<td bgColor="lightgreen" vAlign="top" width="110" height="19"><%=rst.getString(2)%></td> <!-- Nombre -->
					<td bgColor="lightgreen" vAlign="top" width="224" height="19"><%=rst.getString(3)%></td>	<!-- Edad -->
					<td bgColor="lightgreen" vAlign="top" width="230" height="19"><%=rst.getString(4)%></td>	<!-- Equipo -->
					<td bgColor="lightgreen" vAlign="top" width="220" height="19">
						<a href="edit.jsp?id=<%=rst.getInt("id")%>"> Edit Record </a>
					</td>
					<td bgColor="lightgreen" vAlign="top" width="230" height="19">
						<a href="delete.jsp?id=<%=rst.getInt("id")%>"> Delete Record </a>
					</td>
				</tr>
				<%
					} else {
				%>
				<tr>
					<td bgColor="lightgreen" vAlign="top" width="80" align="center"
						height="19"><%=i%></td>
					<td bgColor="lightgreen" vAlign="top" width="107" height="19"><%=rst.getString(2)%></td>
					<td bgColor="lightgreen" vAlign="top" width="224" height="19"><%=rst.getString(3)%></td>
					<td bgColor="lightgreen" vAlign="top" width="230" height="19"><%=rst.getString(4)%></td>
					<td bgColor="lightgreen" vAlign="top" width="220" height="19">
						<a href="edit.jsp?id=<%=rst.getInt("id")%>"> Edit Record </a>
					</td>
					<td bgColor="lightgreen" vAlign="top" width="230" height="19">
						<a href="delete.jsp?id=<%=rst.getInt("id")%>"> Delete Record </a>
					</td>
				</tr>
				<%
					}

							i++;
						}
						rst.close();
						stmt.close();
						con.close();
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
				%>
			</tbody>
		</table>
		</center>
	</div>

</body>
</html>