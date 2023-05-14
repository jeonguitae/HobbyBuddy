package kr.co.hb.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.admin.dto.NoticeDTO;

public interface NoticeDAO {
	 
	   void noticeWrite(NoticeDTO dto);

	   void noticeFileWrite(String id, int board_num, String board_class, String ori_photo_name, String new_photo_name);

	   NoticeDTO noticeDetail(int notice_idx);

	   void noticeUpHit(int notice_idx);

	   ArrayList<NoticeDTO> noticeList();

	   int noticeUpdate(HashMap<String, String> params);

	   String noticeFindFile(String notice_idx);

	   int noticeDelete(String notice_idx);

	ArrayList<NoticeDTO> noticeSearch(HashMap<String, String> params);

	int totalCount();

	ArrayList<NoticeDTO> noticePageList(int cnt, int offset);

	ArrayList<NoticeDTO> noticeTitle(HashMap<String, String> params);

	ArrayList<NoticeDTO> noticeId(HashMap<String, String> params);
	
	void notice_ChkOn(String notice_idx);
	
	void notice_ChkOff(String notice_idx);

	int updatePDelete(int photoIdx);

	void deletePhoto(String photoIdx, String notice_idx);

	String noticeFindFile2(String photoIdx);

	ArrayList<NoticeDTO> pro_select();

	void noticeAlarm(String id_send, String id_receive, String alarm_title, String alarm_content, String alarm_class,
			String alarm_num);


	
	
	
}
