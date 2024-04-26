package com.hana.app.service;

import com.hana.app.data.dto.AddrDto;
import com.hana.app.data.dto.CustDto;
import com.hana.app.frame.HanaService;
import com.hana.app.repository.CustAddrRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@RequiredArgsConstructor
public class CustAddrService implements HanaService<String, AddrDto> {
    final CustAddrRepository custAddrRepository;

    @Override
    public int add(AddrDto addrDto) throws Exception {
        return 0;
    }

    @Override
    public int del(String s) throws Exception {
        return 0;
    }

    @Override
    public int modify(AddrDto addrDto) throws Exception {
        return 0;
    }

    @Override
    public AddrDto get(String s) throws Exception {
        return null;
    }

    @Override
    public List<AddrDto> getCust(String s) throws Exception {
        return custAddrRepository.selectCust(s);
    }

    @Override
    public List<AddrDto> get() throws Exception {
        return null;
    }
}
