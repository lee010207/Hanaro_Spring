package com.hana.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CommuDto {
    private int noticeIdx;
    private String noticeTitle;
    private String noticeContent;
    private String noticeMemberId;
    private Date noticeDate;
}
