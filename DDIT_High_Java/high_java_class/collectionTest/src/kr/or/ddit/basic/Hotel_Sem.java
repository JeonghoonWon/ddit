package kr.or.ddit.basic;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

public class Hotel_Sem {
	private Scanner scan;
	private HashMap<Integer, Room1> hotelMap;

	// 생성자
	public Hotel_Sem() {
		scan = new Scanner(System.in);
		hotelMap = new HashMap<>();
		for (int i = 2; i <= 4; i++) {
			String roomType = null;
			switch (i) {
			case 2:
				roomType = "싱글룸";
				break;
			case 3:
				roomType = "더블룸";
				break;
			case 4:
				roomType = "스위트룸";
				break;
			}
			for (int j = 1; j <= 9; j++) {
				int roomNum = i * 100 + j;
				hotelMap.put(roomNum, new Room1(roomNum, roomType));
			}
		}

	}

	public static void main(String[] args) {
		new Hotel_Sem().hotelStart();

	}

	public void hotelStart() {

		System.out.println("**************************************");
		System.out.println(" 호텔문을 열었습니다. 어서오십시오.");
		System.out.println("**************************************");
		while (true) {
			int choice = displayMenu();

			switch (choice) {
			case 1: // 체크 인
				break;
			case 2: // 체크 아웃
				break;
			case 3: // 객실 상태 출력
				showroom();
				break;
			case 4:
				System.out
						.println("**********************************************");
				System.out.println("       호텔문을 닫았습니다.");
				System.out
						.println("**********************************************");
				break;
			default:
				System.out.println("잘못입력했습니다.");
				System.out.println("다시 입력해주세요.");

			}
		}

	}

	// 객실 상태를 출력하는 메서드
	private void showroom() {
		System.out.println("---------------------------------------------------");
		System.out.println("\t\t현재 객실 상태\t\t");
		System.out
				.println("---------------------------------------------------");
		System.out.println("\t방 번호\t방 종류\t투숙객 이름");
		System.out
				.println("---------------------------------------------------");
		
		// Map 의 Key 값(방번호)를 List 에 넣는다.
		List<Integer> roomNumList = new ArrayList<>();
		
		// List의 값들을 정렬한다.
		Collections.sort(roomNumList);
		
		
		for(int roomNum : roomNumList) {
			Room1 r = hotelMap.get(roomNum);
			System.out.println(r.getRoomNum()+"\t");
			System.out.println(r.getRoomType() + "\t");
			System.out.println(r.getGuestName());
		}
		System.out.println();
		
	}
	


	// 메뉴 출력 및 작업번호를 반환하는 메서드
	private int displayMenu() {
		System.out.println();
		System.out.println("--------------------------------------");
		System.out.println("     어떤 업무를 하시겠습니까?");
		System.out.println("--------------------------------------");
		System.out.println("1.체크인 2.체크아웃 3.객실상태 0.종료");
		System.out.println("--------------------------------------");
		int input = scan.nextInt();
		return input;
	}
}
	class Room1 {
		private int roomNum;
		private String roomType;
		private String guestName;

		public Room1(int roomNum, String roomType) {
			super();
			this.roomNum = roomNum;
			this.roomType = roomType;
		}

		public int getRoomNum() {
			return roomNum;
		}

		public void setRoomNum(int roomNum) {
			this.roomNum = roomNum;
		}

		public String getRoomType() {
			return roomType;
		}

		public void setRoomType(String roomType) {
			this.roomType = roomType;
		}

		public String getGuestName() {
			return guestName;
		}

		public void setGuestName(String guestName) {
			this.guestName = guestName;
		}

	}

