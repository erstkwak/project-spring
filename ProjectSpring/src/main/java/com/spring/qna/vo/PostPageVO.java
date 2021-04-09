package com.spring.qna.vo;

import lombok.Data;

@Data
public class PostPageVO 
{

	private int start;
	private int end;
	private int total;
	private UtilVO util;
	private boolean prev;
	private boolean next;
	
	public PostPageVO(UtilVO util, int total) {
		this.util = util;
		this.total = total;

		this.end = (int) (Math.ceil(util.getPageNum() / 10.0)) * 10;

		this.start = this.end - 9;

		int realEnd = (int) (Math.ceil((total * 1.0) / util.getAmount()));

		if (realEnd <= this.end) {
			this.end = realEnd;
		}

		this.prev = this.start > 1;

		this.next = this.end < realEnd;
	}

}