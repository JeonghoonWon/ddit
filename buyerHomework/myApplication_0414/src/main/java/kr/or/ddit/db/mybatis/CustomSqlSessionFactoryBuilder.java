package kr.or.ddit.db.mybatis;

import java.io.IOException;
import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class CustomSqlSessionFactoryBuilder {
	private static SqlSessionFactory sessionFactory;
	static {
		String xmlRes = "kr/or/ddit/db/mybatis/config.xml";
		try (
			Reader reader = Resources.getResourceAsReader(xmlRes);//입력스트림하나개방
		){
			sessionFactory = new SqlSessionFactoryBuilder().build(reader);
		}catch (IOException e) {
			throw new RuntimeException(e);//반드시 원본의 에러를 넘기기
		}
	}
	
	public static SqlSessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
}