var replyService = (function() {

	// 댓글 쓰기
	function add(reply, callback, error) {
		$.ajax({
			type : 'post'
			, url : '/replies/new'
			, data : JSON.stringify(reply)
			, contentType : 'application/json; charset=utf-8'
			, success : function(result, status, xhr) {
					if (callback) {
						callback(result);
					}
				}
			, error : function(xhr, status, er) {
					if (error) {
						error(er);
					}
				}
		});
	}

	// 댓글 리스트
	function getList(param, callback, error) {
		var p_no = param.p_no;
		var page = param.page || 1;
		$.getJSON('/replies/pages/' + p_no + '/' + page + '.json', function(data) {
			if (callback) {
				callback(data.replyCount, data.list);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

	// 댓글 삭제
	function remove(r_no, callback, error) {
		$.ajax({
			type : 'delete'
			, url : '/replies/' + r_no
			, success : function(deleteResult, status, xhr) {
					if (callback) {
						callback(deleteResult);
					}
				}
			, error : function(xhr, status, er) {
					if (error) {
						error(er);
					}
				}
		});
	}

	// 댓글 수정
	function update(reply, callback, error) {
		$.ajax({
			type : 'put'
			, url : '/replies/' + reply.r_no
			, data : JSON.stringify(reply)
			, contentType : 'application/json; charset=utf-8'
			, success : function(result, status, xhr) {
					if (callback) {
						callback(result);
					}
				}
			, error : function(xhr, status, er) {
					if (error) {
						error(er);
					}
				}
		});
	}

	// 댓글 조회
	function get(r_no, callback, error) {
		$.get('/replies/' + r_no + '.json', function(result) {
			if (callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

	// 하루 지나면 년월일 표시, 지나지 않으면 시분초 표시
	function displayTime(timeValue) {
		var now = new Date();
		var gap = now.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = '';
		if (gap < (1000 * 60 * 60 * 24)) {
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss ].join('');
		}
		else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');
		}
	}

	return {
		add : add
		, get : get
		, getList : getList
		, remove : remove
		, update : update
		, displayTime : displayTime
	}

})();