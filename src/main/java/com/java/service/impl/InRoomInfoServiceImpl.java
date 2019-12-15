package com.java.service.impl;

import com.github.pagehelper.PageHelper;
import com.java.mapper.InRoomInfoMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * description：
 * author：丁鹏
 * date：10:19
 */
@Service
public class InRoomInfoServiceImpl implements com.java.service.InRoomInfoService {

    @Autowired
    private InRoomInfoMapper inRoomInfoMapper;

    /**
     * 根据条件查询入住信息
     * @return
     */
    @Override
    public List<Map<String,Object>> findInRoomInfo(String flag, String value,Integer pageNum,Integer pageSize){
        PageHelper.startPage(pageNum,pageSize);
        return inRoomInfoMapper.selectInRoomInfo(flag,value);
    }

}
