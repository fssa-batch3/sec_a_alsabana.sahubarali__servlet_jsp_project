package com.fssa.healthyhair.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.healthyhair.model.User;
import com.fssa.healthyhair.service.UserService;
import com.fssa.healthyhair.service.exception.ServiceException;

/**
 * Servlet implementation class DeleteUserAccountServlet
 */
@WebServlet("/DeleteUserAccountServlet")
public class DeleteUserAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteUserAccountServlet() {
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
		int userId = Integer.parseInt(request.getParameter("userId"));

		try {
			UserService userService = new UserService();
			userService.deleteUser(userId);
			HttpSession session = request.getSession(false);
			session.invalidate();
			response.sendRedirect("index.jsp");
		} catch (ServiceException e) {
			String[] strArr = e.getMessage().split(":");
			String msg = strArr[strArr.length - 1];
			RequestDispatcher dispatcher = request.getRequestDispatcher("sellerAccount.jsp?errorMessage=" + msg);
			dispatcher.forward(request, response);

		}

	}

}
