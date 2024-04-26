package com.hana.controller;

import com.hana.app.data.dto.CommuDto;
import com.hana.app.service.CommuService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/commu")
@RequiredArgsConstructor
@Slf4j
public class CommunityController {

    final CommuService commuService;

    String dir = "community/";

    @RequestMapping("/detail")
    public String commudetail(@RequestParam("idx") int idx, Model model){
        CommuDto dto = null;

        try {
            dto = commuService.get(idx);
            model.addAttribute("commudetail", dto);
        } catch (Exception e) {
            return "redirect:/commu";
        }
        model.addAttribute("center" , dir+"detail");
        return "index";
    }

    @RequestMapping("/search")
    public String commusearch(@RequestParam("opSearch") int op, @RequestParam("txtSearch") String txt, Model model){
        List<CommuDto> list = null;

        try {
            if(op == 1){
                list = commuService.titleSearch(txt);
            }
            if(op == 2){
                list = commuService.contentSearch(txt);
            }
            model.addAttribute("searchlist", list);
        } catch (Exception e) {
            return "redirect:/commu";
        }
        model.addAttribute("center" , dir+"search");
        return "index";
    }
}
