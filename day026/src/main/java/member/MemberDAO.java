package member;

import java.util.ArrayList;

public class MemberDAO {
	private ArrayList<MemberDTO> datas;
	public MemberDAO() {
		this.datas=new ArrayList<MemberDTO>();
		MemberDTO data1=new MemberDTO();
		data1.setId("teemo");
		this.datas.add(data1);
		MemberDTO data2=new MemberDTO();
		data2.setId("ari");
		this.datas.add(data2);
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
