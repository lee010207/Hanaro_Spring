package com.hana.app.data.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity(name="custaddr")
@Table(name="t_custaddr")
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PROTECTED)
@Builder
@ToString(exclude = "cust")
// ToString일 떄만 cust필드 제외
// 있을 수도 있고 없을 수도 있는 경우를 위해 (null값이면 에러나니까 쓰는 것 같음)
@Getter
public class CustAddrEntity extends BaseEntity {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "custaddr_id")
    private int id;

    private String addr;

    @ManyToOne(fetch = FetchType.LAZY)
    // 기본이 EAGER -> 고객 주소 정보를 조회할 때 고객 정보를 무조건 같이 가져옴
    @JoinColumn(name = "cust_id") //foriegnKey
    private CustEntity cust;
}