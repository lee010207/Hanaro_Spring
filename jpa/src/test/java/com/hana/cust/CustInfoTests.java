package com.hana.cust;

import com.hana.app.data.entity.CustEntity;
import com.hana.app.data.entity.CustInfoEntity;
import com.hana.app.service.CustInfoService;
import com.hana.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Optional;

@SpringBootTest
@Slf4j
class CustInfoTests {
    @Autowired
    CustInfoService custInfoService;
    @Test
    void contextLoads() {
        /*CustEntity cust = CustEntity.builder().id("id01").build();

        CustInfoEntity custInfo = CustInfoEntity.builder()
                .cust(cust)
                .addr("Seoul Korea")
                .age(30)
                .build();

        custInfoService.insert(custInfo);*/
        Optional<CustInfoEntity> op = custInfoService.get(2L);
        // 2L : Long 값 2
        if(op.isPresent()){
            log.info(op.get().toString());
        }
        List<CustInfoEntity> list = custInfoService.get();
        list.forEach(c->{
            log.info(c.toString());
        });

    }

}
