package member;

import java.util.ArrayList;

public class MemberDAO {
    private ArrayList<MemberDTO> members;

    public MemberDAO() {
        this.members = new ArrayList<>();

        MemberDTO member1 = new MemberDTO();
        member1.setMid("teemo");
        member1.setPassword("1234");
        member1.setName("작은티모");
        members.add(member1);

        MemberDTO member2 = new MemberDTO();
        member2.setMid("ari");
        member2.setPassword("15315");
        member2.setName("김아리");
        members.add(member2);

        MemberDTO member3 = new MemberDTO();
        member3.setMid("amumu");
        member3.setPassword("13531");
        member3.setName("아무무");
        members.add(member3);
    }

    public boolean insert(MemberDTO memberDTO) {
        System.out.println("회원가입 시도: " + memberDTO.getMid());
        boolean result = members.add(memberDTO);
        System.out.println("회원가입 성공 여부: " + result);
        return result;
    }

    public ArrayList<MemberDTO> selectAll() {
        System.out.println("전체 회원 목록 조회");
        ArrayList<MemberDTO> memberList = new ArrayList<>();
        for (MemberDTO member : members) {
            MemberDTO newMember = new MemberDTO();
            newMember.setMid(member.getMid());
            newMember.setPassword(member.getPassword());
            newMember.setName(member.getName());
            memberList.add(newMember);
        }
        return memberList;
    }

    public MemberDTO selectOne(MemberDTO memberDTO) {
        System.out.println("selectOne 호출");
        System.out.println("조건: " + memberDTO.getCondition());
        System.out.println("아이디: " + memberDTO.getMid());

        if (memberDTO.getMid() == null) {
            System.out.println("memberDTO.getMid()가 null입니다.");
        }

        for (MemberDTO member : members) {
            System.out.println("멤버 아이디: " + member.getMid());
            System.out.println("멤버 비밀번호: " + member.getPassword());

            if ("CHECKID".equals(memberDTO.getCondition())) {
                if (member.getMid().equals(memberDTO.getMid())) {
                    System.out.println("아이디 중복 확인");
                    return member;
                }
            } else if ("LOGIN".equals(memberDTO.getCondition())) {
                if (member.getMid().equals(memberDTO.getMid()) && member.getPassword().equals(memberDTO.getPassword())) {
                    System.out.println("로그인 성공");
                    return member;
                }
            }
        }
        System.out.println("조건에 맞는 회원 없음");
        return null;
    }
}
