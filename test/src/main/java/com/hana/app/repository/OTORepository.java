package com.hana.app.repository;

import com.hana.app.data.dto.OTODto;
import com.hana.app.frame.HanaRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface OTORepository extends HanaRepository<Integer, OTODto> {
}
