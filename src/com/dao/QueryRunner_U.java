package com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.bean.User;
import com.util.C3P0;

/* 
 *  使用QueryRunner类,实现对数据表的 
 *  insert delete update 
 *  调用QueryRunner类的方法 update (Connection con,String sql,Object...param) 
 *  Object...param 可变参数,Object类型,SQL语句会出现?占位符 
 *  数据库连接对象,自定义的工具类传递 
 */  
public class QueryRunner_U {

	private static Connection con = C3P0.getConnections();
	//创建QueryRunner类对象  
	private static QueryRunner qr = new QueryRunner();
	
	public static int insert(Object[] params) throws SQLException {
		
		String sql = "insert into user (uname, uweb, uad, ustatus) values (?,?,?,?)";
		//调用QueryRunner类的方法update执行SQL语句 
		int row = qr.update(con, sql, params);
		if (row > 0) {
			System.out.println("Insert Succ");
		} else {
			System.out.println("Insert Failed");
		}
		return row;
	}
	
	public static int delete(Object[] params) throws SQLException {
		
		String sql = "delete from user where uid=?";
		
		//调用QueryRunner类的方法update执行SQL语句 
		int row = qr.update(con, sql, params);
		return row;
	}
	
	public static int update(Object[] params) throws SQLException {
		
		String sql = "update user set uname=?, uweb=?, uad=?, ustatus=? where uid=?";
		//调用QueryRunner类的方法update执行SQL语句 
		int row = qr.update(con, sql, params);
		if (row > 0) {
			System.out.println("Update Succ");
		} else {
			System.out.println("Update Failed");
		}
		return row;
	}

	public static User search() {
		
		String sql = "select * from user";
		User u;
		try {
			u = qr.query(con, sql, new BeanHandler<>(User.class));
			return u;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static User searchOne(Object[] params) {
		
		String sql = "select * from user where Uid=?";
		try {
			User list = qr.query(con, sql, new BeanHandler<User>(User.class), params);
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/** 
	 * QueryRunner数据查询操作 
	 *  调用QueryRunner类方法query(Connection con,String sql,ResultSetHandler r,Object..params) 
	 *      ResultSetHandler r 结果集的处理方式，传递ResultSetHandler接口实现类 
	 *      Object...params sql语句的?占位符 
	 *   
	 * 注意：query方法返回值，返回的是T 泛型，具体返回值类型，跟随结果集处理方式变化
	 * 
	 *  
     * 结果集第一种处理方法，ArrayHandler 
     * 将结果第一行存储到对象数组中Object[] 
     * @throws SQLException  
     * */  
    public static void ArrayHandler() throws SQLException {  
        
        String sql = "SELECT * FROM user";  
        //调用query执行查询，传递连接对象，SQL语句，结果集处理方式的实现类   
        //返回对象数组  
        Object[] result = qr.query(con, sql,new org.apache.commons.dbutils.handlers.ArrayHandler());  
        for (Object obj : result) {  
            System.out.println(obj);  
        }  
    }  
      
    /** 
     * 结果集的第二种处理方法，ArrayListHandler 
     * 将结果集的每一行，封装到对象数组中，出现很多对象数组 
     * 对象数组存储到List集合 
     * @throws SQLException  
     * */  
    public static void arrayListHandler() throws SQLException{  
     
        String sql  = "SELECT * FROM manager";  
        //调用query方法，结果集处理的参数上，传递实现类ArrayListHandler  
        //方法返回值 每行是一个数组  
        List<Object[]> result = qr.query(con, sql, new ArrayListHandler());  
        //集合的遍历  
        for (Object[] objs : result) {  
            for (Object obj : objs) {  
                System.out.print(obj+"\t");  
            }  
            System.out.println();  
        }  
    }  
      
    /** 
     * 结果集的第七种处理方式，MapHandler 
     * 将结果集第一行数据，封装到Map集合中 
     * Map<键，值> 键：列名 值：这列数据 
     * @return 
     * @throws SQLException  
     * */  
    public static Map<String, Object> mapHandler() throws SQLException{  
  
        String sql = "SELECT * FROM user where id=?";  
        //调用方法query，传递结果集实现类MapHandler  
        //返回值：Map集合，Map接口实现类 泛型  
        Map<String,Object> map = qr.query(con, sql,new MapHandler());  
        return map;
    }  
    /** 
     * 结果集第八种处理方法，MapListHandler 
     * 将结果集每一行存储到Map集合，键：列名 值：数据 
     * Map集合过多，存储到List集合 
     * @return 
     * @throws SQLException  
     * */  
    public static List<Map<String, Object>> mapListHandler() throws SQLException{  
         
        String sql = "SELECT * FROM user";  
        //调用方法query，传递结果集实现类MapListHander  
        //返回值List集合，存储的是Map集合  
        List<Map<String, Object>> list = qr.query(con, sql,new MapListHandler());  
		return list;  
    }  
    
    public void closeConn() {
    	
    	DbUtils.closeQuietly(con);
    }
    
    public int getAllTr() {
		String sql="select count(*) from user";
		int allTr = 0;
		try {
			// 赋值
			Number num =(Number) qr.query(con, sql, new  ScalarHandler());// Object--》Number--》int
			allTr = num.intValue();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return allTr;
	}
	
	
	public static List<User> search(int startIndex,int pageCount) {
		// 给定sql
		String sql="select * from user limit ?,?";
		
		try {
			// 查询所有数据，且放入到集合List中
			List<User> list = qr.query(con, sql, new BeanListHandler<User>(User.class), startIndex, pageCount);
			return list;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
