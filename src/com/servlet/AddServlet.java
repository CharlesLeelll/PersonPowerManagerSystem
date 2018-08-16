package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.QueryRunner_U;

/**
 * Servlet implementation class RegServlet
 */
@WebServlet("/AddServlet")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.sendRedirect("/PersonPowerManagerSystem/index/YHAdd.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String web = request.getParameter("web");
		String ad = request.getParameter("ad");
		String status_s = request.getParameter("status");
		
		int status = 0;
		if (status_s.equals("t")) {
			status = 1;
		} else {
			status = 0;
		}
		Object[] params = {name, web, ad, status };
		try {
			int row = QueryRunner_U.insert(params);
			
			if (row > 0) {
				response.setIntHeader("Refresh", 0);
				request.setAttribute("addSucc", "添加成功!");
			}else {
				request.getRequestDispatcher("/index/YHAdd.jsp").forward(request, response);
				request.setAttribute("addError", "添加失败!");
				response.getWriter().write("<br /><br /><br /><br /><h1 align=center>添加失败!</h1>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
