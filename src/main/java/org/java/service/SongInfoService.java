package org.java.service;

import java.util.List;

import org.java.pojo.SongInfo;

public interface SongInfoService {
	
	/**
	 * 动态查询歌曲信息
	 * @return 信息列表
	 */
	List<SongInfo> getSongList();

}
