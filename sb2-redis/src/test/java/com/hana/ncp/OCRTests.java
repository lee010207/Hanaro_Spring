package com.hana.ncp;

import com.hana.util.NcpUtil;
import com.hana.util.OCRUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Map;

@Slf4j
@SpringBootTest
class OCRTests {
    @Value("${app.dir.uploadimgdir}")
    String dir;


    @Test
    void contextLoads() {
        String imgname = "test.jpg";
        JSONObject obj  = (JSONObject) OCRUtil.getResult(dir, imgname);
        log.info(obj.toJSONString());
        Map<String,String> map = OCRUtil.getData(obj);
        map.values().forEach(txt ->{log.info(txt);});
    }

}