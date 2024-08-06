package calc;
//Bean
//:객체, 기능을 가진 객체, 모듈, 컴포넌트
public class CalcBean {
	private int num1;
	private int num2;
	private String op;
	private int res;
	public int getNum1() {
		return num1;
	}
	public void setNum1(int num1) {
		this.num1 = num1;
	}
	public int getNum2() {
		return num2;
	}
	public void setNum2(int num2) {
		this.num2 = num2;
	}
	public String getOp() {
		return op;
	}
	public void setOp(String op) {
		this.op = op;
	}
	public int getRes() {
		return res;
	}
	public void setRes(int res) {
		this.res = res;
	}
	
	//Bean은 외부로부터 값을 받거나, 주는 일이 적음
	public void calc() {
		if(this.op == null) {
			// 처음 돌린 상황
			this.res=0;
			return;
		}
		
		if(this.op.equals("+")){
			this.res=this.num1+this.num2;
		}
		else if(this.op.equals("-")){
			this.res=this.num1-this.num2;
		}
		else{
			this.res=this.num1*this.num2;
		}
	}
	

}
