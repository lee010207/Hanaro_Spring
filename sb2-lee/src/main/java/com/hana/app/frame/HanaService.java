package com.hana.app.frame;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface HanaService<K, V> {
    @Transactional
    int add(V v) throws Exception;
    @Transactional
    int del(K k) throws Exception;
    @Transactional
    int modify(V v) throws Exception;
    //@Transactional : 자동으로 알아서 트랜잭션 처리가 가능
    // -> rollback, commit 같은 처리
    // ex) insert 하나 할때 보통 repository 3개 이상이 동시에 처리되는데 3 동작이 한 트랜잭션으로 처리되기 위해
    // 즉, 3 중 하나라도 오류가 나면 나머지 둘은 롤백되어야 하기 때문에
    // 트랜잭션 처리를 따로 해줘야함

    V get(K k) throws Exception;
    List<V> getCust(K k) throws Exception;
    List<V> get() throws Exception;
}
