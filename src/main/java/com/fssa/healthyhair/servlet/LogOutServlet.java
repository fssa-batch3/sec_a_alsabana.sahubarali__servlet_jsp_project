package com.fssa.healthyhair.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogOutServlet
 */
@WebServlet("/LogOutServlet")
public class LogOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LogOutServlet() {
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
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.removeAttribute("loggedInEmail");
			session.removeAttribute("name");
			System.out.println("Existing Session ID:" + session.getId());

			// invalidate removes all the session attributes
			session.invalidate();

		} else {
			System.out.println("No Session Exists");
		}

		// Redirecting to login page since we have logged out
		response.sendRedirect("index.jsp");
	}


}
