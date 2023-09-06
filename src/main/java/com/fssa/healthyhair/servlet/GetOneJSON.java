package com.fssa.healthyhair.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fssa.healthyhair.model.Product;

/**
 * Servlet implementation class GetOneJSON
 */
@WebServlet("/GetOneJSON")
public class GetOneJSON extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetOneJSON() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Product> product = new ArrayList<>();
		
		product.add(new Product("Ayurvedashampoo", 3700,
				"https://www.gkhair.co.in/cdn/shop/files/Balancing-banner_023150bb-42a3-4452-bbe8-aa23828dfdd1_1600x.png?v=1673589283",
				"A power-packed, leave in scalp serum strengthens hair roots and promotes fast and healthy hair growth.\r\n"
						+ "A vital scalp treatment that helps remove dead skin cells, product build up and give roots the chance to thrive, control hyper production of scalp serum, tackle itchiness and flakiness.",
				"ayurvedic"));

		JSONObject accountsJSonArray = new JSONObject(product);
		PrintWriter out = response.getWriter();
		out.println(accountsJSonArray.toString());
		out.flush();
	}

}
