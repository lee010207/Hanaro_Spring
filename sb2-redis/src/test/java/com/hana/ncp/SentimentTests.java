package com.hana.ncp;

import com.hana.util.NcpUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SentimentTests {
    @Value("${app.key.ncp-id}")
    String ncpid;
    @Value("${app.key.ncp-secret}")
    String ncpsecret;

    @Test
    void contextLoads() {
        String text = "잠와 집에 가고 싶어 피곤해";
        JSONObject obj  = (JSONObject) NcpUtil.getSentiment(ncpid,ncpsecret,text);
        log.info(obj.toJSONString());
    }

}