package com.hana.app.repository;

import com.hana.app.data.dto.CommuDto;
import com.hana.app.data.dto.MemberDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface CommuRepository extends HanaRepository<Integer, CommuDto> {
    List<CommuDto> titleSearch(String title);
    List<CommuDto> contentSearch(String content);
    List<CommuDto> adminNoticePage(int page);

//    List<CommuDto> orderby(Map<String, String> params);

    List<CommuDto> sortIdAsc();

    List<CommuDto> sortIdDesc();

    List<CommuDto> sortDateAsc();

    List<CommuDto> idSearch(String word);

    List<CommuDto> allSearch(String word);
}
