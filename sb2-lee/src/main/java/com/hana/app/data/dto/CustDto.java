package com.hana.app.data.dto;

import lombok.*;

@Data
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CustDto {
    private String id;
    private String pw;
    private String name;
}
