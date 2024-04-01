package com.hana.controller;

import com.hana.app.data.dto.CustDto;
import com.hana.app.data.dto.shopDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/geo")
public class GeoController {
    String dir= "geo/";
    @RequestMapping("/")
    public String main(Model model){
        model.addAttribute("left", dir+"left");
        model.addAttribute("center",dir+"center");
        return "index";
    }
    @RequestMapping("/geo1")
    public String geo1(Model model){
        model.addAttribute("left", dir+"left");
        model.addAttribute("center",dir+"geo1");
        return "index";
    }
    @RequestMapping("/geo2")
    public String geo2(Model model){
        model.addAttribute("left", dir+"left");
        model.addAttribute("center",dir+"geo2");
        return "index";
    }
    @RequestMapping("/geo3")
    public String geo3(Model model){
        model.addAttribute("left", dir+"left");
        model.addAttribute("center",dir+"geo3");
        return "index";
    }
    @RequestMapping("/shopdetail")
    public String shopdetail(Model model,
                             @RequestParam("shopid") int shopid){
        model.addAttribute("shopid", shopid);
        model.addAttribute("left",dir+"left");
        model.addAttribute("center",dir+"detail");
        return "index";

    }
    @RequestMapping("/getdata")
    public @ResponseBody Object getdata(){
        List<shopDto> list = new ArrayList<>();
        list.add(new shopDto( 100, "순대국", "a.jpg", 37.5547611, 127.0654625));
        list.add(new shopDto( 101, "파스타", "b.jpg", 37.5947611, 127.0554625));
        list.add(new shopDto( 102, "햄버거", "c.jpg", 37.5547511, 127.0654635));

        return list;
    }
    @RequestMapping("/getgeodata")
    public @ResponseBody Object getgeodata(@RequestParam("loc") String loc){
        List<shopDto> list = new ArrayList<>();

        if(loc.equals("s")){
            list.add(new shopDto( 100, "순대국", "a.jpg", 37.5547611, 127.0654625));
            list.add(new shopDto( 101, "파스타", "b.jpg", 37.5947611, 127.0554625));
            list.add(new shopDto( 102, "햄버거", "c.jpg", 37.5547511, 127.0654635));
        }
        if (loc.equals("b")){
            list.add(new shopDto( 100, "회", "a.jpg", 35.1290493,129.0436982));
            list.add(new shopDto( 101, "조개구이", "b.jpg", 35.1290683,129.0436982));
            list.add(new shopDto( 102, "장어덮밥", "c.jpg", 35.1300483,129.0346982));
        }if (loc.equals("j")){
            list.add(new shopDto( 100, "해녀식당", "a.jpg", 35.1290493,129.0436982));
            list.add(new shopDto( 101, "다금바리횟집", "b.jpg", 35.1290683,129.0436982));
            list.add(new shopDto( 102, "감귤녹차라떼", "c.jpg", 35.1300483,129.0346982));
        }
        return list;
    }
}
