<%@page import="kr.or.ddit.buyer.BuyerVO"%>
<%@page import="kr.or.ddit.ibatis.config.SqlMapClientFactory"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 클라이언트 요청시 전송되는 데이터 받기
		String buyer_id = request.getParameter("id");	//ajax에서 id 가져와서
	
	
	//2. SqlMapClient 객체 얻기
		SqlMapClient client = SqlMapClientFactory.getClient();
	
	
	//3. sql문 실행 - select - 
		BuyerVO vo = (BuyerVO)client.queryForObject("buyer.selectByDetails",buyer_id); //papameter 값인 buyer_id를 넣어 buyer.xml의 sql문을 실행시킨다.
%>

{
	"id" 		: "<%= vo.getBuyer_id() %>",
	"name" 		: "<%= vo.getBuyer_name() %>",
	"lgu" 		: "<%= vo.getBuyer_lgu() %>",
	"mail" 		: "<%= vo.getBuyer_mail() %>",
	"bank" 		: "<%= vo.getBuyer_bank() %>",
	"bankname"  : "<%= vo.getBuyer_bankname() %>",
	"bankno" 	: "<%= vo.getBuyer_bankno() %>"
	

}