package com.hana.cust;

import com.hana.app.data.entity.CustAddrEntity;
import com.hana.app.data.entity.CustEntity;
import com.hana.app.service.CustAddrService;
import com.hana.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Optional;

@SpringBootTest
@Slf4j
class InsertTests {
    @Autowired
    CustAddrService custAddrService;
    @Test
    void contextLoads() {

        CustEntity cust = CustEntity.builder().id("id01").build();
        CustAddrEntity custAddr = CustAddrEntity.builder()
                .id(2L)
                .name("내집")
                .addr("서울시 강동구 천호대로100")
                .cust(cust)
                .build();
        custAddrService.update(custAddr);
    }

}
