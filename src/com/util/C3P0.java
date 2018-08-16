package com.util;

import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3P0 {

	private static ComboPooledDataSource ds = new ComboPooledDataSource();
	
	
	//连接对象
	public static Connection getConnections() {

		try {
			return ds.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	//池对象
	public static ComboPooledDataSource getDataSource() {
		return ds;
	}
	
	public static void main(String[] args) throws SQLException {
		
		System.out.println(C3P0.getConnections() + "\n" + getDataSource());
	}
}
