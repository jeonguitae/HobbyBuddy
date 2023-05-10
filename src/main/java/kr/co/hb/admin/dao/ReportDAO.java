package kr.co.hb.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.admin.dto.ReportDTO;

public interface ReportDAO {

	int totalCount();

	ArrayList<ReportDTO> reportPageList(int cnt, int offset);

	ReportDTO reportDetail(String rept_no);

	void commentWrite(HashMap<String, String> params);

	ReportDTO reportCommentDetail(int rept_no);

}
