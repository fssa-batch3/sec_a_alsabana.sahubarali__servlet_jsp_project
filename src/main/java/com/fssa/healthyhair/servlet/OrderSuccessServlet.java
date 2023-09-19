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
import com.fssa.healthyhair.service.ProductService;
import com.fssa.healthyhair.service.exception.ServiceException;

/**
 * Servlet implementation class OrderSuccessServlet
 */
@WebServlet("/OrderSuccessServlet")
public class OrderSuccessServlet extends HttpServlet {
	

	private static final long serialVersionUID = 1L;
    
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Order order = (Order) session.getAttribute("order");
		PrintWriter out = response.getWriter();
	   int id=	order.getOrderedProduct().getProductId();		
        try {
		  Product orderProduct=ProductService.findProductById(id);
		  long orderId = System.currentTimeMillis(); 
		  request.setAttribute("orderId", orderId);
		  session.setAttribute("orderProduct", orderProduct);
		  RequestDispatcher dispatcher = request.getRequestDispatcher("orderSuccess.jsp");
		  dispatcher.forward(request, response);
		} catch (ServiceException e) {
		      out.println(e.getMessage());
		}
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    doGet(req, resp);
	}


}
