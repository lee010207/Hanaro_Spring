package com.hana.app.repository;

import com.hana.app.data.entity.CustEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustRepository extends JpaRepository <CustEntity,String>{
    // 일반적인 제네릭과 반대 : CrudRepository <value,key>
}
