package crm;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.jsp.tagext.TryCatchFinally;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Login
 */
@WebServlet("/manager_login_servlet")
public class ManagerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String muemail = request.getParameter("musername");
		String mupwd = request.getParameter("mpassword");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmlogin","root","2112@sQL");
			PreparedStatement pst = con.prepareStatement("select * from manager_users where muemail = ? and mupwd = ? ");
			pst.setString(1, muemail);
			pst.setString(2, mupwd);
			HttpSession session = request.getSession();
			RequestDispatcher dispatcher = null;
			
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				session.setAttribute("musername", rs.getString("muemail"));
				dispatcher = request.getRequestDispatcher("manager_menu.jsp");
			}else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("manager_login.jsp");
			}
			dispatcher.forward(request, response);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}