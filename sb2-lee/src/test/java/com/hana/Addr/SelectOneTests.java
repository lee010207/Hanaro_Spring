package com.hana.Addr;

import com.hana.app.data.dto.AddrDto;
import com.hana.app.service.AddrService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

import java.sql.SQLException;

@SpringBootTest
@Slf4j
public class SelectOneTests {
    @Autowired
    AddrService addrService;

    @Test
    void contextLoads(){
        try {
            AddrDto dto = addrService.get(2);
            log.info(dto.toString());
        } catch (Exception e) {
            // 테스트 프로그래밍에서 비정상 케이스를 더 구체적으로 처리해줘야 함
            if(e instanceof SQLException){
                log.info("SQL쿼리문 오류임(시스템 장애)-----System Trouble EX001-----");
            } else if (e instanceof DuplicateKeyException) {
                log.info("중복값 있음-------id Duplicated EX002--------");
            }else {
                log.info("--------Error EX003--------");
                e.printStackTrace();
            }
        }
    }
}
