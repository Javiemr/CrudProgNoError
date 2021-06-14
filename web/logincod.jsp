<%-- 
    Document   : logincod
    Created on : 11 jun 2021, 0:20:36
    Author     : zaiiche
--%>


<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

  String usuario;
  String pass;

  usuario = request.getParameter("Usuario");
  pass = request.getParameter("Contrasena");

  Class.forName("com.mysql.jdbc.Driver");
  Connection connection = DriverManager
          .getConnection("jdbc:mysql://localhost:3306/arkdata", "root", "");

  HashMap<String, String> userList = new HashMap();
  ArrayList<String> adminlist = new ArrayList();
  Statement st = connection.createStatement();
  ResultSet rs = st.executeQuery("SELECT * FROM Credencial");
  
  while (rs.next()) {
    
    String user_tmp = rs.getString("NomUsu");
    String pass_tmp = rs.getString("PassUsu");
	String tmp = rs.getString("AdminUsu");
	if(tmp == null)
	{
		tmp = "0";
	}
	userList.put(user_tmp, pass_tmp);
	if(tmp.equals("1"))
	{
		adminlist.add(user_tmp);
	}
  }
	HttpSession sesion = request.getSession();
  if (userList.containsKey(usuario) && userList.get(usuario).equals(pass)) {
    response.sendRedirect("bienvenida.jsp");
	if(adminlist.contains(usuario))
	{
		sesion.setAttribute("admin", "1");
	}else
	{
		sesion.setAttribute("admin", "0");
	}
    sesion.setAttribute("usuario", usuario);
	sesion.setAttribute("error", "0");
   
  } else {
    response.sendRedirect("index.jsp");
	sesion.setAttribute("error", "1");
  }

%> 


