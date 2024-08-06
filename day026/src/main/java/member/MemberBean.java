package member;

import java.util.ArrayList;

public class MemberBean {
	// 사용자가 입력하는 아이디
	// 가능한지 여부
	// 비교대상 DB
	private String id;
	private String msg;
	private ArrayList<String> datas;
	public MemberBean() {
		// 기본 생성자"만" 웹에서 활용
		this.datas=new ArrayList<String>();
		this.datas.add("teemo");
		this.datas.add("ari");
		this.datas.add("ariii");
	}
	public void check() {
		if(this.id==null) {
			this.msg="";
			return;
		}
		// 사용자가 입력한 아이디값이
		// 중복이라면 msg == 중복
		// 중복아니면 msg == 중복아님
		if(this.datas.contains(this.id)) {
			this.msg = "중복이라서 사용불가능";
		}
		else {
			this.msg = "사용가능!";
		}
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public ArrayList<String> getDatas() {
		return datas;
	}
	public void setDatas(ArrayList<String> datas) {
		this.datas = datas;
	}
}
