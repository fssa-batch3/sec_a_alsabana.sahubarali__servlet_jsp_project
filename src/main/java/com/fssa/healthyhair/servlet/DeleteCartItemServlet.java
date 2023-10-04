package com.fssa.healthyhair.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.healthyhair.service.CartService;
import com.fssa.healthyhair.service.exception.ServiceException;

/**
 * Servlet implementation class DeleteCartItemServlet
 */
@WebServlet("/DeleteCartItemServlet")
public class DeleteCartItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("cartId"));

		try {
			CartService.remove(id);
			response.sendRedirect("ListCartServlet");
		} catch (ServiceException e) {
			e.printStackTrace();
		}

	}

}
