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
import com.fssa.healthyhair.dao.exception.DAOException;
import com.fssa.healthyhair.model.User;
import com.fssa.healthyhair.service.UserService;
import com.fssa.healthyhair.service.exception.ServiceException;
import com.fssa.healthyhair.validation.exception.InvalidUserException;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String errorPassword = "password";
		UserService userService = new UserService();

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try {
			userService.loginWithEmail(email, password);
			HttpSession session = request.getSession();

			User user = UserService.findingUserByEmail(email);
			session.setAttribute("User", user);
			if (user.getType() == null) {
				request.setAttribute(errorPassword, "User not yet registered");
				response.sendRedirect("index.jsp");
			} else if ("buyer".equals(user.getType())) {
				response.sendRedirect("ListProductServlet?category=all");
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("sellerAccount.jsp");
				dispatcher.forward(request, response);
			}

		} catch (ServiceException e) {
			String[] strArr = e.getMessage().split(":");
			String msg = strArr[strArr.length - 1];
			request.setAttribute("email", email);
			request.setAttribute(errorPassword, password);
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp?loginError=" + msg);
			dispatcher.forward(request, response);
		}
	}
}
