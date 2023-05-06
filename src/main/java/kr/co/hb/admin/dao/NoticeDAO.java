package kr.co.hb.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.admin.dto.NoticeDTO;

public interface NoticeDAO {
	 
	   void noticeWrite(NoticeDTO dto);

	   void noticeFileWrite(int idx, String oriFileName, String newFileName);

	   NoticeDTO noticeDetail(String notice_idx);

	   void noticeUpHit(String notice_idx);

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

	int updatePDelete(int photo_idx);

	void deletePhoto(String photo_idx, String notice_idx);

	String noticeFindFile2(String photo_idx);

	
	
	
}
