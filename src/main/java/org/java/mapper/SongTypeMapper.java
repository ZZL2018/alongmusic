package org.java.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.java.pojo.SongType;

@Mapper
public interface SongTypeMapper {
	
	@Select("SELECT `type_id` as song_type,`type_name` FROM song_type WHERE type_id=#{song_type}")
	@Results({
		@Result(column="song_type",property="typeId"),
		@Result(column="type_name",property="typeName")
	})
	SongType getSongTypeById(@Param("song_type") Long song_type);
	
}