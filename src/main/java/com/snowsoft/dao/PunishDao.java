package com.snowsoft.dao;

import java.util.List;
import java.util.Map;
import com.snowsoft.bean.Punish;

public interface PunishDao {

	List<Map<String, Object>> getAllPunishList(Map<String, Object> map);

	int getCount();

	List<Map<String, Object>> getAllCarInfo();

	List<Map<String, Object>> getAllPunishInfo();

	void savePunish(Punish punish);

	Map<String, Object> getPunishInfoById(int parseInt);

	void editPunish(Punish punish);

	void sendPunish(int id);

	void deletePunishById(int parseInt);

}
