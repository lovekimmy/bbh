package com.example.demo.controller;


import com.alibaba.fastjson.JSONArray;

import com.example.demo.entity.BbhClass;
import com.example.demo.mapper.BbhClassMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class HelloController {

    @Resource
    private BbhClassMapper bbhClassMapper;

    @RequestMapping("/welcome")
    public String hello() {
        return "welcome";
    }

    /**
     * 班级列表
     *
     * @param pageNum
     * @param bbh
     * @param model
     * @return
     */
    @RequestMapping("/list")
    public String list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, BbhClass bbh, Model model) {
        if (bbh.getClassname() != null) {
            bbh.setClassname("%" + bbh.getClassname() + "%");
        }

        System.out.println(bbh);

        if (bbh.getTeacher()!=null&&!bbh.getTeacher().equals("")){
            bbh.setTeacher("%"+bbh.getTeacher()+"%");
        }

//        System.out.println("teacher:"+bbh.getTeacher());
//        System.out.println(bbh.getName());
        PageHelper.startPage(pageNum, 2);
        List<BbhClass> bbhClassList = bbhClassMapper.bbhlist(bbh);

        PageInfo<BbhClass> pageInfo = new PageInfo<BbhClass>(bbhClassList);
        pageInfo.setPageNum(pageNum);
        if (bbh.getClassname() != null) {
            bbh.setClassname(bbh.getClassname().replace("%", ""));
        }
        if (bbh.getTeacher()!=null){
            bbh.setTeacher(bbh.getTeacher().replace("%",""));
        }
        model.addAttribute("bbh", bbh);
        model.addAttribute("pageInfo", pageInfo);
        return "classList";
    }

    /**
     * 跳转到添加页面
     * @return
     */
    @RequestMapping("/toAdd")
    public String toAdd() {
        return "classAdd";
    }

    /**
     * 添加
     *
     * @param bbh
     * @return
     */
    @RequestMapping("/add")
    public String add(BbhClass bbh) {
        System.out.println(bbh);
        int i = 0;
        if (bbh != null) {
            i = bbhClassMapper.insert(bbh);
        }
        if (i > 0) {
            return "redirect:/list";
        }
        return "add";
    }

    /**
     * 验证班级名
     *
     * @param name
     * @return
     */
    @RequestMapping("/checkNameExists")
    @ResponseBody
    public Object checkNameExists(@RequestParam(value = "name", defaultValue = "") String name) {
        Map<String, String> resultMap = new HashMap<>();
        BbhClass bbh = bbhClassMapper.selectByname(name);
//        System.out.println(name);
//        System.out.println(bbh);
        if (bbh != null) {
            resultMap.put("result", "exists");
        } else {
            resultMap.put("result", "noExists");
        }
        return JSONArray.toJSONString(resultMap);
    }

    @RequestMapping("/toupdate")
    public String toupdate(Model model, @RequestParam(value = "id") Integer id) {
        BbhClass bbhClass = bbhClassMapper.selectByPrimaryKey(id);
        model.addAttribute("bbh", bbhClass);
        return "classUpdate";
    }

    @RequestMapping("/update")
    public String update(BbhClass bbh) {

        System.out.println(bbh);
        if (bbhClassMapper.updateByPrimaryKeySelective(bbh) > 0) {
            return "redirect:/list";
        }
        return "update";
    }

    @RequestMapping("/del")
    @ResponseBody
    public Object del(@RequestParam(value = "id")Integer id) {
        Map<String,String> resultMap=new HashMap<String,String>();
        if (bbhClassMapper.deleteByPrimaryKey(id)>0){
            resultMap.put("result","success");
        }else {
            resultMap.put("result","failure");
        }
        return JSONArray.toJSONString(resultMap);
    }



}
