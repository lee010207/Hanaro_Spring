package com.hana.app.repository;

import com.hana.app.data.entity.CustEntity;
import com.hana.app.data.entity.CustInfoEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustInfoRepository extends JpaRepository<CustInfoEntity,Long> {
}
