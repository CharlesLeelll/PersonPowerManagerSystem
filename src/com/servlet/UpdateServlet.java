package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.User;
import com.dao.QueryRunner_U;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");//获得被修改数据的id
		
		User one = QueryRunner_U.searchOne(new String[] {id});
		request.setAttribute("one", one);
		request.getRequestDispatcher("/index/YHUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("uid"));
		String name = request.getParameter("uname");
		String web = request.getParameter("uweb");
		String status_s = request.getParameter("ustatus");
		String ad = request.getParameter("uad");
		
		int status = 0;
		if (status_s.equals("t")) {
			status = 1;
		} else {
			status = 0;
		}
		Object[] params = {name, web, ad, status, id};
		try {
			int row = QueryRunner_U.update(params);
			
			if (row > 0) {
				request.setAttribute("upSucc", "修改成功!");
				request.getRequestDispatcher("SearchOneServlet?id=" + id).forward(request, response);
			}else {
				request.getRequestDispatcher("index.jsp").forward(request, response);
				request.setAttribute("upError", "修改失败!");
				response.getWriter().write("<br /><br /><br /><br /><h1 align=center>修改失败!</h1>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
