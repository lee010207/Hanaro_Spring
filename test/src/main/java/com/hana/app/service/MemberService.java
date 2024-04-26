package com.hana.app.service;

import com.hana.app.data.dto.MemberDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberService implements HanaService<String, MemberDto> {

    final MemberRepository memberRepository;

    @Override
    public int add(MemberDto dto) throws Exception {
        return memberRepository.insert(dto);
    }

    @Override
    public int del(String s) throws Exception {
        return memberRepository.delete(s);
    }

    @Override
    public int modify(MemberDto dto) throws Exception {
        return memberRepository.update(dto);
    }

    @Override
    public MemberDto get(String s) throws Exception {
        return memberRepository.selectOne(s);
    }

    @Override
    public List<MemberDto> get() throws Exception {
        return memberRepository.select();
    }

    public String getId(MemberDto dto) throws Exception {
        return memberRepository.getId(dto);
    }

    public String getPw(MemberDto dto) throws Exception {
        return memberRepository.getPw(dto);
    }

    public MemberDto adminLogin(MemberDto dto) throws Exception {
        return memberRepository.adminLogin(dto);
    }

    public List<MemberDto> allSearch(String word) {
        return memberRepository.allSearch(word);
    }

    public List<MemberDto> nameSearch(String word) {
        return memberRepository.nameSearch(word);
    }

    public List<MemberDto> emailSearch(String word) {
        return memberRepository.emailSearch(word);
    }

    public List<MemberDto> idSearch(String word) {
        return memberRepository.idSearch(word);
    }

    public List<MemberDto> adminMemberPage(int page) {
        return memberRepository.adminMemberPage(page);
    }

    public List<MemberDto> sort(int sort) throws Exception {
        if (sort == 1) {
            return memberRepository.sortIdAsc();
        } else if (sort == 2) {
            return memberRepository.sortIdDesc();
        } else if (sort == 3) {
            return memberRepository.sortDateAsc();
        } else{
            return memberRepository.select();
        }    }
}
