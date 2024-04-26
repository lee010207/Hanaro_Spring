package com.hana.controller;

import com.hana.app.data.dto.CommuDto;
import com.hana.app.service.CommuService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class Maincontroller {

    final CommuService commuService;

    @RequestMapping("/")
    public String main(){
        return "index";
    }

    @RequestMapping("/admin")
    public String admin(Model model){
        model.addAttribute("center", "admin");
        return "index";
    }

    @RequestMapping("/commu")
    public String commu(Model model) throws Exception{
        List<CommuDto> commulist = null;

        commulist = commuService.get();
        model.addAttribute("commuinfo", commulist);

        model.addAttribute("center","commu");
        return "index";
    }

}
