package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class StudentTest2 {
   
/*
    문제) 학번, 이름, 국어점수, 영어점수, 수학점수, 총점, 등수를 멤버로 갖는 Student클래스를 작성한다.
         이 클래스의 생성자에서는 학번, 이름, 국어점수, 영어점수, 수학점수만 매개변수로 받아서 초기화 처리한다.
         
         이 Student 객체는 List에 저장하여 관리한다. ??
         
         List에 저장된 데이터들을 학번의 오름차순으로 정렬할 수 있는 내부 정렬기준을 구현하고, 
         
         총점의 역순으로 정렬하는데 총점이 같으면 이름의 오름차순으로 정렬되는 외부 정렬기준 클래스를 
         작성하여 정렬된 결과를 출력하시오.
         
         (등수는 List에 전체 데이터가 추가된 후에 저장되도록 한다.)
*/   
   public void setRanking(List<Student2> stdList){
      
      for(int i =0; i < stdList.size(); i++) {  // 기준데이터를 구하기 위한 반복문
         int rank = 1; // 처음에는 1등으로 설정해 놓고 시작한다.
         for(int j=0; j<stdList.size(); j++){ // 비교 대상을 나타내는 반복문
            // 기준보다 큰 값을 만나면 rank값을 증가시킨다.
            if(stdList.get(i).getSum() < stdList.get(j).getSum()){
               rank++;
            }
         } // for - j
         // 구해진 등수를 Student객체의 rank변수에 저장한다.
         stdList.get(i).setRank(rank);
      }   // for - i
      
      for(Student2 std1 : stdList){
         int rank = 1;
         
         for(Student2 std2 : stdList) {
            if(std1.getSum() < std2.getSum()) {
               rank++;
            }
         }
         std1.setRank(rank);
      }
      
      
      
   }

   public static void main(String[] args) {
      
      StudentTest2 t = new StudentTest2();

      List<Student2> stdList = new ArrayList();
      
      stdList.add(new Student2(5,"홍길동",42,56,77));
      stdList.add(new Student2(2,"홍춘삼",61,97,17));
      stdList.add(new Student2(1,"이순신",75,56,88));
      stdList.add(new Student2(4,"성춘향",42,46,37));
      stdList.add(new Student2(3,"일지매",52,56,37));
      
      // 정렬하는 메서드 호출
      t.setRanking(stdList);
      
      System.out.println("정렬전...");
      for(Student2 std : stdList){
         System.out.println(std);
      }
      
      System.out.println();
      System.out.println("---------------------------------------------------------------------------------------------------");
      System.out.println();
      
      // 학번의 오름차순으로 정렬하기
      Collections.sort(stdList);
      
      System.out.println("정렬후...");
      for(Student2 std : stdList){
         System.out.println(std);
      }      
      
      System.out.println();
      System.out.println("---------------------------------------------------------------------------------------------------");
      System.out.println();

      // 총점의 역순으로 정렬하기
      Collections.sort(stdList, new SortByTotal());
      
      System.out.println("총점의 역순으로 정렬후...");
      for(Student2 std : stdList){
         System.out.println(std);
      }      
      

   }
}

class Student2 implements Comparable<Student2>{
   private int num;
   private String name;
   private int kor;
   private int eng;
   private int mat;
   private int sum;
   private int rank;
   
   // 생성자
   public Student2(int num, String name, int kor, int eng, int mat) {
      super();
      this.num = num;
      this.name = name;
      this.kor = kor;
      this.eng = eng;
      this.mat = mat;
      this.sum = kor + eng + mat;
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

   public int getKor() {
      return kor;
   }

   public void setKor(int kor) {
      this.kor = kor;
   }

   public int getEng() {
      return eng;
   }

   public void setEng(int eng) {
      this.eng = eng;
   }

   public int getMat() {
      return mat;
   }

   public void setMat(int mat) {
      this.mat = mat;
   }

   public int getSum() {
      return sum;
   }

   public void setSum(int sum) {
      this.sum = sum;
   }

   public int getRank() {
      return rank;
   }

   public void setRank(int rank) {
      this.rank = rank;
   }

   @Override
   public String toString() {
      return "Student [num=" + num + ", name=" + name + ", kor=" + kor
            + ", eng=" + eng + ", mat=" + mat + ", sum=" + sum + ", rank="
            + rank + "]";
   }

   // 학번의 오름차순 정렬
   @Override
   public int compareTo(Student2 o) {
   
      return Integer.compare(this.num, o.getNum());
   }
   
   
   
   
   
}



/*
     총점의 역순으로 정렬하는데 총점이 같으면 이름의 오름차순으로 정렬되는 외부 정렬기준 클래스를 
     작성하여 정렬된 결과를 출력하시오.
 */

class SortByTotal implements Comparator<Student2> {

   @Override
   public int compare(Student2 std1, Student2 std2) {

      if(std1.getSum() == std2.getSum()) {
         return std1.getName().compareTo(std2.getName());
      } else {
         return Integer.compare(std1.getSum(), std2.getSum()) * -1;
      }
      
   }
   
}
















