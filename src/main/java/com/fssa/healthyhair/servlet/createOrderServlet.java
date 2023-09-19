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

import com.fssa.healthyhair.model.Order;
import com.fssa.healthyhair.model.Product;
import com.fssa.healthyhair.model.User;
import com.fssa.healthyhair.service.OrderService;
import com.fssa.healthyhair.service.exception.ServiceException;

/**
 * Servlet implementation class createOrderServlet
 */
@WebServlet("/createOrderServlet")
public class createOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String number = request.getParameter("mobile");
		User user = (User) request.getSession(false).getAttribute("User");
		int buyerId = user.getUserId();
		int productId = Integer.parseInt(request.getParameter("productId"));
		String pincode = request.getParameter("pincode");
		boolean payment = Boolean.parseBoolean(request.getParameter("payment"));
		String name = request.getParameter("name");
		Product product = new Product();
		product.setProductId(productId);
		User user1 = new User();
		user1.setUserId(buyerId);
		Order order = new Order(product, quantity, user1, address, city, number, payment, pincode, name);
	
		try {

			OrderService.createOrder(order);
			HttpSession session = request.getSession(false);
			session.setAttribute("order", order);
			RequestDispatcher dispatcher = request.getRequestDispatcher("OrderSuccessServlet");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			
			String[] strArr = e.getMessage().split(":");
			String msg = strArr[strArr.length - 1];
			
			request.setAttribute("name", name);
			request.setAttribute("number", number);
			request.setAttribute("address", address);
			request.setAttribute("city", city);
			request.setAttribute("pincode", pincode);
			
			RequestDispatcher	patcher = request.getRequestDispatcher("orderDetails.jsp?errorMessage=" + msg);
			patcher.forward(request, response);
		}
	}

}
