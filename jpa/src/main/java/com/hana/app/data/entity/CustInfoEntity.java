package com.hana.app.data.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity(name = "custinfo")
@Table(name = "db_custinfo")
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Getter
@Builder
@ToString(exclude = "cust")
// cust(CustEntity)를 제외하고 toString해라
// CustEntity에서 CustInfoEntity를 가져와라 -> CustInfoEntity에서 CustEntity에서 사용자 아이디값을 조인해서 가져와라
// -> 무한루프
// => CustInfoEntity에서는 tostring할 때 CustEntity 가져오지 마라 : @ToString(exclude = "cust")
public class CustInfoEntity {
    @Id
    //기본키 지정
    @Column(name = "custinfo_id")
    // 컬럼명 설정
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    // auto increment
    private Long id;

    @OneToOne(fetch = FetchType.EAGER)
    // 1:1 관계
    @JoinColumn(name = "cust_id")
    // 외래키 지정
    private CustEntity cust;
    private String addr;
    private int age;
}
