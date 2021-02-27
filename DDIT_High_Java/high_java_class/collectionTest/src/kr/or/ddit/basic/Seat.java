package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.List;

public class Seat {

   public static String[] students = { "김도윤", "김동익", "김보미", "김보현", "김지훈",
         "김혜정", "문선준", "박세현", "박초원", "배수진", "송수미", "양지수", "오세일", "원정훈",
         "윤지혜", "이진수", "이현기", "임태준", "장병길", "전형섭", "정이삭", "정지수", "진예은",
         "진유리", "최희수" };

   public static void main(String[] args) {

      String[] seats = new String[25];
      int check = 0;
      do {
         seats = new String[25];
         check = 0;
         seats[0] = seat("김도윤");
         seats[1] = seat("이현기");
         seats[2] = seat("김도윤", "이현기", "박초원");
//         seats[3] = seat();
//         seats[4] = seat("");
//         seats[5] = seat("");
//         seats[6] = seat("");
//         seats[7] = seat("");
//         seats[8] = seat("");
//         seats[9] = seat("");
//         seats[10] = seat("");
//         seats[11] = seat("");
//         seats[12] = seat("");
//         seats[13] = seat("");
//         seats[14] = seat("");
//         seats[15] = seat("");
//         seats[16] = seat("");
//         seats[17] = seat("");
//         seats[18] = seat("");
//         seats[19] = seat("");
//         seats[20] = seat("");
//         seats[21] = seat("");
//         seats[22] = seat("");
//         seats[23] = seat("");
         seats[24] = seat("김도윤", "박초원", "최희수");

         for (int i = 0; i < seats.length - 1; i++) {
            for (int j = i + 1; j < seats.length; j++) {
               if (seats[i] == null) {
               } else if (seats[i].equals(seats[j])) {
                  check++;
               }
            }
         }

      } while (check != 0);
      try {
         System.out.println("최초 당첨자");
         for (int i = 0; i < seats.length; i++) {
            System.out.println(i + 1 + seats[i]);
         }
      } catch (NullPointerException e) {
      }
      List<String> names = new ArrayList<>();
      for (int i = 0; i < seats.length - 1; i++) {
         for (int j = i + 1; j < seats.length; j++) {
            if (!students[i].equals(seats[j])
                  && !names.contains(students[i])) {
               names.add(students[i]);
            }
         }
      }
      System.out.println(names); // 미배정 학생
      for (int i = 0; i < names.size(); i++) {
         if (seats[i] == null) {
            seats[i] = seat(names);
         }
      }

      for (int i = 0; i < seats.length; i++) {
         System.out.println(i + 1 + seats[i]);
      }

   }

   public static String seat(List str) {
      List<String> vol = new ArrayList<>();
      for (int i = 0; i < str.size(); i++) {
         vol.add(str.get(i).toString());
      }
      String m = vol.get((int) (Math.random() * vol.size()));
      return m;
   }

   public static String seat(String str1) {
      List<String> vol = new ArrayList<>();
      vol.add(str1);
      String m = vol.get((int) (Math.random() * vol.size()));
      return m;
   }

   public static String seat(String str1, String str2) {
      List<String> vol = new ArrayList<>();
      vol.add(str1);
      vol.add(str2);
      String m = vol.get((int) (Math.random() * vol.size()));
      return m;
   }

   public static String seat(String str1, String str2, String str3) {
      List<String> vol = new ArrayList<>();
      vol.add(str1);
      vol.add(str2);
      vol.add(str3);
      String m = vol.get((int) (Math.random() * vol.size()));
      return m;
   }

   public static String seat(String str1, String str2, String str3, String str4) {
      List<String> vol = new ArrayList<>();
      vol.add(str1);
      vol.add(str2);
      vol.add(str3);
      vol.add(str4);
      String m = vol.get((int) (Math.random() * vol.size()));
      return m;
   }

   public static String seat(String str1, String str2, String str3,
         String str4, String str5) {
      List<String> vol = new ArrayList<>();
      vol.add(str1);
      vol.add(str2);
      vol.add(str3);
      vol.add(str4);
      vol.add(str5);
      String m = vol.get((int) (Math.random() * vol.size()));
      return m;
   }

   public static String seat(String str1, String str2, String str3,
         String str4, String str5, String str6) {
      List<String> vol = new ArrayList<>();
      vol.add(str1);
      vol.add(str2);
      vol.add(str3);
      vol.add(str4);
      vol.add(str5);
      vol.add(str6);
      String m = vol.get((int) (Math.random() * vol.size()));
      return m;
   }

   public static String seat(String str1, String str2, String str3,
         String str4, String str5, String str6, String str7) {
      List<String> vol = new ArrayList<>();
      vol.add(str1);
      vol.add(str2);
      vol.add(str3);
      vol.add(str4);
      vol.add(str5);
      vol.add(str6);
      vol.add(str7);
      String m = vol.get((int) (Math.random() * vol.size()));
      return m;
   }

   public static String seat(String str1, String str2, String str3,
         String str4, String str5, String str6, String str7, String str8) {
      List<String> vol = new ArrayList<>();
      vol.add(str1);
      vol.add(str2);
      vol.add(str3);
      vol.add(str4);
      vol.add(str5);
      vol.add(str6);
      vol.add(str7);
      vol.add(str8);
      String m = vol.get((int) (Math.random() * vol.size()));
      return m;
   }

}