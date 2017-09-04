/*@Project : CLASS-IC
@File name : memo.xml
@Author : 최은혜
@Data : 2017.06.15
@Desc :*/

package com.class_ic.dao;

import java.util.List;

import com.class_ic.vo.MemoVO;

public interface MemoDAO {

	//메모등록
	public int insertMemo(MemoVO vo);
	
	//메모 조회
	public List<MemoVO> selectMemo(MemoVO vo);
	
	//메모 조회(단일출력)
	public MemoVO oneText(MemoVO vo);
	
	//메모 삭제
	public int deleteMemo(MemoVO vo);

}
