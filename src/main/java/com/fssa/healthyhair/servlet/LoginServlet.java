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
		UserService userService = new UserService();
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try {
			userService.loginWithEmail(email, password);
			UserDAO userDAO = new UserDAO();
			HttpSession session = request.getSession();

			User user = userDAO.findUserByEmail(email);
			session.setAttribute("User", user);

			if (user.getType().equals("buyer")) {

				response.sendRedirect("account.jsp");

			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("account.jsp");

				dispatcher.forward(request, response);

			}

		} catch (DAOException | ServiceException e) {
			RequestDispatcher patcher = request.getRequestDispatcher("login.jsp?errorMessage=Invalid Credential");
			patcher.forward(request, response);
		}

	}
}
