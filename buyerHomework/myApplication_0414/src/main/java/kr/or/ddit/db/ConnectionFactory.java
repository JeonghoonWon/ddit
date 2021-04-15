package kr.or.ddit.db;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Locale;
import java.util.Properties;
import java.util.ResourceBundle;
import javax.sql.DataSource;
import org.apache.commons.dbcp2.BasicDataSource;

/**
 * Factory Object[Method] Pattern
 * 	: 객체 생성을 전담하는 객체를 운영하는 구조
 *
 */
public class ConnectionFactory {
	private static String driverClassName;
	private static String url;
	private static String user;
	private static String password;
	private static String connectionMessage;
	private static DataSource ds;
	static {
			ResourceBundle bundle 
				= ResourceBundle.getBundle("kr.or.ddit.db.dbInfo", Locale.ENGLISH);
			
			driverClassName = bundle.getString("driverClassName");
			url = bundle.getString("url");
			user = bundle.getString("user");
			password = bundle.getString("password");
			connectionMessage=bundle.getString("connectionMessage");
		
			int initialSize = Integer.parseInt(bundle.getString("initialSize"));
			int maxTotal = Integer.parseInt(bundle.getString("maxTotal"));
			long maxWait = Long.parseLong(bundle.getString("initialSize"));
			
			
			ds = new BasicDataSource();
			((BasicDataSource)ds).setDriverClassName(driverClassName);
			((BasicDataSource)ds).setUrl(url);
			((BasicDataSource)ds).setUsername(user);
			((BasicDataSource)ds).setPassword(password);
			
			((BasicDataSource)ds).setMaxTotal(maxTotal);
			((BasicDataSource)ds).setInitialSize(initialSize);
			((BasicDataSource)ds).setMaxWaitMillis(maxWait);

	}

	public static Connection getConnection() throws SQLException {
		System.out.println(connectionMessage);
		return ds.getConnection();
	}
}