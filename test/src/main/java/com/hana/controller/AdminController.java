package com.hana.controller;

import com.hana.app.data.dto.CommuDto;
import com.hana.app.data.dto.MemberDto;
import com.hana.app.service.CommuService;
import com.hana.app.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
@Slf4j
public class AdminController {
    final MemberService memberService;
    final CommuService commuService;

    String dir = "admin/";

    @RequestMapping("/login")
    public String adminlogin(MemberDto memberDto, Model model, HttpSession session) {
        MemberDto dto = null;
        try {
            dto = memberService.adminLogin(memberDto);

            if(dto == null){
              throw new Exception();
            }
            session.setAttribute("adminId", dto.getMemberId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/admin/member";
    }

    @RequestMapping("/member")
    public String adminmember( Model model) throws Exception {
        List<MemberDto> list = null;
        list = memberService.get();
        model.addAttribute("memberList", list);
        model.addAttribute("center", dir+"member");
        return "index";
    }


    @RequestMapping("/search")
    @ResponseBody
    public List<CommuDto> adminSearch(@RequestParam("searchOption")int op, @RequestParam("keyword") String word, Model model) {
        List<CommuDto> list = null;
        if(op == 0){
           list = commuService.allSearch(word);
        }
        if(op == 1){
           list = commuService.titleSearch(word);
        }
        if(op == 2){
            list = commuService.contentSearch(word);
        }
        if(op == 3){
            list = commuService.idSearch(word);
        }
        return list;
    }

    @RequestMapping("/member/search")
    @ResponseBody
    public List<MemberDto> adminMemberSearch(@RequestParam("searchOption")int op, @RequestParam("keyword") String word, Model model) {
        List<MemberDto> list = null;
        if(op == 0){
           list = memberService.allSearch(word);
        }
        if(op == 1){
           list = memberService.idSearch(word);
        }
        if(op == 2){
            list = memberService.nameSearch(word);
        }
        if(op == 3){
            list = memberService.emailSearch(word);
        }
        return list;
    }

    @RequestMapping("/notice")
    public String adminnotice( Model model) throws Exception {
        List<CommuDto> commulist = null;

        commulist = commuService.get();
        model.addAttribute("noticeinfo", commulist);

        model.addAttribute("center", dir+"notice");
        return "index";
    }
    @RequestMapping("/noticePage/{page}")
    public String adminnoticePage(@PathVariable("page") int page, Model model) throws Exception {
        List<CommuDto> commulist = null;

        commulist = commuService.adminNoticePage(page);
        model.addAttribute("noticeinfo", commulist);

        model.addAttribute("center", dir+"notice");
        return "index";
    }

    @RequestMapping("/memberPage/{page}")
    public String adminMemberPage(@PathVariable("page") int page, Model model) throws Exception {
        List<MemberDto> list = null;

        list = memberService.adminMemberPage(page);
        model.addAttribute("memberList", list);

        model.addAttribute("center", dir+"member");
        return "index";
    }

    @RequestMapping("/write")
    public String adminwrite( Model model) {

        model.addAttribute("center", dir+"write");
        return "index";
    }
    @RequestMapping("/writeImpl")
    public String writeImpl(CommuDto dto, Model model) {
        log.info("-----------------------------------------");
        log.info("dto: "+ dto.toString());
        try {
            commuService.add(dto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/admin/notice";
    }
    @RequestMapping("/modify")
    public String adminmodify(@RequestParam("idx") int idx,  Model model) {
        CommuDto dto = null;

        try {
            dto = commuService.get(idx);
            model.addAttribute("modifyinfo", dto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("center", dir+"modify");
        return "index";
    }
    @RequestMapping("/modifyImpl")
    public String adminmodifyImpl(CommuDto dto, Model model) {

        try {
            commuService.modify(dto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "redirect:/admin/notice";
    }

    @RequestMapping("/noticeSort")
    public String adminnoticeSort(@RequestParam("sort") int sort, Model model) {
        List<CommuDto> commulist = null;
        try {
            commulist = commuService.sort(sort);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("noticeinfo", commulist);
        model.addAttribute("center", dir+"notice");
        return "index";
    }

    @RequestMapping("/memberSort")
    public String adminMemberSort(@RequestParam("sort") int sort, Model model) {
        List<MemberDto> list = null;
        try {
            list = memberService.sort(sort);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("memberList", list);
        model.addAttribute("center", dir+"member");
        return "index";
    }

}
