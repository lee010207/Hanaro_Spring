package com.hana.app.frame;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface HanaRepository<K,V> {
    int insert(V v) throws Exception;
    int delete(K k) throws Exception;
    int update(V v) throws Exception;;
    V selectOne(K k) throws Exception;;
    List<V> selectCust(K k) throws Exception;;
    List<V> select() throws Exception;;
}