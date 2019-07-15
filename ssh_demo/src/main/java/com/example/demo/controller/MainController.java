package com.example.demo.controller;

import com.example.demo.entity.*;
import com.example.demo.mapper.*;
import com.example.demo.util.QueryCondition;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
public class MainController {

    @Resource
    private UserMapper userMapper;

    @Resource
    private UserClassMapper userClassMapper;

    @Resource
    private UnitPriceMapper unitPriceMapper;

    @Resource
    private RoomMapper roomMapper;

    @Resource
    private RoomMoneyMapper roomMoneyMapper;

    @RequestMapping
    public String hello() {
        return "hello";
    }

    @RequestMapping("jiaofei")
    public String jiaofei() {
        return "student/jiaofei";
    }


    @RequestMapping("toFindStudent")
    public String toFindStudent(HttpServletRequest request,
                                Model model
    ) {

        //模拟一个用户登录，存入session
        User user = userMapper.selectByPrimaryKey(6);
        request.getSession().setAttribute("user", user);
        List<User> list = userMapper.findStudentById(user.getId(),2);

        for (User u:
             list) {
            System.out.println(u);
        }

        model.addAttribute("list", list);

        return "student/find-student";
    }

    @RequestMapping("toFindStudentList")
    public String toFindStudentList(Model model){


        //模拟一个用户登录，存入session
//        User user = userMapper.selectByPrimaryKey(1);
//        request.getSession().setAttribute("user", user);
        List<User> list = userMapper.findStudentById(1,1);
        for (User u:
                list) {
            System.out.println(u);
        }

        model.addAttribute("list", list);


        return "student/find-student-list";
    }



    @RequestMapping("toUniPrice")
    public String unitPrice(Model model) {
        UnitPrice u = unitPriceMapper.find();
        System.out.println(u);
        model.addAttribute("price", u);
        return "system/unitPrice";
    }



    @ResponseBody
    @RequestMapping("upUnitPrice")
    public String upUnitPrice(UnitPrice unitPrice) {
        String s = null;
        if (unitPriceMapper.up(unitPrice) > 0) {
            s = "修改成功！";
        } else {
            s = "修改失败！";
        }
        return s;
    }

    @RequestMapping("toReading")
    public String toReading(Model model) {

        List <Room> list = roomMapper.listRoom();

        model.addAttribute("room", list);
        return "student/reading";
    }


    @ResponseBody
    @RequestMapping("reading")
    public String reading(RoomMoney roomMoney,
                          Model model) throws ParseException {

        UnitPrice unitPrice = unitPriceMapper.find();
        //取出水费单价和电费单价
        double waterUnit = unitPrice.getWaterUnit();
        double electricUnit = unitPrice.getElectricUnit();

        //取出登记的用水量，和用电度数
        double waterNum = roomMoney.getWaterNum();
        double electricNum = roomMoney.getElectricNum();

        //计算出该宿舍的当月总费用
        double price = waterNum * waterUnit + electricNum * electricUnit;

        roomMoney.setPrice(price);

        String readingDay = null;

        //获取当前年月日
        Date now = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        now = sdf.parse(sdf.format(now));


        //日期赋值到roomMoney对象中
        roomMoney.setReadingDay(now);
        System.out.println(roomMoney);

        if (roomMoneyMapper.addRoomMoney(roomMoney) > 0) {
            return "登记成功!";
        } else {
            return "登记失败！";
        }
    }

    @RequestMapping("toFindElse")
    public String toFindElse(Model model,
                             QueryCondition condition,
                             @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {

        System.out.println(condition);
        PageHelper.startPage(pageNum, 4);
        List <User> list = userMapper.findByCondition(condition);

        PageInfo <User> pageInfo = new PageInfo <User>(list);
        pageInfo.setPageNum(pageNum);
        model.addAttribute("pageInfo", pageInfo);

        model.addAttribute("classlist", userClassMapper.classList());
        model.addAttribute("roomlist", roomMapper.listRoom());
        model.addAttribute("condition", condition);


        return "student/find-else";
    }




}
