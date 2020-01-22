package imgDao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import imgDto.ImgDto;
import test.util.DbcpBean;

public class ImgDao {
	private static ImgDao dao;
	private ImgDao(){};
	public static ImgDao getInstance() {
		if(dao==null) {
			dao=new ImgDao();
		}
		return dao;
	};
	public List<ImgDto> getList(){
		List<ImgDto> list=new ArrayList<ImgDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT num,writer,content,likeCount,regdate"
					+ " FROM board_img"
					+ " ORDER BY num ASC";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 

			rs = pstmt.executeQuery();
			while (rs.next()) {
				ImgDto dto=new ImgDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setLikeCount(rs.getInt("likeCount"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				//connection pool 에 반납하기 
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return list;
	}
	public boolean insert(String writer,String content) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO board_img"
					+ " (num,writer,content,likeCount,regdate)"
					+ " VALUES(board_img_seq,?,?,0,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 하기
			pstmt.setString(1, writer);
			pstmt.setString(2, content);
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
		
	}
}
