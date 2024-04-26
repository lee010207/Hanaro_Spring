package com.hana.app.data.entity;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;

@Entity(name = "custaddr")
@Table(name = "db_custaddr")
@Getter
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder
@ToString(exclude = "cust")
@EntityListeners(AuditingEntityListener.class)
// 날짜 / 시간 자동 삽입
public class CustAddrEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "custaddr_id")
    private Long id;

    @Column(nullable = false, length = 50)
    private String name;
    @Column(nullable = true, length = 100)
    private String addr;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cust_id")
    private CustEntity cust;


    public void addCust(CustEntity cust){
        // CustEntity가 만들어질 떄마다 새로운 ArrayList가 만들어지고
        // 엔티티가 만들어질 때마다 cust레퍼런스를 넣어주고 그 레퍼런스를 찾아가서 그 cust의 ArrayList에 주소록을 넣어줌
        this.cust = cust;
        cust.getCustAddrEntityList().add(this);
    }


    @CreatedDate
    // 생성할 때 만들어진다
    @Column(updatable = false)
    // 수정할 수 없음
    private LocalDateTime regdatedAt;
    @LastModifiedDate
    // 수정할 때 만들어진다
    private LocalDateTime updatedAt;

}
