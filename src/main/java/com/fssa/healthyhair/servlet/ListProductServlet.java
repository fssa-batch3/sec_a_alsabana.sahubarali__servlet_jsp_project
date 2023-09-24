package com.fssa.healthyhair.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

@WebServlet("/ListProductServlet")
public class ListProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String setname = "products";
			String setCategory = "category";
			String category = request.getParameter("category");
			// Call the getAllProduct method in ProductService to get a list of products
			PrintWriter out = response.getWriter();
			List<Product> productList = ProductService.getAllProduct();
			List<Product> ayurvedic = new ArrayList<>();
			List<Product> avacado = new ArrayList<>();
			List<Product> samples = new ArrayList<>();
			List<Product> caffeine = new ArrayList<>();
			RequestDispatcher dispatcher = null;
			// Set the productList as an attribute in the request
			for (Product i : productList) {
				if (i.getCategory().equalsIgnoreCase("Ayurvedic range")) {
					ayurvedic.add(i);
				}
				if (i.getCategory().equalsIgnoreCase("avocado range")) {
					avacado.add(i);
				}
				if (i.getCategory().equalsIgnoreCase("our sample")) {
					samples.add(i);
				}
				if (i.getCategory().equalsIgnoreCase("caffeine")) {
					caffeine.add(i);
				}

			}

			if (category.equalsIgnoreCase("ayurvedic")) {
				request.setAttribute(setCategory, "ayurvedic");
				request.setAttribute(setname, ayurvedic);

			}
			if (category.equalsIgnoreCase("avacado")) {
				request.setAttribute(setCategory, "avocado");
				request.setAttribute(setname, avacado);

			}
			if (category.equalsIgnoreCase("all")) {
				request.setAttribute(setCategory, "all");
				request.setAttribute(setname, productList);

			}
			if (category.equalsIgnoreCase("sample")) {
				request.setAttribute(setCategory, "sample");
				request.setAttribute(setname, samples);

			}

			dispatcher = request.getRequestDispatcher("listProduct.jsp");

//			request.setAttribute("products", productList);
			// Get a request dispatcher for the "listProduct.jsp" page
//		
			// Forward the request and response objects to the "listProduct.jsp" page
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			e.getMessage();
		}

	}
}
