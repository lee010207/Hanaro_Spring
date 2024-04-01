package com.hana.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class shopDto {
    // 스프링에서는 빌더 안쓰고 노아규먼트로 만든 다음에 세터함
    // 그래서 NoArgsConstructor 생성 해줘야함
    private int id;
    private String title;
    private String img;
    private double lat;
    private double lng;
    // img가 여러개면 dto에 리스트 형태로 담음
    // private List<String> imgList 이런형태 아마도?
}
