package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.Base64;
import java.util.Set;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import kr.or.ddit.validator.DeleteGroup;
import kr.or.ddit.validator.InsertGroup;
import kr.or.ddit.validator.constraint.TelephoneNumber;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 회원 관리를 위한 Domain Layer(Java Bean 규약)
 *
 * Data Mapper(SQL Mapper)를 이용한 다중 테이블 조인 방법
 * ex) 한명의 회원과 그동안 구매한 상품 목록을 함께 조회.
 * 1. 메인 데이터를 가진 메인 테이블을 식별(Member)
 * 2. 조인의 대상이 되는 테이블로부터 조회된 데이터를 바인딩할 VO 설계.
 * 	  (MemberVO, ProdVO)
 * 3. 테이블 사이의 관계를 VO 사이의 관계로 구조화.(*언제나 메인테이블은 1의 관계로 만들어준다.*)
 * 		1:N - has many (MemberVO has many ProdVO)
 * 		1:1 - has a (ProdVO has a BuyerVO)
 * 4. resultType 을 대신하여 resultMap 으로 수동 바인딩 설정
 * 		1:N - collection 엘리먼트
 * 		1:1 - association 엘리먼트
 * 		(Member.xml -> memberMap)
 * 
 */
@EqualsAndHashCode(of= {"mem_id", "mem_regno1", "mem_regno2"}) 
@ToString(exclude= {"mem_pass", "mem_regno1", "mem_regno2", "mem_img"}) 
@Data
@NoArgsConstructor 
@AllArgsConstructor
public class MemberVO implements Serializable{
	
	public MemberVO(String mem_id, String mem_pass) {
		super();
		this.mem_id = mem_id;
		this.mem_pass = mem_pass;
	}

	private int rnum;
	@NotBlank(groups= {InsertGroup.class, DeleteGroup.class}, message="아이디 필수")
	private String mem_id;
	@NotBlank(message= "{NotBlank.kr.or.ddit.vo.MemberVO.mem_pass.message}")
	@Size(min=4, max=8, message="{Size.kr.or.ddit.vo.MemberVO.mem_pass.message}")
	private String mem_pass;
	@NotBlank(groups=InsertGroup.class)
	private String mem_name;
	@NotBlank(groups=InsertGroup.class)
	private String mem_regno1;
	@NotBlank(groups=InsertGroup.class)
	private String mem_regno2;
	private String mem_bir;
	@NotBlank
	private String mem_zip;
	@NotBlank
	private String mem_add1;
	@NotBlank
	private String mem_add2;
	@TelephoneNumber
	private String mem_hometel;
	@TelephoneNumber
	private String mem_comtel;
	@TelephoneNumber
	private String mem_hp;
	@NotBlank
	@Email
	private String mem_mail;
	private String mem_job;
	private String mem_like;
	private String mem_memorial;
	private String mem_memorialday;
	private Integer mem_mileage;
	private String mem_delete;
	
	private Set<ProdVO> prodList; // has many(1:N) 관계
	
	private String mem_role;
	
	private transient byte[] mem_img;
	
	public String getBase64Image() {
		String encoded = null;
		if(mem_img!=null)
			encoded = Base64.getEncoder().encodeToString(mem_img);
		return encoded;
	}
}