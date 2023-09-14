package com.fssa.healthyhair.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.healthyhair.model.Product;
import com.fssa.healthyhair.model.User;
import com.fssa.healthyhair.service.ProductService;
import com.fssa.healthyhair.service.exception.ServiceException;

/**
 * Servlet implementation class SellerProductList
 */
@WebServlet("/SellerProductList")
public class SellerProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("User");
		try {
			// Call the getAllProduct method in ProductService to get a list of products
			List<Product> productList =  ProductService.getAllProduct();
			 // Set the productList as an attribute in the request
			
			List<Product> matchedProduct = new ArrayList<>();
			
			for(Product product:productList) {
				if(user.getUserId()==(product.getCreatedUser().getUserId())) {
					matchedProduct.add(product);
				}
			}
			request.setAttribute("matchedProduct", matchedProduct);
			// Get a request dispatcher for the "listProduct.jsp" page
			RequestDispatcher dispatcher = request.getRequestDispatcher("sellerList.jsp");
			 // Forward the request and response objects to the "listProduct.jsp" page
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			     e.getMessage();
		}
	}

	
}
