package com.hana.app.data.dto;

import lombok.*;

import java.sql.Date;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class QNADto {

    private int qnaIdx;
    private String qnaName;
    private String qnaPw;
    private String qnaTitle;
    private String qnaContent;
    private Date qnaDate;
}
