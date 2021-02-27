package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class StudentTest {

   public static void main(String[] args) {
      
       /* 문제 1)
       * 학번, 이름, 국어점수, 영어점수, 수학점수, 총점, 등수를 멤버로 갖는 Student 클래스를 작성한다.
       * 이 클래스의 생성자에서는 학번, 이름, 국,영,수 값만 매개변수 로 받아서 초기화 처리한다.
       * 
       *  이 Student 객체는 List에 저장하여 관리한다.
       *  
       *  List에 저장된 데이터들을 학번의 오름차순으로 정렬할 수 있는 내부 정렬 기준을 구현하고 총점의 역순으로 정렬하는데
       *  총점이 같으면 이름의 오름차순으로 정렬되는 외부 정렬 기준 클래스를 작성하여 정렬된 결과를 출력하시오.
       *  
       *  (등수는 List에 전체 데이터가 추가된 후에 저장되도록 한다.) - StudentTest 클래스에서 작성
       
      */
      ArrayList<Student> list = new ArrayList<>();
      
  	
		list.add(new Student(12,"박보검",100,99,90));
		list.add(new Student(28,"류준열",70,55,12));
		list.add(new Student(32,"공유",80,100,40));
		list.add(new Student(9,"이기우",55,55,55));
		list.add(new Student(77,"공유",70,55,12));

//      sum 구하기      
      for(int i=0; i<list.size(); i++) {
         list.get(i).sum = list.get(i).k + list.get(i).e + list.get(i).m;
      }
      
//      등수구하기
      for(int i=0; i<list.size(); i++) {
         //rank 초기화
         list.get(i).rank = 1;
      }
      
      for(int i=0; i<list.size(); i++) {
         for(int j=0; j<list.size(); j++) {
            if(list.get(i).sum > list.get(j).sum) {
               list.get(j).rank += 1;
            }
         }
      }      
      
//      출력란
      System.out.println("정렬 전>");
      System.out.println("-----------------------------------------------------");
      System.out.println("학번\t이름\t국어\t영어\t수학\t총점\t등수");
      System.out.println("-----------------------------------------------------");
      for(Student student : list) {         
         System.out.print(student.getNum() + "\t" + student.getName() + "\t" + student.getK() + "\t" + student.getE() + "\t" + student.getM()
               + "\t" + student.getSum() + "\t" + student.getRank());
         System.out.println();
      }
      System.out.println("-----------------------------------------------------");
      
      // 학번 오름차순
      System.out.println("오름차순 정렬 >");
      System.out.println("-----------------------------------------------------");
      System.out.println("학번\t이름\t국어\t영어\t수학\t총점\t등수");
      System.out.println("-----------------------------------------------------");
      Collections.sort(list);
      for(Student student : list) {         
         System.out.print(student.getNum() + "\t" + student.getName() + "\t" + student.getK() + "\t" + student.getE() + "\t" + student.getM()
               + "\t" + student.getSum() + "\t" + student.getRank());
         System.out.println();
      }
      System.out.println("-----------------------------------------------------");
      
      // 총점 내림차순 + 총점이 같을 경우 이름순(오름차순)
      System.out.println("총점 내림차순 정렬>");
      System.out.println("-----------------------------------------------------");
      System.out.println("학번\t이름\t국어\t영어\t수학\t총점\t등수");
      System.out.println("-----------------------------------------------------");
      Collections.sort(list, new SortNumDesc1());
      for(Student student : list) {         
         System.out.print(student.getNum() + "\t" + student.getName() + "\t" + student.getK() + "\t" + student.getE() + "\t" + student.getM()
               + "\t" + student.getSum() + "\t" + student.getRank());
         System.out.println();
      }
      System.out.println("-----------------------------------------------------");
      
   }
}

class Student implements Comparable<Student>{
   int num;
   String name;
   int k;
   int e;
   int m;
   int sum;
   int rank;
   
   public Student(int num, String name, int k, int e, int m) {
      super();
      this.num = num;
      this.name = name;
      this.k = k;
      this.e = e;
      this.m = m;
   }

   
   public int getNum() {
      return num;
   }

   public void setNum(int num) {
      this.num = num;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public int getK() {
      return k;
   }
   public void setK(int k) {
      this.k = k;
   }

   public int getE() {
      return e;
   }
   public void setE(int e) {
      this.e = e;
   }

   public int getM() {
      return m;
   }
   public void setM(int m) {
      this.m = m;
   }
   
   public int getSum() {
      return sum;
   }
   public int getRank() {
      return rank;
   }

   @Override
   public String toString() {
      return "Student [num=" + num + ", name=" + name + ", k=" + k + ", e="
            + e + ", m=" + m + ", sum=" + sum + ", rank=" + rank + "]";
   }

   //   학번 내부 정렬
   @Override
   public int compareTo(Student student) {
      return Integer.compare(this.num, student.getNum());
   }
   
}

// 총점 외부 정렬 클래스 생성
class SortNumDesc1 implements Comparator<Student> {
   @Override
   public int compare(Student st1, Student st2) {
      if(st1.getSum() > st2.getSum()) {
         return -1;
      } else if(st1.getSum() < st2.getSum()) {
         return 1;
      } else {
         return st1.getName().compareTo(st2.getName());
      }
   }
}