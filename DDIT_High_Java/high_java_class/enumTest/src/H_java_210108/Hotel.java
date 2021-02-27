package H_java_210108;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;



public class Hotel {

	HashMap<Integer, Room> hotelMap;
	Scanner sc;
	Room room = new Room();

	// 생성자
	public Hotel() {
		sc = new Scanner(System.in);
		hotelMap = new HashMap<>();

	}

	public static void main(String[] args) {
		new Hotel().checkinStart();
	
	}

	private void checkinStart() {
		System.out.println("*********************************************");
		System.out.println("\t호텔문을 열었습니다. 어서오십시요.\t");
		System.out.println("*********************************************");
		
		createRoom();

		while (true) { // 메서드를 각각 만들어 호출해준다.
			int choice = displayMenu();
			switch (choice) {
			case 1: // 체크인
				checkin();
				break;
			case 2: // 체크아웃
				checkout();
				break;
			case 3: // 객실상태
				showroom();
				break;
			case 4: // 업무종료
				System.out
						.println("*********************************************");
				System.out.println("\t호텔문을 닫았습니다.\t");
				System.out
						.println("*********************************************");
				System.exit(0);
				break;
			default:
				System.out.println("번호를 잘못 입력했습니다.");
				System.out.println("다시입력해주세요.");
			}

		}

	}

	// 예약 현황 보여주는 메서드
	private void showroom() {

		System.out
				.println("---------------------------------------------------");
		System.out.println("\t\t현재 객실 상태\t\t");
		System.out
				.println("---------------------------------------------------");
		System.out.println("\t방 번호\t방 종류\t투숙객 이름");
		System.out
				.println("---------------------------------------------------");
	
		for (int i = 201; i <= 209; i++) {
			String name = hotelMap.get(i).getName();
			if (name == null) {
				name = "-";
			}
			System.out.println("\t" + hotelMap.get(i).getRoomNum() + "\t"
					+ hotelMap.get(i).getRoomtype() + "\t\t" + name);

		}
		for (int i = 301; i <= 309; i++) {
			String name = hotelMap.get(i).getName();
			if (name == null) {
				name = "-";
			}
			System.out.println("\t" + hotelMap.get(i).getRoomNum() + "\t"
					+ hotelMap.get(i).getRoomtype() + "\t\t" + name);
		}
		for (int i = 401; i <= 409; i++) {
			String name = hotelMap.get(i).getName();
			if (name == null) {
				name = "-";
			}
			System.out.println("\t" + hotelMap.get(i).getRoomNum() + "\t"
					+ hotelMap.get(i).getRoomtype() + "\t\t" + name);
		}
	}

	// 체크아웃 하는 메서드
	private void checkout() {
		System.out
				.println("---------------------------------------------------");
		System.out.println("\t\t체크아웃\t\t");
		System.out
				.println("---------------------------------------------------");
		System.out.println("체크아웃 할 방 번호를 입력하세요.");
		System.out.println("방번호 입력>>");

		int roomNum = sc.nextInt();
		
		if (!((201 <= roomNum && roomNum <= 209)
				|| (301 <= roomNum && roomNum <= 309) || (401 <= roomNum && roomNum <= 409))) {
			System.out.println("방이 존재하지 않습니다.");
			return;

		}
		
		// check-out 할 수 있는 방인지 확인
		while(true) {
			String value = hotelMap.get(roomNum).getName();
			if(value == null) {
				System.out.println("투숙객이 없습니다. Check-out이 불가능합니다.");
				
				return;
			}else {
				value = null;
				hotelMap.get(roomNum).setName(value);
				System.out.println("Check-out이 완료되었습니다. 감사합니다.");
				
				break;
			}
		
		}

	}

	/*   check-in 방 검사  다른 방법
	 * int check() {
	 * 
	 * int roomNo = sc.nextInt();
	 * 
	 * // 이미 등록된 사람인지 검사 while (true) { String value =
	 * hotelMap.get(roomNo).getName(); if (value != null) {
	 * System.out.println(roomNo + "은 이미 사용중입니다.");
	 * 
	 * System.out.println(roomNo + "사용중입니다.");
	 * System.out.println("방 번호를 입력 하세요."); roomNo = sc.nextInt();
	 * 
	 * }else{
	 * 
	 * break;
	 * 
	 * }
	 * 
	 * } return roomNo;
	 * 
	 * }
	 */

	// 체크인 하는 메서드
	private void checkin() {
		System.out.println();
		System.out
				.println("---------------------------------------------------");
		System.out.println("\t\t체크인\t\t");
		System.out
				.println("---------------------------------------------------");
		System.out.println("* 201~209 : 싱글룸");
		System.out.println("* 301~309 : 더블룸");
		System.out.println("* 401~409 : 스위트룸");
		System.out
				.println("---------------------------------------------------");
		System.out.println("방 번호 입력>>");

		int roomNum = sc.nextInt();
		System.out.println(roomNum);

		if (!((201 <= roomNum && roomNum <= 209)
				|| (301 <= roomNum && roomNum <= 309) || (401 <= roomNum && roomNum <= 409))) {
			System.out.println("방이 존재하지 않습니다.");
			return;

		}
		
		// 이미 체크인 된 방인지 검사.
		while (true) {
			String value = hotelMap.get(roomNum).getName();
			if (value != null) {
				System.out.println(roomNum + "은 이미 사용중입니다.");
				return;
			} else {

				System.out.println(" 체크인 하는 분의 성함을 입력해주세요>>");
				System.out.println("성함 입력>>");
				String checkinName = sc.next();
				hotelMap.get(roomNum).setName(checkinName);
				System.out.println("체크인이 완료 되었습니다.");
				break;
			}

		}

	}

	// 방 생성 Map에 넣는 메서드
	private void createRoom() {

		for (int i = 201; i <= 209; i++) {
			Room room = new Room(i, "싱글룸");
			hotelMap.put(i, room);
	//		hotelMap.get(i).setName(" -");
		}

		for (int i = 301; i <= 309; i++) {
			Room room = new Room(i, "더블룸");
			hotelMap.put(i, room);
		}

		for (int i = 401; i <= 409; i++) {
			Room room = new Room(i, "스위트룸");
			hotelMap.put(i, room);
		}

	}

	// 메뉴를 출력하고 번호를 입력받아 반환하는 메서드
	private int displayMenu() {
		System.out
				.println("---------------------------------------------------");
		System.out.println("어떤 업무를 하시겠습니까?");
		System.out.println("1. 체크인    2. 체크아웃    3. 객실상태    4. 업무종료");
		System.out
				.println("---------------------------------------------------");
		System.out.print("선택 >>");
		int num = sc.nextInt();

		return num;
	}

}

// 방번호(int), 방종류, 투숙객이름이 있는 class 생성
class Room {
	private int roomNum;
	private String roomtype;
	private String name;

	public Room() {
		super();
	}

	public Room(int roomNum, String roomtype) {
		super();
		this.roomNum = roomNum;
		this.roomtype = roomtype;

	}

	public int getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}

	public String getRoomtype() {
		return roomtype;
	}

	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
