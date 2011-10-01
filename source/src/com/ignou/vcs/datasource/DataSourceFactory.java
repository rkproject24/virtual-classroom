
package com.ignou.vcs.datasource;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DataSourceFactory {
	
	private static DataSource datasource = null;
	
	public static void initialize()
	{
		try {
        	InitialContext initCtxt = new InitialContext();
        	datasource = (DataSource)initCtxt.lookup("java:comp/env/jdbc/vcs");
		} catch (NamingException e){
			e.printStackTrace();
		}
	}
	
	public static DataSource getDataSource()
	{
		if (datasource == null) initialize();
		return datasource;
	}
	
	public static void destroy()
	{
		datasource = null;
	}
	
	public static Connection getConnection()
	{
		Connection conn = null;
		String userName = "root";
        String password = "root";
        String url = "jdbc:mysql://localhost:3306/VCS_SCHEMA";
        try {
			Class.forName ("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, userName, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        System.out.println ("");
        return conn;
	}
}
