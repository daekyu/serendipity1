/*
 * eGovFrame Web Messager
 * Copyright The eGovFrame Open Community (http://open.egovframe.go.kr)).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * @author 이영지(슈퍼개발자K3)
 */
package kr.co.serendipity.util;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;



import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.serendipity.model.ChatMessageDTO;
import kr.co.serendipity.model.Message;
import kr.co.serendipity.model.UsersMessageDTO;

/**
* @Class Name : ChatServerEndPoint.java
* @Description : 두 명의 사용자가 대화할 때 접속 처리및 메시지처리 기능을 하는 WebSocket 서버클래스
* @Modification Information
*
*    수정일       수정자         수정내용
*    -------        -------     -------------------
*    2014. 11. 27.    이영지
*
*/ //원래 밑의 어노테이션 밸류는 room
@ServerEndpoint(value = "/chat/{room}", encoders={MessageEncoder.class}, decoders={MessageDecoder.class}, configurator=ChatServerAppConfig.class)
public class ChatServerEndPoint {
	private static final Logger LOGGER = LoggerFactory.getLogger(ChatServerEndPoint.class);
	private Set<Session> chatroomUsers = Collections.synchronizedSet(new HashSet<Session>());

	/**
	 * Handshaking 함수
	 * @param userSession 사용자 session
	 */
	@OnOpen
	public void handleOpen(Session userSession, @PathParam("room") final String room) throws IOException, EncodeException {
		userSession.getUserProperties().put("room", room);
		chatroomUsers.add(userSession);
	}

	/**
	 * 메시지 전달 함수
	 * @param incomingMessage 들어오는 메시지
	 * @param userSession 사용자 session
	 * @param room room Id
	 * @throws IOException
	 * @throws EncodeException
	 */
	@OnMessage
	public void handleMessage(Message incomingMessage, Session userSession, @PathParam("room") final String room) throws IOException, EncodeException {

		ChatMessageDTO incomingChatMessage = (ChatMessageDTO)incomingMessage;
		ChatMessageDTO outgoingChatMessage = new ChatMessageDTO();
		
		String id = (String) userSession.getUserProperties().get("id");
		if (id == null) {
			id = incomingChatMessage.getMessage();
			if (id != null) {
				userSession.getUserProperties().put("id", id);
			}

			synchronized (chatroomUsers) {
				for (Session session : chatroomUsers){
					session.getBasicRemote().sendObject(new UsersMessageDTO(getIds()));
				}
			}
		} else {
			outgoingChatMessage.setId(id);
			outgoingChatMessage.setMessage(incomingChatMessage.getMessage());

			for (Session session : chatroomUsers){
				session.getBasicRemote().sendObject(outgoingChatMessage);
			}
		}
	}


	//누군가가 접속 끊을때
	@OnClose
	public void handleClose(Session userSession, @PathParam("room") final String room) throws IOException, EncodeException{
		chatroomUsers.remove(userSession);

		for (Session session : chatroomUsers){
			session.getBasicRemote().sendObject(new UsersMessageDTO(getIds()));
		}
	}

	/**
	 * 사용자가 접속 끊기 전 호출되는 함수
	 * @param session
	 * @param throwable
	 * @param room
	 */
	@OnError
    public void handleError(Session session, Throwable throwable, @PathParam("room") final String room) {
        // Error handling
		LOGGER.info("ChatServerEndPoint (room: "+room+") occured Exception!");
		LOGGER.info("Exception : "+throwable.getMessage());
    }

	/**
	 * 사용자 정보를 가져오는 함수
	 * @return
	 */
	private Set<String> getIds() {
		HashSet<String> returnSet = new HashSet<String>();

		for (Session session : chatroomUsers){
			if (session.getUserProperties().get("id") != null) {
				returnSet.add(session.getUserProperties().get("id").toString());
			}
		}
		return returnSet;
	}

}
