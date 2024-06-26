package com.hana.controller;

import com.hana.app.data.dto.BoardDto;
import com.hana.app.data.dto.CustDto;
import com.hana.app.data.dto.OcrDto;
import com.hana.app.data.entity.LoginCust;
import com.hana.app.repository.LoginCustRepository;
import com.hana.app.service.BoardService;
import com.hana.app.service.CustService;
import com.hana.util.*;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Random;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {

    final CustService custService;
    final BoardService boardService;
    final BCryptPasswordEncoder encoder;
    final LoginCustRepository loginCustRepository;


    @Value("${app.key.wkey}")
    String wkey;
    @Value("${app.key.whkey}")
    String whkey;
    @Value("${app.url.serverurl}")
    String serverurl;
    @Value("${app.url.chatboturl}")
    String chatboturl;

    @Value("${app.dir.uploadimgdir}")
    String uploadImgDir;
    @Value("${app.key.ncp-id}")
    String ncpid;
    @Value("${app.key.ncp-secret}")
    String ncpsecret;

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

    @RequestMapping("/chatbot")
    public String chatbot(Model model){
        // chatbot페이지로 이동하면서 chatboturl로 접속
        model.addAttribute("chatbotrurl",chatboturl);
        model.addAttribute("center","chatbot");
        return "index";
    }

    @RequestMapping("/ocrimpl")
    public String ocrimpl(Model model, OcrDto ocrDto) throws IOException {
        // MultipartFile에서 이미지이름 꺼내오기
        String imgname = ocrDto.getImage().getOriginalFilename();

        // 매개변수 : 넣을 이미지 파일, 저장할 폴더 위치(경로)
        FileUploadUtil.saveFile(ocrDto.getImage(), uploadImgDir);

        // 저장한 이미지 파일을 네이버클라우드로 보내야함
        JSONObject jsonObject = OCRUtil.getResult(uploadImgDir, imgname);
        // uploadImgDir에서 imgname인 이름의 파일을 네이버 클라우드한테 OCR Api로 분석해달라고 물어봐줄래

        Map<String, String> map = OCRUtil.getData(jsonObject);

        model.addAttribute("result", map);
        model.addAttribute("imgname", imgname);
        model.addAttribute("center","ocr");
        return "index";
    }


    @RequestMapping("/chat2")
    public String chat2(Model model){
        model.addAttribute("serverurl",serverurl);
        model.addAttribute("center","chat2");
        return "index";
    }

    @RequestMapping("/summaryimpl")
    @ResponseBody
    public Object summaryimpl(@RequestParam("content") String content){
        JSONObject result = (JSONObject) NcpUtil.getSummary(ncpid,ncpsecret, content);
        return result;
    }
    @RequestMapping("/saveimg")
    @ResponseBody
    public String saveimg(@RequestParam("file") MultipartFile multipartFile) throws IOException {
        // 캔버스에 있는 파일을 formdata로 받아서 바이너리(Blob)형태로 변환해 보냄
        // const file = new Blob([new Uint8Array(array)], {type: 'image/jpeg'});
        String imgname = multipartFile.getOriginalFilename();
        FileUploadUtil.saveFile(multipartFile , uploadImgDir);
        return imgname;

    }
    @RequestMapping("/weather")
    public String weather(Model model){
        model.addAttribute("center","weather");
        return "index";
    }
    @RequestMapping("/chat")
    public String chat(Model model){
        model.addAttribute("serverurl",serverurl);
        model.addAttribute("center","chat");
        return "index";
    }
    @RequestMapping("/wh")
    @ResponseBody
    public Object wh(Model model) throws IOException, ParseException {
        return WeatherUtil.getWeather("109", wkey);
    }
    @RequestMapping("/wh2")
    @ResponseBody
    public Object wh2(Model model) throws IOException, ParseException {
        return WeatherUtil.getWeather2("1835848", whkey);
    }

    @RequestMapping("/logoutimpl")
    public String logoutimpl(Model model, HttpSession httpSession){
        log.info("start Logout --------------------------------------");
        if(httpSession != null){
            loginCustRepository.deleteById((String) httpSession.getAttribute("id"));
            httpSession.invalidate();
        }
        log.info("end Logout --------------------------------------");

        return "index";
    }
    @RequestMapping("/loginimpl")
    public String loginimpl(Model model,
                            @RequestParam("id") String id,
                            @RequestParam("pw") String pwd, HttpSession httpSession){
        CustDto custDto = null;
        try {
            custDto = custService.get(id);
//            log.info(custDto.toString()+"----로그인정보입니다아아아아아--------------");
            if(custDto == null){
                throw new Exception();
            }
            if(!encoder.matches(pwd,custDto.getPw())){
                throw new Exception();
            }
            Optional<LoginCust> loginCust =  loginCustRepository.findById(id);
            if(loginCust.isPresent()){
                throw new Exception();
            }
            loginCustRepository.save(LoginCust.builder().loginId(id).build());

            httpSession.setAttribute("id", id);

        } catch (Exception e){
            model.addAttribute("msg","로그인 되어 있습니다.");
            model.addAttribute("center","login");
            return "index";
            //throw new RuntimeException(e);
        }
        return "redirect:/";
    }

    @RequestMapping("/registerimpl")
    public String registerimpl(Model model,
                               CustDto custDto, HttpSession httpSession){

        try {
            //log.info(encoder.encode(custDto.getPwd()));
            //log.info(encoder.encode(custDto.getPwd()).length()+"");
            custDto.setPw(encoder.encode(custDto.getPw()));
            custDto.setName(StringEnc.encryptor(custDto.getName()));
            custService.add(custDto);
            loginCustRepository.save(LoginCust.builder().loginId(custDto.getId()).build());

            httpSession.setAttribute("id", custDto.getId());
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("center","registerfail");
        }


        return "index";
    }
    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("center","register");
        return "index";
    }
    @RequestMapping("/pic")
    public String pic(Model model){
        model.addAttribute("center","pic");
        return "index";
    }
    @RequestMapping("/ocr")
    public String ocr(Model model){
        model.addAttribute("center","ocr");
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
    @RequestMapping("/summary")
    public String summary(Model model){
        model.addAttribute("center","summary");
        return "index";
    }

}
