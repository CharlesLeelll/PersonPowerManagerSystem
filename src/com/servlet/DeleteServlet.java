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
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		System.out.println("id:" + id);
		try {
			int row = QueryRunner_U.delete(new String[] {id});
			System.out.println(row);
			if (row > 0) {
				request.setAttribute("delSucc", "删除成功!");
				response.setIntHeader("Refresh", 0);
			} else {
				request.getRequestDispatcher("index.jsp").forward(request, response);
				request.setAttribute("delError", "删除失败!");
				response.getWriter().write("<br /><br /><br /><br /><h1 align=center>删除失败!</h1>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
