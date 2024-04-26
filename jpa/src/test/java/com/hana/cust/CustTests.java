package com.hana.cust;

import com.hana.app.data.entity.CustEntity;
import com.hana.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Optional;

@SpringBootTest
@Slf4j
class CustTests {
    @Autowired
    CustService custService;
    @Test
    void contextLoads() {
        CustEntity cust = CustEntity.builder()
                .id("id01")
                .pwd("pw01")
                .name("name01")
                .build();
        custService.insert(cust);

        /*CustEntity cust = CustEntity.builder()
                .id("id02")
                .pwd("pw02")
                .name("namename2")
                .build();
        custService.update(cust);*/

        Optional<CustEntity> op = custService.get("id02");
        if(op.isPresent()){
            log.info(op.get().toString());
        }

        List<CustEntity> list = custService.get();
        list.forEach(c-> log.info(c.toString()));
    }

}
