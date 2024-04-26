package com.hana.cust;

import com.hana.app.data.dto.CustDto;
import com.hana.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@SpringBootTest
@Slf4j
public class selectTests {
    @Autowired
    CustService custService;

    @Test
    void contextLoads(){
        List<CustDto> list = new ArrayList<>();

        try {
            list = custService.get();
//            list.stream().forEach(c->c.toString());
            for(CustDto c:list){
                log.info(c.toString());
            }
            log.info("------------OK----------------");
        } catch (Exception e) {
            // 테스트 프로그래밍에서 비정상 케이스를 더 구체적으로 처리해줘야 함
            if(e instanceof SQLException){
                log.info("SQL쿼리문 오류임(시스템 장애)-----System Trouble EX001-----");
            } else if (e instanceof DuplicateKeyException) {
                log.info("중복값 있음-------id Duplicated EX002--------");
            }else {
                log.info("--------Error EX003--------");
            }
        }
    }
}
