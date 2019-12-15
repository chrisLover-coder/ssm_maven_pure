package com.java.service;

import java.util.List;
import java.util.Map;

/**
 * description：
 * author：丁鹏
 * date：10:21
 */
public interface InRoomInfoService {
    List<Map<String,Object>> findInRoomInfo(String flag, String value,Integer pageNum,Integer pageSize);
}
