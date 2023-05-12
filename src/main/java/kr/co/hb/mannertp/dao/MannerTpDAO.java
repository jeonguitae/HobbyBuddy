package kr.co.hb.mannertp.dao;

import java.util.ArrayList;

import kr.co.hb.mannertp.dto.MannerTpDTO;

public interface MannerTpDAO {

	MannerTpDTO mannerChk(String id_receive, String id_send, String tp_cal);

	void mannertpDel(String id_r, String id_s);

	void mannertpM(String id_r);

	void mannertpP(String id_r);

	void mannertpUp(String id_receive);

	void mannertpUp2(String id_receive, String id_send, String string);

	void mannertpDown(String id_receive);

	void mannertpDown2(String id_receive, String id_send, String string);


}
