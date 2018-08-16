package com.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.PageBean;
import com.bean.User;
import com.dao.QueryRunner_U;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
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

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		int page;
		// 当前页：当页面操作后，获取的一个数值page
		if (request.getParameter("page") == null) { // 第一次访问
			page=1;
		}else{
			page = Integer.parseInt(request.getParameter("page"));
		}
		// 每页条数
		int pageCount = 18;
		QueryRunner_U qru = new QueryRunner_U();
		
		PageBean pb=new PageBean();
		pb.setPage(page);
		pb.setPageCount(pageCount);
		// 总条数
		int allTr = qru.getAllTr();
		pb.setAllTr(allTr);
		
		List<User> list = QueryRunner_U.search(pb.getStartIndex(),pageCount);
		pb.setList(list);
		
		request.setAttribute("pb", pb);
		request.getRequestDispatcher("/index/YHChannelApply.jsp").forward(request, response);
		
	}

}
