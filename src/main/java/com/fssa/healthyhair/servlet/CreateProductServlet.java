package com.fssa.healthyhair.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.healthyhair.model.Product;
import com.fssa.healthyhair.model.User;
import com.fssa.healthyhair.service.ProductService;
import com.fssa.healthyhair.service.exception.ServiceException;

/**
 * Servlet implementation class CreateProductServlet
 */
@WebServlet("/CreateProductServlet")
public class CreateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
 
		ProductService productservice = new ProductService();
		// Get parameters from the request
		String productName = request.getParameter("productName");
		String productPrice = request.getParameter("productCost");
		int productCost = Integer.parseInt(productPrice);
		String productImage = request.getParameter("productURL");
		String productDetail = request.getParameter("productDetail");
		String category = request.getParameter("category");

		User user = (User) request.getSession(false).getAttribute("User");

		// Create a new Product instance
		Product product1 = new Product(productName, productCost, productImage, productDetail, category, user);

		try {
			productservice.createProduct(product1);
			response.sendRedirect("ListProductServlet");
		} catch (ServiceException e) {
			String[] strArr = e.getMessage().split(":");
			String msg = strArr[strArr.length - 1];
			RequestDispatcher patcher = request.getRequestDispatcher("createProduct.jsp?errorMessage=" + msg);
			patcher.forward(request, response);
		}

	}

}
