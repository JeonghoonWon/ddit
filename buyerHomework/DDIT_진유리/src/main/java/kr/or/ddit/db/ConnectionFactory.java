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
	private static String connectionMessage;//DAY19(210402)
	private static DataSource ds;//DAY19(210402)
	static {
		/*Properties properties = new Properties();
		try (
			InputStream is = ConnectionFactory.class.getResourceAsStream("dbInfo.properties");
		){
			properties.load(is);*/
			ResourceBundle bundle 
				= ResourceBundle.getBundle("kr.or.ddit.db.dbInfo", Locale.ENGLISH);
			
			driverClassName = bundle.getString("driverClassName");
			url = bundle.getString("url");
			user = bundle.getString("user");
			password = bundle.getString("password");
			connectionMessage=bundle.getString("connectionMessage");
			
			//driverClassName = properties.getProperty("driverClassName");
			//url = properties.getProperty("url");
			//user = properties.getProperty("user");
			//password = properties.getProperty("password");
			
			//int initialSize = Integer.parseInt(properties.getProperty("initialSize"));
			//int maxTotal = Integer.parseInt(properties.getProperty("maxTotal"));
			//long maxWait = Long.parseLong(properties.getProperty("initialSize"));
			int initialSize = Integer.parseInt(bundle.getString("initialSize"));
			int maxTotal = Integer.parseInt(bundle.getString("maxTotal"));
			long maxWait = Long.parseLong(bundle.getString("initialSize"));
			
			
			ds = new BasicDataSource();
			((BasicDataSource)ds).setDriverClassName(driverClassName);
			((BasicDataSource)ds).setUrl(url);
			((BasicDataSource)ds).setUsername(user);
			((BasicDataSource)ds).setPassword(password);
			
			((BasicDataSource)ds).setMaxTotal(maxTotal);//최대몇개까지 운영할 것인가??
			((BasicDataSource)ds).setInitialSize(initialSize);
			((BasicDataSource)ds).setMaxWaitMillis(maxWait);//최대얼마동안 기다리게 할것인가??

			
//			ds = new OracleDataSource();
//			((OracleDataSource)ds).setURL(url);
//			((OracleDataSource)ds).setUser(user);
//			((OracleDataSource)ds).setPassword(password);
			//구연체가 가지고있는 setter를 쓰기위해  앞에 묶어서 사용
			
			//polling객체를 정의해줄 것이 없음
			//ds = new OracleDataSource();=> 하드코잉하는것이 맞을까???
			//=>오라클만 사용할 수 있겠금 되어있다. => 다른 sql을 사용할 수 없게된다.
			//특정오라클에서 특정지어서 사용할수 없게됨
			
			//============================================
			//Class.forName(driverClassName);
		/*} catch (IOException e) {
			//ClassNotFoundException | IOException을 만나도
			//RuntimeException으로 변경되서 들어간다.
			//Uncheck Exception으로 변경됬다.
			throw new RuntimeException(e);
		}*/
	}

	public static Connection getConnection() throws SQLException {
		/*String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
		String user = "JYR03";
		String password = "java";
		//return DriverManager.getConnection(url, user, password);
		System.out.println(connectionMessage);
		return ds.getConnection();
	}//코드를 고치지 않기 위해서는 하드코잉되어있는 부분을 수정해야 한다.
}