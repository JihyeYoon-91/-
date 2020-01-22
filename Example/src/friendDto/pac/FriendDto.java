package friendDto.pac;
public class FriendDto {
	private int num;
	private String name;
	private String phNum;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhNum() {
		return phNum;
	}
	public void setPhNum(String phNum) {
		this.phNum = phNum;
	}
	public FriendDto(){}
	public FriendDto(String name, String phNum) {
		super();
		this.name = name;
		this.phNum = phNum;
	}
}
