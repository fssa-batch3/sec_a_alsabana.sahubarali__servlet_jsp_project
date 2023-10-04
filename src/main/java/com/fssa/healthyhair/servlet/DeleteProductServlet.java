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

import com.fssa.healthyhair.model.Product;
import com.fssa.healthyhair.service.OrderService;
import com.fssa.healthyhair.service.ProductService;
import com.fssa.healthyhair.service.exception.ServiceException;

/**
 * Servlet implementation class deleteProductServlet
 */
@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
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

		ProductService productService = new ProductService();
		List<Product> product = null;
		RequestDispatcher dispatcher = null;
		try {
			if (OrderService.doesOrderExistForProduct(id)) {
				request.setAttribute("errorMessage",
						"OOPS! You can't delete this product because our customer ordered this product");
				dispatcher = request.getRequestDispatcher("SellerProductList");
				dispatcher.forward(request, response);
			} else {
				productService.deleteProduct(id);
				product = ProductService.getAllProduct();
				session.setAttribute("products", product);
				response.sendRedirect("SellerProductList");
			}
		} catch (ServiceException e) {

			dispatcher = request.getRequestDispatcher("SellerProductList.jsp?errorMessage=" + e.getMessage());
			dispatcher.forward(request, response);
		}
		


	}
}
