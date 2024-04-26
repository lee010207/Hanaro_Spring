package com.hana.controller;

import com.hana.app.data.dto.AddrDto;
import com.hana.app.data.dto.CustDto;
import com.hana.app.service.AddrService;
import com.hana.app.service.CustAddrService;
import com.hana.app.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/cust")
@RequiredArgsConstructor
public class CustController {
    String dir= "cust/";

    final CustService custService;

    final AddrService addrService;
    final CustAddrService custAddrService;

    @RequestMapping("/")
    public String main(Model model){
        model.addAttribute("left", dir+"left");
        model.addAttribute("center",dir+"center");
        return "index";
    }


    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("left", dir+"left");
        model.addAttribute("center",dir+"add");
        return "index";
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model, AddrDto addrDto){
        System.out.println(addrDto.toString());

        try {
            addrService.add(addrDto);
        } catch (Exception e) {
            //throw new RuntimeException(e);
            model.addAttribute("left", dir+"left");
            model.addAttribute("center","registerfail");
            return "index";
        }

        return "redirect:/cust/detail?id="+addrDto.getAddrId();
    }

    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") String id){
        AddrDto addrDto = null;

        try {
            addrDto = addrService.get(Integer.parseInt(id));

            model.addAttribute("dto", addrDto);
            model.addAttribute("left", dir+"left");
            model.addAttribute("center",dir+"detail");
        } catch (Exception e) {
            //throw new RuntimeException(e);
            model.addAttribute("left", dir+"left");
            model.addAttribute("center","registerfail");
        }
        return "index";
    }

    @RequestMapping("/get")
    public String get(Model model, HttpSession httpSession) {

        String id = (String) httpSession.getAttribute("id");
        System.out.println(id);
        List<AddrDto> addrDto = null;

        try {
            addrDto = custAddrService.getCust(id);

            model.addAttribute("addr", addrDto);
            model.addAttribute("left", dir+"left");
            model.addAttribute("center",dir+"get");
        } catch (Exception e) {
            //throw new RuntimeException(e);
            model.addAttribute("left", dir+"left");
            model.addAttribute("center","registerfail");
        }

        return "index";
    }


}