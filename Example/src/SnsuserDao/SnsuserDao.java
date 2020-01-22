package SnsuserDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import SnsuserDto.SnsuserDto;
import test.util.DbcpBean;

public class SnsuserDao {
	private static SnsuserDao dao;
	private SnsuserDao(){};
	public static SnsuserDao getInstance(){
		if(dao==null) {
			dao=new SnsuserDao();
		}
		return dao;
	};
	public SnsuserDto getData(String id) {
		SnsuserDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT *"
					+ " FROM snsuser"
					+ "	WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto.setProfile(rs.getString("profile"));
				dto.setEmail(rs.getString("email"));
				dto.setRegdate(rs.getString("regdate"));
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
		return dto;
	}
	//인자로 전달되는 UsersDto 에 담긴 정보가 유효한 정보인지 여부를 리턴해주는 메소드
	public boolean isValid(SnsuserDto dto) {
		boolean isValid=false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT * FROM snsuser"
					+ " WHERE id=? AND pwd=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			rs = pstmt.executeQuery();
			while (rs.next()) {//select 된 row 가 있으면
				//아이디, 비밀번호가 일치함으로 isValid=true 로 바꿔준다.
				isValid=true;
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
		return isValid;
	}
		
	public boolean setProfile(String id,String profile) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "UPDATE users"
					+ " SET profile=?"
					+ " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 하기
			pstmt.setString(1, id);
			pstmt.setString(2, profile);
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
	public List<SnsuserDto> getList(){
		List<SnsuserDto> list=new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT * FROM snsuser"
					+ " ORDER BY id ASC";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 

			rs = pstmt.executeQuery();
			while (rs.next()) {
				SnsuserDto dto=new SnsuserDto();
				dto.setId(rs.getString("id"));
				dto.setProfile(rs.getString("profile"));
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
		}return list;
	}
	public boolean insert(String id,String email,String pwd){
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO snsuser"
					+ "	(id,pwd,email,regdate)"
					+ " VALUES(?,?,?,SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			// ? 에 값 바인딩 하기
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setString(3, pwd);
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
