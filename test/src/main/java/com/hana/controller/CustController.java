package com.hana.controller;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.data.dto.OTODto;
import com.hana.app.data.dto.QNADto;
import com.hana.app.service.OTOService;
import com.hana.app.service.QNAService;
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
@RequestMapping("/cust")
@RequiredArgsConstructor
@Slf4j
public class CustController {
    final QNAService qnaService;
    final OTOService otoService;

    String dir = "customer/";

    @RequestMapping("/onetoone")
    public String oTo(Model model) {

        model.addAttribute("center", dir + "onetoone");
        return "index";
    }
    @RequestMapping("/otoimpl")
    public String oToimpl(OTODto dto, Model model) {
        try {
            otoService.add(dto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/";
    }

    @RequestMapping("/qna")
    public String qna(Model model) throws Exception {
        List<QNADto> list = null;
        list = qnaService.get();
        model.addAttribute("qna",list);
        model.addAttribute("center",dir+"qna");
        return "index";
    }

    @RequestMapping("/qnaSearch")
    @ResponseBody
    public List<QNADto> qnaSearch(@RequestParam("searchOption")int op, @RequestParam("keyword") String word, Model model) {
        List<QNADto> list = null;

        if(op == 1){
            list = qnaService.titleSearch(word);
        }
        if(op == 2){
            list = qnaService.contentSearch(word);
        }
        if(op == 3){
            list = qnaService.nameSearch(word);
        }
        return list;
    }

    @RequestMapping("/qnaCheck")
    public String qnaCheck(@RequestParam("idx") int idx, Model model) {
        model.addAttribute("qnaidx", idx);
        return dir + "qnaCheck";
    }

    @RequestMapping("/qnaCheckimpl")
    @ResponseBody
    public int qnaCheckimpl(@RequestParam("idx") int idx, @RequestParam("pw") String pw, Model model) {
        int res = 0;

        try {
            String qnaPw = qnaService.getQnaPw(idx);
            if(qnaPw.equals(pw)) {
                res = 1;
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return res;
    }

    @RequestMapping("/qnaDetail/{idx}")
    public String qnaDetail(@PathVariable("idx") int idx, Model model) {
        QNADto dto = null;
        try {
            dto = qnaService.get(idx);
            model.addAttribute("qnadto", dto);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        model.addAttribute("center", dir + "qnaDetail");
        return "index";
    }

}
