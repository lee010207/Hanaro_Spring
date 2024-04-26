package com.hana.app.service;

import com.hana.app.data.dto.CommuDto;
import com.hana.app.data.dto.MemberDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.CommuRepository;
import com.hana.app.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CommuService implements HanaService<Integer, CommuDto> {

    final CommuRepository commuRepository;

    @Override
    public int add(CommuDto dto) throws Exception {
        return commuRepository.insert(dto);
    }

    @Override
    public int del(Integer i) throws Exception {
        return commuRepository.delete(i);
    }

    @Override
    public int modify(CommuDto dto) throws Exception {
        return commuRepository.update(dto);
    }

    @Override
    public CommuDto get(Integer i) throws Exception {
        return commuRepository.selectOne(i);
    }

    @Override
    public List<CommuDto> get() throws Exception {
        return commuRepository.select();
    }
    public List<CommuDto> titleSearch(String title){
        return commuRepository.titleSearch(title);
    };
    public List<CommuDto> contentSearch(String content){
        return commuRepository.contentSearch(content);
    };
    public List<CommuDto> adminNoticePage(int page){
        return commuRepository.adminNoticePage(page);
    };

    /*public List<CommuDto> sort(String sort1, String sort2) {
        Map<String, String> params = new HashMap<>();
        params.put("sort1", sort1); // 첫 번째 파라미터
        params.put("sort2", sort2); // 두 번째 파라미터
        return commuRepository.orderby(params);
    }*/

    public List<CommuDto> sort(int sort) throws Exception {
        if (sort == 1) {
            return commuRepository.sortIdAsc();
        } else if (sort == 2) {
            return commuRepository.sortIdDesc();
        } else if (sort == 3) {
            return commuRepository.sortDateAsc();
        } else{
            return commuRepository.select();
        }
    }

    public List<CommuDto> idSearch(String word) {
        return commuRepository.idSearch(word);
    }

    public List<CommuDto> allSearch(String word) {
        return commuRepository.allSearch(word);
    }
}
