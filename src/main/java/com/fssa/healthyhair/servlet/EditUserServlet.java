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

import com.fssa.healthyhair.model.User;
import com.fssa.healthyhair.service.UserService;
import com.fssa.healthyhair.service.exception.ServiceException;

/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		int id = Integer.parseInt(request.getParameter("userId"));

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String number = request.getParameter("number");
		User user1 = new User(email, name, number, id);

		RequestDispatcher patcher = null;

		UserService userService = new UserService();

		try {

			userService.updateUser(user1);

			User updatedUser = UserService.findingUserByEmail(email);

			HttpSession session = request.getSession(false);
			session.setAttribute("User", updatedUser);
			patcher = request.getRequestDispatcher("sellerAccount.jsp");
			patcher.forward(request, response);
		} catch (ServiceException e) {
			String[] strArr = e.getMessage().split(":");
			String msg = strArr[strArr.length - 1];
			 patcher = request.getRequestDispatcher("updateUser.jsp?errorMessage=" + msg);
			patcher.forward(request, response);

		}

	}

}
