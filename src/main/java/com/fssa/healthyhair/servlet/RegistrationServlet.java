package com.fssa.healthyhair.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.healthyhair.dao.UserDAO;
import com.fssa.healthyhair.model.User;
import com.fssa.healthyhair.service.UserService;
import com.fssa.healthyhair.service.exception.ServiceException;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistrationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String number = request.getParameter("number");
		String type = request.getParameter("type");

		PrintWriter out = response.getWriter();

		UserService userservice = new UserService();
		User user1 = new User(email, username, password, type, number);
        
		try {
			userservice.registerUser(user1);
			out.println("Successfully registered " + user1.getUsername());
			HttpSession session = request.getSession();

			User user = UserService.findingUserByEmail(email);
			session.setAttribute("User", user);
           if(user.getType().equalsIgnoreCase("buyer")) {
			response.sendRedirect("ListProductServlet");
           }else {
        	   response.sendRedirect("createProduct.jsp");
           }
		} catch (ServiceException e) {
			String[] strArr = e.getMessage().split(":");
			String msg = strArr[strArr.length - 1];
			
			request.setAttribute("username",username);
			request.setAttribute("email",email);
			request.setAttribute("password",password);
			request.setAttribute("number",number);
			request.setAttribute("type",type);
			
			
			
			
			RequestDispatcher patcher = request.getRequestDispatcher("index.jsp?registerError="+msg);
			patcher.forward(request, response);

		}

	}
}
