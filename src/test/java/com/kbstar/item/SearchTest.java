package com.kbstar.item;

import com.kbstar.dto.ItemSearch;
import com.kbstar.service.ItemService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SearchTest {
    @Autowired
    ItemService service;
    @Test
    void contextLoads() {
        try {
            ItemSearch ms =
                    new ItemSearch("바", 1000, "2023/04/01", "2023/05/05");
//            new ItemSearch("c", 10, "2023/04/01", "2023/05/05");
            service.search(ms);
        } catch (Exception e) {
            log.info("에러..");
            //e.printStackTrace();
        }
    }

}
