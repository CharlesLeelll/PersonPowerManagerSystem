package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.PageBean;
import com.bean.User;
import com.dao.QueryRunner_U;

/**
 * Servlet implementation class PageServlet
 */
@WebServlet("/PageServlet")
public class PageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 处理编码
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		int page;
		// 当前页：当页面操作后，获取的一个数值page
		if (request.getParameter("page") == null) {// 第一次访问
			page=1;
		}else{
			page = Integer.parseInt(request.getParameter("page"));
		}
		// 每页条数
		int pageCount = 18;
		
		// 查询所有
		QueryRunner_U qru = new QueryRunner_U();
		
		// 获取所有数据都在PageBean
		PageBean pb=new PageBean();
		pb.setPage(page);
		pb.setPageCount(pageCount);
		// 总条数
		int allTr = qru.getAllTr();
		pb.setAllTr(allTr);
		// 分页查询数据
		List<User> list = QueryRunner_U.search(pb.getStartIndex(),pageCount);
		// 封装数据
		pb.setList(list);
		
		// 保存数据到请求域
		request.setAttribute("pb", pb);
		
		//转发到/index/YHChannelApply.jsp
		request.getRequestDispatcher("/index/YHChannelApply.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
