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

import com.fssa.healthyhair.model.Cart;
import com.fssa.healthyhair.model.User;
import com.fssa.healthyhair.service.CartService;
import com.fssa.healthyhair.service.exception.ServiceException;

@WebServlet("/ListCartServlet")
public class ListCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user =(User) session.getAttribute("User");
		int id = user.getUserId();
		
		try {
			List<Cart> cart = CartService.findCartItemsByuserId(id);
			session.setAttribute("cartProduct", cart);
			RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
		
	}

	

}
