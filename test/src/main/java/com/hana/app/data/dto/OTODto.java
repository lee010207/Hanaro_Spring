package com.hana.app.data.dto;

import lombok.*;

import java.sql.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class OTODto {
    private int one2oneIdx;
    private String one2oneName;
    private String one2onePhone;
    private String one2oneEmail;
    private String one2oneAddress;
    private String one2oneTitle;
    private String one2oneContent;
    private Date one2oneDate;
}
