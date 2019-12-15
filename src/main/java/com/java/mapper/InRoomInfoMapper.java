package com.java.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * description：
 * author：丁鹏
 * date：10:13
 */
public interface InRoomInfoMapper {

    /**
     * 根据条件查询入住信息
     * @return
     */
    List<Map<String,Object>> selectInRoomInfo(@Param("flag") String flag,@Param("value") String value);

}
