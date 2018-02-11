package org.java.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.java.pojo.SingerType;

@Mapper
public interface SingerTypeMapper {
	
	@Select("SELECT `type_id` as singer_type,`type_name` FROM singer_type WHERE type_id=#{singer_type}")
	@Results({
		@Result(column="singer_type",property="typeId"),
		@Result(column="type_name",property="typeName")
	})
	SingerType getSingerTypeById(@Param("singer_type") Long singer_type);
	
}