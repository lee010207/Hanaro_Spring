package com.hana.controller;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
@Slf4j
public class MemberController {

    final MemberService memberService;

    String dir = "member/";

    @RequestMapping("/join")
    public String join(Model model){
        model.addAttribute("center", dir+"join");
        return "index";
    }
    @RequestMapping("/joinimpl")
    public String joinimpl(Model model, MemberDto memberDto){
        try {
            memberService.add(memberDto);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/member/login";
    }

    @RequestMapping("/idCheck")
    @ResponseBody
    public String idCheck(@RequestParam("id") String id, Model model) {
        MemberDto dto = null;
        String msg = "사용가능한 아이디 입니다.";

        try {
            dto = memberService.get(id);
            if(dto != null){
                msg = "중복된 아이디 입니다.";
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return msg;
    }

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", dir + "login");
        return "index";
    }

    @RequestMapping("/loginimpl")
    @ResponseBody
    public String loginimpl(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpSession httpSession, Model model){
        MemberDto dto = null;
        String msg = "";
        try {
            dto = memberService.get(id);
            if(dto == null){
                msg = "아이디가 존재하지 않습니다.";
                throw new Exception();
            }
            if(!dto.getMemberPw().equals(pw)){
                msg = "비밀번호가 다릅니다.";
                throw new Exception();
            }
            httpSession.setAttribute("logininfo", dto);
            msg = "로그인 성공";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return msg;
    }

    @RequestMapping("/logoutimpl")
    public String logoutimpl(HttpSession httpSession){
        log.info("---------logout----------");
        if(httpSession != null){
            httpSession.invalidate();
        }
        return "redirect:/";
    }

    @RequestMapping("/idFind")
    public String idFind(Model model){
        model.addAttribute("center", dir+"idFind");
        return "index";
    }

    @RequestMapping("/idFindimpl")
    public String idFindimpl(Model model, MemberDto dto) throws Exception {

        String id = memberService.getId(dto);
        model.addAttribute("findId",id);
        model.addAttribute("center", dir+"FindId");
        return "index";
    }

    @RequestMapping("/pwFind")
    public String pwFind(Model model){
        model.addAttribute("center", dir+"pwFind");
        return "index";
    }

    @RequestMapping("/pwFindimpl")
    public String pwFindimpl(Model model, MemberDto dto) throws Exception {
        String pw = memberService.getPw(dto);
        model.addAttribute("findPw",pw);
        model.addAttribute("center", dir+"FindPw");
        return "index";
    }

}
