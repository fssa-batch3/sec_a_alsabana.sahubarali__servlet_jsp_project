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
 * Servlet implementation class EditBuyerServlet
 */
@WebServlet("/EditBuyerServlet")
public class EditBuyerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditBuyerServlet() {
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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String number = request.getParameter("number");
		String profile = request.getParameter("profile");
		String address = request.getParameter("address");
		RequestDispatcher patcher = null;
		int id = Integer.parseInt(request.getParameter("userId"));
		User user2 = new User(email, name, number, id, address, profile);
		PrintWriter out = response.getWriter();

		try {
			out.println("success");
			UserService.updateBuyer(user2);
			out.println(" after success");
			User update = UserService.findingUserByEmail(email);
			session.setAttribute("User", update);
			patcher = request.getRequestDispatcher("account.jsp");
			patcher.forward(request, response);
		} catch (ServiceException e) {
			String[] strArr = e.getMessage().split(":");
			String msg = strArr[strArr.length - 1];
			patcher = request.getRequestDispatcher("account.jsp?errorMessage=" + msg);
			patcher.forward(request, response);
		}
	}

}
