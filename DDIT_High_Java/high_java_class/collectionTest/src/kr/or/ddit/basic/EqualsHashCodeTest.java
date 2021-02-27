package kr.or.ddit.basic;

import java.util.HashSet;
import java.util.Set;

public class EqualsHashCodeTest {

	public static void main(String[] args) {
		Person p1 = new Person();
		
		p1.setId(1);
		p1.setName("홍길동");
		
		Person p2 = new Person();
//		p2.setId(2);
//		p2.setName("일지매");
		
		p2.setId(1);
		p2.setName("홍길동");
		System.out.println(p1==p2);  //false
	
		Person p3 = p1;
		
		System.out.println(p1==p2);
		System.out.println(p1.equals(p2));				// equals 로 비교를 하면 (p1==p2);와 같으며 주소값을 비교하기때문에 결과값은 false다.  
		System.out.println("-------------------------");// equals 는 Object 안에 들어가있음. 어디서나 사용 가능. 원하는 방식으로 비교를 하고 싶을 때 equals를 override로 재정의 해야함.
														// equals 를 재 정의 해서 true 값이 나온다.
		Set<Person> testSet = new HashSet<>();
		testSet.add(p1);
		testSet.add(p2);
		
		System.out.println("set의 크기 : " + testSet.size());
	
		System.out.println("p1 의 hashcode : " + p1.hashCode()); //713786339
		System.out.println("p2 의 hashcode : " + p2.hashCode()); //763347431
		System.out.println("p3 의 hashcode : " + p3.hashCode()); //713786339
		
		/*
		 	- equals() 메서드 ==> 두 객체의 내용이 같은지 검사하는 메서드
		 	- hashCode() 메서드 ==> 두 객체의 동일성을 검사하는 메서드
		 	
		 	- HashSet, Hashtable, HashMap 과 같은 Hash로 시작하는
		 	컬렉션 객체들은 객체의 의미상의 동일성을 비교하기 위해서 hashCode()
		 	메서드를 호출해서 비교한다. 그러므로 객체가 같은지 여부를 결정하려면
		 	hashCode 를 재정의 해야한다.
		 	
		 	- hashCode() 메서드에서 사용하는 '헤싱 알고리즘' 은 서로 다른 
		 	객체들에 대하여 같은 hashCode 값이 나타날 수 있다.
		 	(아주 낮은 확률로 같은 값이 나타 날 수 있기 때문에, equals 도 사용하여 비교해줘야한다.)
		 	
		 */
		
		
		}

}


class Person {
	private int id;
	private String name;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override   // equals 를 재정의 할 상황이 생기면 hashcode 도 함께 재정의 해줘야 한다.
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Person other = (Person) obj;
		if (id != other.id)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}
	
//	@Override
/*	public boolean equals(Object obj) {  // ctrl + spacebar 누르고 equals 더블클릭
		// 위에 생성해둔 클래스에 맞춰서 equals 정의 하면 된다.
		// (Object obj) 매개변수 Object 는 어느값이든 넣을 수 있다. 
		// 외부에서의 현재 값과 (Object obj) 의 값을 비교하게 되는 것.
		if(obj==null) return false;
		
			// 같은 유형의 클래스인지 겁사
		if(this.getClass() != obj.getClass()) {
			//getClass() : 객체의 종류를 알아내는 메서드
			return false;		
		}
		if(this==obj) {  // 참조값이 같은지 검사
			return true;
		}
		// public boolean equals(Object obj) 를 정의 할때 위에 부분은 대부분 동일. 아래 내용이 비교 내용에 따라 달라진다.
		
			// 매개변수의 값을 현재 객체 유형으로 형변환 한다.
		Person that = (Person)obj;
		
		if(this.name==null && that.name != null) {
			return false;
		}if(this.id == that.id && this.name == that.name) {
			//this.name == that.name => String 이지만 == 으로 비교한다는것은 null 이나 참조값을 비교하는 것
			return true;
		}if(this.id==that.id && this.name.equals(that.name)) {
			return true;
		}
		return false;
	//	return super.equals(obj);  // super. : 부모쪽의 equals 를 처리하라.
	}*/
}
