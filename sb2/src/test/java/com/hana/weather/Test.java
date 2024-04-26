package com.hana.weather;

import com.hana.util.WeatherUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;

@SpringBootTest
@Slf4j
class Test {

    @org.junit.jupiter.api.Test
    void contextLoads() throws IOException, ParseException {
        String key = "k21gYPWSY%2BOg4%2Bh9dAsgavKe0AkkiQtdg3u9%2BOIbNe6Vco6nHZ%2FoXoctaLRoAjruJCQculOSVwTG9DAlx5kglQ%3D%3D";
        String loc = "109";
        JSONObject jsonObject = (JSONObject) WeatherUtil.getWeather(loc, key);

        log.info("----------LOG----------------"+jsonObject.toJSONString());
    }

}