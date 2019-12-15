package com.java.controller.admin;

import com.github.pagehelper.PageInfo;
import com.java.service.InRoomInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * description：
 * author：丁鹏
 * date：10:13
 */
@Controller
@RequestMapping("/inroominfo")
public class InRoomInfoController {
    @Autowired
    private InRoomInfoService inRoomInfoService;

    /**
     * 跳转到入住信息列表页面，同时带数据过去
     * @return
     */
    @RequestMapping("/toInRoomInfo.do")
    public String toInRoomInfo(@RequestParam(defaultValue = "0") String flag,
                               String value,
                               @RequestParam(defaultValue = "1") Integer pageNum,
                               @RequestParam(defaultValue = "5") Integer pageSize,
                               Model model){
        //调用业务层
        List<Map<String, Object>> inRoomInfoList = inRoomInfoService.findInRoomInfo(flag, value, pageNum, pageSize);
        //跳转页面
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(inRoomInfoList);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("flag",flag);
        model.addAttribute("value",value);
        return "admin/bill/inroominfo.jsp";
    }

}
