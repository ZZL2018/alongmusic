package org.java.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.FetchType;
import org.java.pojo.SingerInfo;
import org.java.pojo.SongInfo;
import org.java.pojo.SongType;

@Mapper
public interface SongInfoMapper {

	/**
	 * 动态查询歌曲信息
	 * @return 信息列表
	 */
	@Select("SELECT `song_id`,`song_name`,`type_id` as song_type,`singer_id`,`down_count`,`collect_count`,`upload_role` FROM song_info")
	@Results({
		@Result(column="song_id",property="songId"),
		@Result(column="song_name",property="songName"),
		@Result(column="song_type",property="songType",javaType=SongType.class,one=@One(
				select="org.java.mapper.SongTypeMapper.getSongTypeById",fetchType=FetchType.EAGER)),
		@Result(column="singer_id",property="singerInfo",javaType=SingerInfo.class,one=@One(
				select="org.java.mapper.SingerInfoMapper.getSingerById",fetchType=FetchType.EAGER)),
		@Result(column="down_count",property="downCount"),
		@Result(column="collect_count",property="collectCount"),
		@Result(column="upload_role",property="uploadRole")
	})
	List<SongInfo> getSongList();

}