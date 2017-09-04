/*
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.19
* @Author		:	노지영
*/
package com.class_ic.controller;


import java.sql.Date;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.class_ic.dao.AttendanceDAO;
import com.class_ic.dao.MemberDAO;
import com.class_ic.service.AttendanceService;
import com.class_ic.vo.AttandanceDTO;
import com.class_ic.vo.LectureDTO;
import com.class_ic.vo.MemberDTO;

/*
* @Class: SchedulerController
* @Date: 2017.06. 19
* @Author: 노지영
* @Desc: 스케줄링이 구동되어 아침마다 필요한 테이블을 자동으로 insert 해주는 컨트롤러.
*/

@Controller
public class SchedulerController {

	@Autowired
	private SqlSession sqlsession;
	

	@Autowired
	private AttendanceService attendanceservice;
	
	// 0 정상 출근 , 1 지각
	private int compareLate=1;
	// 0 정상 퇴근 , 2 조퇴
	private int compareEaryLeave=2;
	// 3 결석


/*
 *	@description : 스케줄링 어노테이션을 사용하여 cron 으로 테이블 생성시점을 정의해줌.	
 * <스케줄 어노테이션 예시>
 * @Scheduled(cron="0 42 17 * * *")
 * "초 분 시 일 월 요일"
 * 일/월/요일에 대해서는 '*' 설정을 잡아 주었으니 "매일 17시 42분이 되면 해당 스케쥴러를 호출하라 라는 뜻 이다.
 * @Scheduled(fixedRate=50000) -> 5초마다 실행 해주기
 * */
	
	@Scheduled(cron="0 42 17 * * *")
	public void insert() {
		System.out.println("아침입니다 출석됭 테이블을 insert 하겠습니다.");
		attendanceservice.insertAttendance();
		System.out.println("attandence 테이블 isnert 완료 되었습니다.");
		
	}
	


	@Scheduled(cron="0 42 17 * * *")
	public void updateState() {

		AttendanceDAO attendanceDao=sqlsession.getMapper(AttendanceDAO.class);
		System.out.println("저녁입니다 출석됭 테이블의 결석여부를 판단하겠습니다.");

		ArrayList<AttandanceDTO> todaylist=attendanceDao.todayAttendaceData();
		System.out.println(todaylist.size());
		LectureDTO classdto= new LectureDTO();
		

		//내가 찍은 입실 시간 인덱스 1이 시간 2가 분이다.
		String[] inclassArr;
		//내가 찍은 퇴실 시간 인덱스 1이 시간 2가 분이다.
		String[] outclassArr;
		//지정된 입실 시간 인덱스 0이 시간 1이 분이다.
		String[] opentimeArr;
		//지정된 퇴실 시간 인덱스 0이 시간 1이 분이다.
		String[] closetimeArr;
	
	
		for(AttandanceDTO list:todaylist){
			String attendState="";
			classdto=attendanceDao.selectStartEndTime(list.getClassCode());
			System.out.println(classdto.getClassOpenTime());
			System.out.println(classdto.getClassCloseTime());
			System.out.println(list.getInClass());
			System.out.println(list.getOutClass());
			
			
			
			//둘다 널이 아니면(입퇴실 둘다 찍은 사람만 출적 판단함.
			if((list.getInClass()!=null)&&(list.getOutClass()!=null)){
				
				inclassArr=list.getInClass().split(":");
				outclassArr=list.getOutClass().split(":");
				opentimeArr=classdto.getClassOpenTime().split(":");
				closetimeArr=classdto.getClassCloseTime().split(":");
				
				compareLate(inclassArr[1],inclassArr[2],opentimeArr[0],opentimeArr[1]);
				compareEaryLeave(outclassArr[1],outclassArr[2],closetimeArr[0],closetimeArr[1]);
				System.out.println("구분:"+compareLate+","+compareEaryLeave);
				System.out.println("구분2:"+(compareLate+compareEaryLeave));
				System.out.println();
		
				System.out.println(list.getInClass()+","+list.getOutClass());
				
				
			}
			

			switch ((compareLate+compareEaryLeave)) {
			//정상 출결
			case 0:
				attendState="출석";
				break;
			//지각
			case 1:
				attendState="지각";
				break;
			//조퇴
			case 2:
				attendState="조퇴";
				break;
			//결석
			case 3:
				attendState="결석";
				break;
			
			default:
				break;
			}
			
			System.out.println(list.getEmail());
			System.out.println(attendState);
			String email=list.getEmail().trim();
			System.out.println(attendanceDao.updateAttendaceState(attendState,email));
		}

		
		
	}
	
	
	public void compareLate(String inclasshour,String inclassMinute,String opentimehour,String opentimeminute){
		// 0 정상 출근 , 1 지각
		//private int compareLate=0;
		// 0 정상 퇴근 , 2 조퇴
		//private int compareEaryLeave=0;
		// 3 결석

		//inclasshour 내가 찍은 출석시간 hour 부분
		//inclassMinute 내가 찍은 출석시간 minute 부분
		//opentimehour  원래 출석 시간 hour 부분
		//opentimeminute 원래 출석 시간 mimute 부분
		if(Integer.parseInt(inclasshour)>Integer.parseInt(opentimehour)){
			
			compareLate=1;
			
		}
		else if(Integer.parseInt(inclasshour)==Integer.parseInt(opentimehour)){
			if(Integer.parseInt(inclassMinute)>Integer.parseInt(opentimeminute)){
				compareLate=1;
				
			}else{
				compareLate=0;
			}
			
		}else{
			compareLate=0;
		}
	}

	public void compareEaryLeave(String outclasshour,String outclassMinute,String closetimehour,String closetimeminute){
		//String outclasshour,String outclassMinute,String closetimehour,String closetimeminute
		// 0 정상 출근 , 1 지각
		//private int compareLate=0;
		// 0 정상 퇴근 , 2 조퇴
		//private int compareEaryLeave=0;
		// 3 결석
		if(Integer.parseInt(outclasshour)<Integer.parseInt(closetimehour)){
			
			compareEaryLeave=2;
			
		}
		else if(Integer.parseInt(outclasshour)==Integer.parseInt(closetimehour)){
			if(Integer.parseInt(outclassMinute)<Integer.parseInt(closetimeminute)){
				compareEaryLeave=2;
		
			}else{
				compareEaryLeave=0;
			}
			
		}else{
			compareEaryLeave=0;
		}
		//outclasshour 내가 찍은 퇴실시간 hour 부분
		//outclassMinute 내가 찍은 퇴실시간 minute 부분
		//closetimehour  원래 퇴실 시간 hour 부분
		//closetimeminute 원래 퇴실 시간 mimute 부분
	}

	}
