package member;

import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
    private List<MemberDTO> datas;

    public MemberDAO() {
        this.datas = new ArrayList<>();
        initializeMembers();
    }

    private void initializeMembers() {
        MemberDTO data1 = new MemberDTO();
        data1.setId("teemo");
        data1.setPassword("1234");
        this.datas.add(data1);

        MemberDTO data2 = new MemberDTO();
        data2.setId("ari");
        data2.setPassword("333");
        this.datas.add(data2);
    }

    public synchronized MemberDTO selectOne(MemberDTO memberDTO) {
    	System.out.println("MemberDTO selectOne 시작로그");
        for (MemberDTO data : this.datas) {
            if (data.getId().equals(memberDTO.getId())) {
            	System.out.println("MemberDTO selectOne 실패로그");
                return data;
            }
        }
        System.out.println("MemberDTO selectOne 성공로그");
        return null;
    }

    public boolean insert(MemberDTO memberDTO) { // 회원가입
    	//회원가입 로직
    	System.out.println("MemberDTO insert 시작로그");
        MemberDTO data =new MemberDTO(); //가입할회원데이터객체 생성;
        data.setId(memberDTO.getId()); //가입할 아이디 변경
        data.setPassword(memberDTO.getPassword()); //가입할 비밀번호 변경
        this.datas.add(data); //DB에 넣어줌
        System.out.println("MemberDTO insert 종료로그");
        return true;
    }
}
