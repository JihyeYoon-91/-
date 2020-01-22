package friendDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import friendDto.pac.FriendDto;
import test.util.DbcpBean;

public class FriendDao {
	private static FriendDao dao;
	private FriendDao(){};
	public static FriendDao getInstance() {
		if(dao==null) {
			dao=new FriendDao();
		}
		return dao;
	}
	public List<FriendDto> getList(){
		List<FriendDto> list=new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT num,name,phNum"
					+ "	FROM friend"
					+ "	ORDER BY num ASC";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 

			rs = pstmt.executeQuery();
			while (rs.next()) {
				FriendDto dto=new FriendDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setPhNum(rs.getString("phNum"));
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
		}return list;
		
	}
	public boolean insert(FriendDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO friend"
					+ "	 (num , name , phNum)"
					+ "	VALUES(friend_seq.NEXTVAL,?,?)" ;
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 하기
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPhNum());
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
