package com.hana.app.data.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Builder
@Entity(name = "cust")
//(name = "cust") 엔터티 간에 호출할 떄 사용하는 용도(별명)
// Entity는 무조건 기본키를 생성해줘야 함
// Entity가 함부로 변경되면 안됨 -> Setter 사용함ㄴ 안됨
@Getter
@Table(name = "db_cust")
@ToString(exclude = "custAddrEntityList")
// custAddrEntityList : 만들어질수도 있고 안만들어질 수도 있기 떄문에 ToString에서 제외시킴
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor
public class CustEntity {

    @Id
    @Column(name = "cust_id", length = 30)
    private String id;
    @Column(length=60, nullable = false)
    private String pwd;
    @Column(length = 50, nullable = false)
    private String name;

    // Cust를 조회할 때 CustInfo도 조회하고 싶다
    // 소유관계 : cust는 custinfo를 가지고 있다
    @OneToOne(mappedBy = "cust")
    // OneToOne 경우 : 기본값이 같이 조회됨
    // => EAGER COMPOSITION : 컴퓨터는 cpu가 있어야한다(컴퓨터와 CPU의 관계)
    // custinfo가 cust라는 테이블에 맵핑되어 있다
    private CustInfoEntity custInfo;

    @OneToMany(mappedBy = "cust" , fetch = FetchType.EAGER)
    // mappedBy = "cust": 1:N관계 이고 cust 클래스에 맵핑하겠다
    // fetch = FetchType.EAGER : custAddrEntityList도 같이 조회하겠다
    // OneToMany : 기본값이 fetch = FetchType.LAZY -> CustEntity를 조회할 떄 같이 조회가 안됨
    // 그래서 같이 조회하라고 설정해줘야함(fetch = FetchType.EAGER)
    // 근데 custAddrEntityList 이 값이 있을 수도 있고 없을 수도 있으니 ToString 시에는 제외시킴
    // => LAZY AGGREGATION : 있을 수도 있고 없을 수도 있다
    @Builder.Default
    // @Builder.Default : custEntity가 실행될 떄 자동으로 생성됨
    // 소유관계 / List룰 담을 공간이 없음 -> 공간( new ArrayList<>() )을 만들어줌
    // Cust를 조회할 때 CustAddr도 조회하고 싶다
    private List<CustAddrEntity> custAddrEntityList = new ArrayList<CustAddrEntity>();

}
