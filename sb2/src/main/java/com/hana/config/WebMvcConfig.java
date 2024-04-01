package com.hana.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@Slf4j
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    // 프로젝트와 관련 없는 폴더를 만들어 그 별도의 디렉토리를 가져다 쓸 수 있음
    // 그 디렉토리를 내 웹에 인식시키는 방법
    @Value("${app.dir.imgdir}")
    String imgdir;
    @Value("${app.dir.logdir}")
    String logdir;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        log.info("================"+logdir);

        // 변수에 들어간 디렉토리 정보를 우리 웹 애플리케이션에서 사용하겠다
        registry.addResourceHandler("/img/**").addResourceLocations(imgdir);
        registry.addResourceHandler("/logs/**").addResourceLocations(logdir);
    }

}