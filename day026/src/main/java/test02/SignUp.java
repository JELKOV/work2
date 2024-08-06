package test02;

public class SignUp {
    private String id;
    private String res;

    // 등록된 사용자 목록 (배열로 시뮬레이션)
    private static final String[] registeredUsers = {"teemo", "ari", "jaeho"};

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRes() {
        return res;
    }

    public void setRes(String res) {
        this.res = res;
    }

    public void sign() {
        if (this.id == null || this.id.isEmpty()) {
        	this.id="";
        	this.res="";
            return;
        }

        boolean found = false;
        for (String registeredId : registeredUsers) {
            if (this.id.equals(registeredId)) {
                found = true;
                break;
            }
        }

        if (found) {
            this.res = "이미 있는 아이디 입니다.";
        } else {
            this.res = "이건 없어요 괜찮아요";
        }
    }
}
