package com.hana.app.repository;

import com.hana.app.data.dto.QNADto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface QNARepository extends HanaRepository<Integer, QNADto> {
    String getQnaPw(Integer i);

    List<QNADto> titleSearch(String word);

    List<QNADto> contentSearch(String word);

    List<QNADto> nameSearch(String word);
}
