<%@ page language="java" import="java.sql.*,java.util.*,java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<head>
<title>Update Record</title>
</head>
<style>
table, td, th {
	border: 1px solid green;
	font-family: arial;
	color: blue;
}

table {
	background-color: lightgreen;
}
</style>
<body>
	<%
		out.println("<style>  p {font-family: arial;" + " color: red; font-size: 16;   }; " + "</style>");
		out.println("<style>  a,b {font-family: arial;" + " color: blue; font-size: 16;   }; " + "</style>");
	%>
	<%
		String strId = request.getParameter("id");
		int id = Integer.parseInt(strId);
		Connection con = null;
		String url = "jdbc:mysql://localhost:3306/";
		;
		String db = "users";
		String driver = "com.mysql.jdbc.Driver";
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url + db, "root", "1234");
			try {
				Statement st = con.createStatement();
				String query = "SELECT nombre,edad,nomequipo FROM ciclista WHERE dorsal=" + id;
				ResultSet rs = st.executeQuery(query);
				while (rs.next()) {
	%>


	<table border="1" width="50%">
		<tr>
			<td width="100%">
				<form method="POST" action="update.jsp">
					<input type="hidden" name="id"
						value="<%=request.getParameter("id")%>">
					<h2 align="center">UPDATE RECORD</h2>
					<table border="2" width="100%" bgColor="lightgreen">

						<tr>
							<td width="50%" bgColor="lightgreen"><b>Nombre:</b></td>
							<td width="50%" bgColor="lightgreen"><input type="text"
								name="name" value="<%=rs.getString("nombre")%>" size="50" /></td>
						</tr>
						<tr>
							<td width="50%" bgColor="lightgreen"><b>Edad:</b></td>
							<td width="50%" bgColor="lightgreen"><input type="text"
								name="city" value="<%=rs.getString("edad")%>" size="50"></td>
						</tr>
						<tr>
							<td width="50%" bgColor="lightgreen"><b>Equipo:</b></td>
							<td width="50%" bgColor="lightgreen"><input type="text"
								name="phone" value="<%=rs.getString("nomquipo")%>" size="15"></td>
						</tr>
					</table>
					<p>
						<input type="submit" value="Update" name="submit"> <input
							type="reset" value="Reset" name="reset">
					</p>

				</form>
			</td>
		</tr>
	</table>


	<%
		}

				rs.close();
				con.close();

			} catch (SQLException ex) {
				System.out.println("SQL statement is not executed!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	<%
		out.println("<br>");
		out.println("<a href='index.jsp'> RETURN TO MAIN PAGE </a>");
	%>
</body>
</html>