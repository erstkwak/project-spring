package com.spring.qna.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReplyPageVO {

  private int replyCount;
  private List<ReplyVO> list;
}
