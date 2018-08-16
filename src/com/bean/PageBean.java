package com.bean;

import java.util.List;

/**
 *	讲师:张海清
 *	时间: 2018-4-21
 *	内容:分页
 */
public class PageBean {
	private int page;//当前页   从前台获取
	// private int allPage;// 总页数
	private int pageCount;// 每页条数  由前台自己设定，不需要getXXX
	private int allTr;// 总行数 
	private List<User>  list;// 分页数据
	
	public PageBean() {
		super();
	}
	public PageBean(int page, int pageCount, int allTr, List<User> list) {
		super();
		this.page = page;
		this.pageCount = pageCount;
		this.allTr = allTr;
		this.list = list;
	}
	
	/**
	 * 方法：getStartIndex()
	 * 参数：返回起始位置
	 * 返回值：int
	 * 描述：调用此方法获取查询语句的起始
	 */
	public int getStartIndex() {
		return (page-1)*pageCount;
	}
	//  总页数
	public int getAllPage() {
		/**
		 * 如果求余不等于0，则页数+1
		 * 反之页数为求商的结果
		 */
		if (allTr%pageCount == 0) {
			return allTr/pageCount; // 没有余数，正好XX页
		} else {
			return allTr/pageCount+1;
		}
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getAllTr() {
		return allTr;
	}
	public void setAllTr(int allTr) {
		this.allTr = allTr;
	}
	public List<User> getList() {
		return list;
	}
	public void setList(List<User> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "PageBean [page=" + page + ", pageCount=" + pageCount
				+ ", allTr=" + allTr + ", list=" + list + "]";
	}
	
}
