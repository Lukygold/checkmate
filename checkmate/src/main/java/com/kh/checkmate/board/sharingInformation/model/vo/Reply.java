package com.kh.checkmate.board.sharingInformation.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Reply {
	   private int replyNo;
	   private String replyContent;
	   private int refBno;
	   private int refUno;
	   private String replyWriter;
	   private Date replyDate;
	   private String replyStatus;
	}