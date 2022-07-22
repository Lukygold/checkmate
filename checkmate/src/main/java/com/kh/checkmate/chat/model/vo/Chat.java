package com.kh.checkmate.chat.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Chat implements Serializable {
	
	private int chatNo;
	private int sgNo;
	private String userNick;
	private String chatContent;
	private Date chatSendDate;

}
