package com.hana.app.service;

import com.hana.app.data.dto.QNADto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.QNARepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class QNAService implements HanaService<Integer, QNADto> {

    final QNARepository qnaRepository;

    @Override
    public int add(QNADto dto) throws Exception {
        return qnaRepository.insert(dto);
    }

    @Override
    public int del(Integer i) throws Exception {
        return qnaRepository.delete(i);
    }

    @Override
    public int modify(QNADto dto) throws Exception {
        return qnaRepository.update(dto);
    }

    @Override
    public QNADto get(Integer i) throws Exception {
        return qnaRepository.selectOne(i);
    }

    @Override
    public List<QNADto> get() throws Exception {
        return qnaRepository.select();
    }
    public String getQnaPw(Integer i) throws Exception {
        return qnaRepository.getQnaPw(i);
    }

    public List<QNADto> titleSearch(String word) {
        return qnaRepository.titleSearch(word);
    }

    public List<QNADto> contentSearch(String word) {
        return qnaRepository.contentSearch(word);
    }

    public List<QNADto> nameSearch(String word) {
        return qnaRepository.nameSearch(word);
    }
}
