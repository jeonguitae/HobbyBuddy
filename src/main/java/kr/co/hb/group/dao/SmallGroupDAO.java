package kr.co.hb.group.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.hb.group.dto.SmallGroupDTO;

public interface SmallGroupDAO {

	int sgwrite(HashMap<String, String> params);

	ArrayList<SmallGroupDTO> sglist(int gidx);

	int sgjoin(int sidx, String id);

	ArrayList<SmallGroupDTO> sgjlist(int sidx);

	int memchk(String id, int sidx);

	int maxmemchk(int sidx);

	int maxmem(int sidx);

}
