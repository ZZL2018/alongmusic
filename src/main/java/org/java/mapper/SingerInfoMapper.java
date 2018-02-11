package org.java.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.FetchType;
import org.java.pojo.SingerInfo;
import org.java.pojo.SingerType;

@Mapper
public interface SingerInfoMapper {

	/**
	 * 根据编号获取歌手信息
	 * @param singerId			歌手编号
	 * @return					歌手信息
	 */
	@Select("SELECT `singer_id`,`singer_name`,`type_id` as singer_type,`popularity` FROM singer_info WHERE singer_id=#{singer_id}")
	@Results({
		@Result(column="singer_id",property="singerId"),
		@Result(column="singer_name",property="singerName"),
		@Result(column="singer_type",property="singerType",javaType=SingerType.class,one=@One(
				select="org.java.mapper.SingerTypeMapper.getSingerTypeById",fetchType=FetchType.EAGER)),
		@Result(column="popularity",property="popularity")
	})
	SingerInfo getSingerById(@Param("singer_id") Long singer_id);
	
}