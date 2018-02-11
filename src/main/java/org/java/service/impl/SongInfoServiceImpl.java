package org.java.service.impl;

import java.util.List;

import org.java.mapper.SongInfoMapper;
import org.java.pojo.SongInfo;
import org.java.service.SongInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SongInfoServiceImpl implements SongInfoService {

	@Autowired
	private SongInfoMapper songInfoMapper;
	
	@Override
	public List<SongInfo> getSongList() {
		return songInfoMapper.getSongList();
	}

}
