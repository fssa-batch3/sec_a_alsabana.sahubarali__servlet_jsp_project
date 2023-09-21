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
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		User user = (User) session.getAttribute("User");

		RequestDispatcher patcher = null;
		int id = Integer.parseInt(request.getParameter("userId"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String number = request.getParameter("number");
		String companyName = request.getParameter("companyName");
		String licenseImage = request.getParameter("licenseImage");
		String companyAddress = request.getParameter("companyAddress");
		User user1 = new User(email, name, number, companyName, companyAddress, licenseImage, id);

		try {
			UserService.updateUser(user1);
			User updatedUser = UserService.findingUserByEmail(email);
			session = request.getSession(false);
			session.setAttribute("User", updatedUser);
			patcher = request.getRequestDispatcher("sellerAccount.jsp");
			patcher.forward(request, response);
		} catch (ServiceException e) {
			String[] strArr = e.getMessage().split(":");
			String msg = strArr[strArr.length - 1];
			patcher = request.getRequestDispatcher("sellerAccount.jsp?errorMessage=" + msg);
			patcher.forward(request, response);

		}
	}
}
