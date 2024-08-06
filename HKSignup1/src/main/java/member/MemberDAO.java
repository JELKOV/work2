package member;

import java.util.ArrayList;

public class MemberDAO {
	private ArrayList<MemberDTO> datas;
	public MemberDAO() {
		this.datas=new ArrayList<MemberDTO>();
		MemberDTO data1=new MemberDTO();
		data1.setId("teemo");
		data1.setPassword("1234");
		this.datas.add(data1);
		MemberDTO data2=new MemberDTO();
		data2.setId("ari");
		data2.setPassword("333");
		this.datas.add(data2);
	}
	public boolean insert(MemberDTO memberDTO) { // 회원가입
		//회원가입 로직
		MemberDTO data =new MemberDTO(); //가입할회원데이터객체 생성;
		data.setId(memberDTO.getId()); //가입할 아이디 변경
		data.setPassword(memberDTO.getPassword()); //가입할 비밀번호 변경
		this.datas.add(data); //DB에 넣어줌
		return true;
	}
	public MemberDTO selectOne(MemberDTO memberDTO) {
		for(MemberDTO data:this.datas) {
			if(data.getId().equals(memberDTO.getId())) {
				return data;
			}
		}
		return null;
	}

}
