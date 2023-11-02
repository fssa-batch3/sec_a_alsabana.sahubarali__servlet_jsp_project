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

import com.fssa.healthyhair.model.Cart;
import com.fssa.healthyhair.model.Product;
import com.fssa.healthyhair.model.User;
import com.fssa.healthyhair.service.CartService;
import com.fssa.healthyhair.service.ProductService;
import com.fssa.healthyhair.service.exception.ServiceException;

/**
 * Servlet implementation class CreateCartServlet
 */
@WebServlet("/CreateCartServlet")
public class CreateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("productId"));
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("User");

		try {
		
			 ProductService.findProductById(id);
			Cart cart = new Cart();
			Product product1 = new Product();
			product1.setProductId(id);
			cart.setCartProduct(product1);
			User user1 = new User();
			user1.setUserId(user.getUserId());
			cart.setAddedUser(user1);
			CartService.addToCart(user.getUserId(), id);
			RequestDispatcher dispatcher = request.getRequestDispatcher("ListCartServlet");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			e.getMessage();

		}

	}

}
