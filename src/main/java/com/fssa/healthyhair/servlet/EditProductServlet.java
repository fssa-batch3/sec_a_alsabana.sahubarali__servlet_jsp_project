package com.fssa.healthyhair.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.healthyhair.model.Product;
import com.fssa.healthyhair.service.ProductService;
import com.fssa.healthyhair.service.exception.ServiceException;

/**
 * Servlet implementation class EditProductServlet
 */
@WebServlet("/EditProductServlet")
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int productId = Integer.parseInt(request.getParameter("productId"));
		RequestDispatcher patcher = null;
		try {
			Product product = ProductService.findProductById(productId);

			request.setAttribute("updateProduct", product);

			patcher = request.getRequestDispatcher("updateProduct.jsp");
			patcher.forward(request, response);

		} catch (ServiceException e) {
			out.print(e.getMessage());
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("productId"));

		String productName = request.getParameter("productName");
		int cost = Integer.parseInt(request.getParameter("productCost"));
		String imageURL = request.getParameter("productURL");
		String productDetail = request.getParameter("productDetail");
		String category = request.getParameter("category");

		try {
			Product product1 = new Product(id, productName, cost, imageURL, productDetail, category);
			ProductService productService = new ProductService();
			productService.updateProduct(product1);

			response.sendRedirect("SellerProductList");

		} catch (ServiceException e) {
			String[] strArr = e.getMessage().split(":");
			String msg = strArr[strArr.length - 1];
			// Set the error message as a request attribute
			request.setAttribute("errorMessage", msg);
			RequestDispatcher dispatcher = request.getRequestDispatcher("updateProduct.jsp");
			dispatcher.forward(request, response);
		}
	}

}
