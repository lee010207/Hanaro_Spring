package com.hana.controller;

// !! ajax를 통해 호출되면 controller 대신 restcontroller 사용
import com.hana.app.data.dto.Chart2Dto;
import com.hana.app.data.dto.CustDto;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
public class AjaxImplController {
    @RequestMapping("/getservertime")
    public Object getservertime(){
        Date date = new Date();
        return date;
    }

    @RequestMapping("/checkId")
    public String checkId(@RequestParam("id") String id){
        // http통신은 데이터이가 다 문자열로 주고받음
        String res = "1";
        if(id.equals("qqq")){
            res = "0";
        }
        return res;
    }

    @RequestMapping("/getdata")
    public Object getdata(){
        List<CustDto> list = new ArrayList<>();
        list.add(new CustDto("id01","pwd01","james"));
        list.add(new CustDto("id02","pwd02","ames"));
        list.add(new CustDto("id03","pwd03","mes"));
        list.add(new CustDto("id04","pwd04","es"));
        list.add(new CustDto("id05","pwd05","s"));
        list.add(new CustDto("id06","pwd06","semaj"));
        return list;
    }
    @RequestMapping("/chart2")
    public Object chart2(){
        JSONArray ja = new JSONArray();

        List<Chart2Dto> list = new ArrayList<>();
        // [{"name":"S001","m1":10,....},{},{},{}]
        list.add(new Chart2Dto("S001",10,20,30,20,10,15));
        list.add(new Chart2Dto("S002",13,30,60,10,10,25));
        list.add(new Chart2Dto("S003",11,10,70,80,15,35));
        list.add(new Chart2Dto("S004",18,20,20,90,22,45));

        list.stream().forEach(c->{
            JSONObject jo = new JSONObject();
            jo.put("name",c.getName());
            jo.put("data",c.getM());
            ja.add(jo);
        });

//        for(Chart2Dto c:list){
//
//        }
        return ja;
    }
    @RequestMapping("/chart4")
    public Object chart4(@RequestParam("gender") String gender){
        JSONArray ja = new JSONArray();

        List<Chart2Dto> list = new ArrayList<>();
        // [{"name":"S001","m1":10,....},{},{},{}]
        list.add(new Chart2Dto("f",30,10,10,10,20,20));
        list.add(new Chart2Dto("m",40,10,10,10,10,20));

        list.stream().filter(c-> c.getName().equals(gender)).forEach(c->{
            c.getM().stream().forEach(n->{
                JSONArray ja2 = new JSONArray();
                // [["",20],[],[],[]]
                ja2.add("OTT");
                ja2.add(n);
                ja.add(ja2);
            });
        });
        //{"data:":[], "title":"f"}
        JSONObject jo = new JSONObject();
        jo.put("data",ja);
        jo.put("title",gender);
        return jo;
    }
}