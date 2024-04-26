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
class CustSelecTests {

    @Autowired
    CustService custService;
    @Autowired
    CustAddrService custAddrService;

    @Test
    void contextLoads() {

//        List<CustEntity> list = custService.get();
//        list.forEach(c-> log.info(c.toString()));
        List<CustAddrEntity> list = custAddrService.get();
        list.forEach(c-> log.info(c.toString()));

    }

}
