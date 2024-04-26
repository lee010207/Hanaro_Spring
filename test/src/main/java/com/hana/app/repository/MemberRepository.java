package com.hana.app.repository;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MemberRepository extends HanaRepository<String, MemberDto> {
    String getId(MemberDto dto);

    String getPw(MemberDto dto);
    MemberDto adminLogin(MemberDto dto);

    List<MemberDto> allSearch(String word);

    List<MemberDto> nameSearch(String word);

    List<MemberDto> emailSearch(String word);

    List<MemberDto> idSearch(String word);

    List<MemberDto> adminMemberPage(int page);

    List<MemberDto> sortIdAsc();

    List<MemberDto> sortIdDesc();

    List<MemberDto> sortDateAsc();
}
