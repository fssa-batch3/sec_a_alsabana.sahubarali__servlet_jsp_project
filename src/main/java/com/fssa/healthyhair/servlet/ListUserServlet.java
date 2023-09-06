package com.fssa.healthyhair.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.healthyhair.dao.UserDAO;
import com.fssa.healthyhair.dao.exception.DAOException;
import com.fssa.healthyhair.model.User;

/**
 * Servlet implementation class ListUserServlet
 */
@WebServlet("/ListUserServlet")
public class ListUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDAO userDAO = new UserDAO();
		try {
			List<User> userList = userDAO.allUser();
			request.setAttribute("user", userList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("userList.jsp");
			dispatcher.forward(request, response);
		} catch (DAOException e) {
			throw new ServletException("Unable to retrieve User list", e);
		}

	}
}
