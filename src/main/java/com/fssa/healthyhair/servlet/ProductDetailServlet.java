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

import com.fssa.healthyhair.model.Product;
import com.fssa.healthyhair.service.ProductService;
import com.fssa.healthyhair.service.exception.ServiceException;

/**
 * Servlet implementation class ProductDetailServlet
 */
@WebServlet("/ProductDetailServlet")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int productId = Integer.parseInt(request.getParameter("productId"));
		PrintWriter out = response.getWriter();
		
		try {
		    Product product = ProductService.findProductById(productId);
		   
		    if (product != null) {
		        HttpSession session = request.getSession();
		        session.setAttribute("product", product);
		        out.println(product);
		        RequestDispatcher dispatcher = request.getRequestDispatcher("productDetails.jsp");
		        dispatcher.forward(request, response);	 
		     }
		} catch(ServiceException e) {
		    e.printStackTrace();
		  
		}
		
	}

	

}
