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
 * Servlet implementation class CustLoginServlet
 */
@WebServlet("/cust_login_servlet")
public class CustLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cuemail = request.getParameter("cusername");
		String cupwd = request.getParameter("cpassword");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crmlogin","root","2112@sQL");
			PreparedStatement pst = con.prepareStatement("select * from cust_users where cuemail = ? and cupwd = ? ");
			pst.setString(1, cuemail);
			pst.setString(2, cupwd);
			HttpSession session = request.getSession();
			RequestDispatcher dispatcher = null;
			
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				session.setAttribute("cusername", rs.getString("cuemail"));
				dispatcher = request.getRequestDispatcher("customer_menu.jsp");
			}else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("customer_login.jsp");
			}
			dispatcher.forward(request, response);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}