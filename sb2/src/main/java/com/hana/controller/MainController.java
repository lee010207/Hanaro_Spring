package com.hana.controller;

import com.hana.app.data.dto.BoardDto;
import com.hana.app.data.dto.CustDto;
import com.hana.app.service.BoardService;
import com.hana.app.service.CustService;
import com.hana.util.WeatherUtil;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.Random;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {

    final CustService custService;
    final BoardService boardService;

    // application-dev.yml 환경설정 파일에서 key값을 저장해놓고 bean에 등록해서 사용
    @Value("${app.wkey}")
    String wkey;

    @RequestMapping("/")
    public String main(Model model) throws Exception {
        Random r = new Random();
        int num = r.nextInt(1000)+1;
        List<BoardDto> list = null;
        try{
            list = boardService.getRank();
        }catch (Exception e){
            model.addAttribute("ranks",null);
        }
        model.addAttribute("ranks",list);
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model){
        model.addAttribute("center","login");
        return "index";
    }
    @RequestMapping("/logout")
    public String logout(Model model, HttpSession httpSession){
        if(httpSession != null){
            httpSession.invalidate();
        }
        return "index";
    }
    @RequestMapping("/loginimpl")
    public String loginimpl(Model model,
                            @RequestParam("id") String id,
                            @RequestParam("pwd") String pwd, HttpSession httpSession){
        CustDto custDto = null;
        try {
            custDto = custService.get(id);
            if(custDto == null){
                throw new Exception();
            }
            if(!custDto.getPw().equals(pwd)){
                throw new Exception();
            }
            httpSession.setAttribute("id", id);

        } catch (Exception e){
            model.addAttribute("msg","ID또는 PWD가 틀렸습니다.");
            model.addAttribute("center","login");
            //throw new RuntimeException(e);
        }
        return "index";
    }

    @RequestMapping("/registerimpl")
    public String registerimpl(Model model,
                               CustDto custDto, HttpSession httpSession){

        try {
            custService.add(custDto);
            httpSession.setAttribute("id", custDto.getId());
        } catch (Exception e) {
            //throw new RuntimeException(e);
            model.addAttribute("center","registerfail");
        }


        return "index";
    }
    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("center","register");
        return "index";
    }

    @ResponseBody
    @RequestMapping("/registercheckid")
    public Object registercheckid(@RequestParam("id") String id) throws Exception {
        String result = "0";
        CustDto custDto = custService.get(id);
        if(custDto == null){
            result = "1";
        }
        return result;
    }

    @RequestMapping("/wh")
    @ResponseBody
    public Object weather(Model model) throws IOException, ParseException {
        return WeatherUtil.getWeather("109", wkey);
    }

}
