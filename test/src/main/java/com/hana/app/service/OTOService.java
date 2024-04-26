package com.hana.app.service;

import com.hana.app.data.dto.OTODto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.OTORepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OTOService implements HanaService<Integer, OTODto> {

    final OTORepository otoRepository;

    @Override
    public int add(OTODto dto) throws Exception {
        return otoRepository.insert(dto);
    }

    @Override
    public int del(Integer i) throws Exception {
        return otoRepository.delete(i);
    }

    @Override
    public int modify(OTODto dto) throws Exception {
        return otoRepository.update(dto);
    }

    @Override
    public OTODto get(Integer i) throws Exception {
        return otoRepository.selectOne(i);
    }

    @Override
    public List<OTODto> get() throws Exception {
        return otoRepository.select();
    }

}
