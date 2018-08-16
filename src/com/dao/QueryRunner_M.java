package com.dao;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.bean.Manager;
import com.util.C3P0;

/* 
 *  使用QueryRunner类,实现对数据表的 
 *  insert delete update 
 *  调用QueryRunner类的方法 update (Connection con,String sql,Object...param) 
 *  Object...param 可变参数,Object类型,SQL语句会出现?占位符 
 *  数据库连接对象,自定义的工具类传递 
 */  
public class QueryRunner_M {

	private static Connection con = C3P0.getConnections();
	
	public static Manager query(Object[] params) throws SQLException {
		
		QueryRunner qr = new QueryRunner();
		String sql = "select * from manager where Mname=? and Mpwd=?";
		Manager m = qr.query(con, sql, new  BeanHandler<>(Manager.class), params);
		return m;
	}
}
