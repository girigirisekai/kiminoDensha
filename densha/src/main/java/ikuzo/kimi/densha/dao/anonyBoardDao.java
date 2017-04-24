package ikuzo.kimi.densha.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;


import ikuzo.kimi.densha.vo.anonyBoard;

@Repository // 데이터 관련 일 객체
public class anonyBoardDao {

	@Autowired
	SqlSession sqlsession;

	public ArrayList<anonyBoard> view(int startRecord, int countPerPage, String search, String searchmethod) {
		// 검색어, 검색방법
		anonyBoardMapper mapper = sqlsession.getMapper(anonyBoardMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		// mybatis가 기능을 지원하는 것. 자동으로 넣어짐

		HashMap<String, Object> xMap = new HashMap<String, Object>();
		xMap.put("search", search);
		xMap.put("searchmethod", searchmethod);
		ArrayList<anonyBoard> alist = mapper.view(xMap, rb);
		// rb만 있는 건 파라메터가 없는 상태다(mybatis가 처리하는 것이라서)

		return alist;
	}

	public int write(anonyBoard board) {
		anonyBoardMapper mapper = sqlsession.getMapper(anonyBoardMapper.class);
		int result = mapper.write(board);
		return result;
		// TODO Auto-generated method stub

	}

	public anonyBoard writeview(int num) {
		// TODO Auto-generated method stub
		anonyBoardMapper mapper = sqlsession.getMapper(anonyBoardMapper.class);

		return mapper.writeview(num);
	}

	public int listall(String search, String searchmethod) { // 전체 글 갯수 불러오기
		// TODO Auto-generated method stub
		anonyBoardMapper mapper = sqlsession.getMapper(anonyBoardMapper.class);
		HashMap<String, Object> xMap = new HashMap<String, Object>();
		xMap.put("search", search);
		xMap.put("searchmethod", searchmethod);
		return mapper.listall(xMap);
	}

	public int delete(int num, String name) {
		anonyBoardMapper mapper = sqlsession.getMapper(anonyBoardMapper.class);
		int result = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("name", name);

		try {
			mapper.delete(map);
		} catch (Exception e) { // 에러시 1
			return result + 1;
		}

		return result;
	}

	public int modify(anonyBoard board) {
		anonyBoardMapper mapper = sqlsession.getMapper(anonyBoardMapper.class);
		int result = 0;
		try {
			mapper.modify(board);
		} catch (Exception e) {
			return result + 1;
		}

		return result;
	}

	public anonyBoard download(int num) {
		// TODO Auto-generated method stub
		anonyBoardMapper mapper = sqlsession.getMapper(anonyBoardMapper.class);
		return mapper.download(num);
	}


}
