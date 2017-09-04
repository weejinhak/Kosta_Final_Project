package com.class_ic.dao;

import com.class_ic.vo.All_Alarm_DTO;

public interface AlarmDAO {
		
	    public int insertAlarm(All_Alarm_DTO dto);

		public int updateAlarmCount(String email);
		
		public int totalCount(String emailR);
		
		public int insertMessage(All_Alarm_DTO dto);
		
		public All_Alarm_DTO selectMessageNum();
		
		public void insertMessageReceive(All_Alarm_DTO dto);
		
		public void insertMessageSend(All_Alarm_DTO dto);
		
		
		
}
