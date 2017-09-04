/*
* @FileName		:	WebSocketHandler.java
* 
* @Project		:	CLASS-IC
* @Date		    :	2017.06.25
* @Author		:	위진학
*/
package com.class_ic.websocket;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;

import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocketHandler extends TextWebSocketHandler {

	private Map<Object, WebSocketSession> users = new ConcurrentHashMap();
	private Map<String, String> ids = new ConcurrentHashMap();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		String userid = (String) session.getAttributes().get("email");
		users.put(userid, session);
		ids.put(session.getId(), userid);
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove("parammsg");
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		String msg = message.getPayload();

		for (WebSocketSession s : users.values()) {
			
			if (ids.get(s.getId()).equals(msg)) {

				s.sendMessage(message);

			} else {

			}
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log((String) session.getAttributes().get("userId") + " 에러 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}

}
