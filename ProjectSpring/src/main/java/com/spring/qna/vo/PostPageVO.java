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
	
	public PostPageVO(int total, BoardUtilVO util) {
		this.total = total;
		this.util = util;
		this.end = 
	}
	
	
		this.cri = cri;
		this.total = total;

		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;

		this.startPage = this.endPage - 9;

		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}

		this.prev = this.startPage > 1;

		this.next = this.endPage < realEnd;
	}
	
	

}