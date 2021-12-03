package org.jobcho.mapper;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jobcho.domain.ChatRoomVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminPageMapperTest {
	
	@Autowired
	AdminPageMapper mapper;
	
//	@Autowired
//	ChatMapper mapper;
	
	@Test
	public void test() {
		Map<String, Object> map = new HashMap<>();
		String startfrom = "2021-11-28";
		String endfrom = "2021-12-29";
        SimpleDateFormat fDate = new SimpleDateFormat("yyyy-MM-dd"); //같은 형식으로 맞춰줌
        Date startDate = null;
        Date endDate = null;
		try {
			startDate = fDate.parse(startfrom);
			endDate = fDate.parse(endfrom);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(startfrom);
		map.put("startDate", startfrom);
		map.put("endDate", endfrom);
		map.put("team_num", 1);
//		log.info(mapper.getAdminPageUsagePeriod(map));
//		log.info(mapper.getAdminPageUsageDay(team_num));
		log.info(mapper.getAdminPageUsagePeriod(map));
	}
//	@Test
//	public void test() {
//		
//		ChatRoomVO chatRoom = new ChatRoomVO(1, "채팅방", 1, null, 1, null);
//		ChatRoomVO chatRoom2 = new ChatRoomVO(1, "채팅방2", 1, null,1, null);
//		int team_num =1;
//		int chatRoom_num =1;
//		log.info(mapper.insertChatRoom(chatRoom));
//		log.info(mapper.getListChatRoom(team_num));
//		log.info(mapper.getChatRoom(chatRoom_num));
//		log.info(mapper.updateChatRoom(chatRoom2));
//		log.info(mapper.deleteChatRoom(chatRoom_num));
		
//		log.info(mapper.insertChatMember(chatMember));
//		log.info(mapper.getListChatMember(chatRoom_num));
//		log.info(mapper.getChatMember(chatMember_num));
//		log.info(mapper.deleteChatMember(chatMember_num));
//		
//		log.info(mapper.insertChat(chat));
//		log.info(mapper.getListChat(chatRoom_num));
//		log.info(mapper.deleteChat(chat_num));
//	}
}
