package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Manager;
import com.dao.QueryRunner_M;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getSession().removeAttribute("username");
		response.sendRedirect("/PersonPowerManagerSystem/login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("txtName");
		String pwd = request.getParameter("txtPwd");
		
		try {
			Manager m = QueryRunner_M.query(new String[] {name,pwd});
			if (m != null) {
				request.getSession().setAttribute("username", name);
				response.sendRedirect("/PersonPowerManagerSystem/index.jsp");
				return;
			}else {
				request.setAttribute("error", "Login Failed,Try Again!");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
