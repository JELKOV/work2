package calc;

public class Calc {
	private int res;

	public Calc(int num1,int num2,String op) {
		if(op.equals("+")) {
			this.res=num1+num2;
		}
		else if(op.equals("-")) {
			this.res=num1-num2;
		}
		else {
			this.res=num1*num2;
		}
	}
	
	public int getRes() {
		return res;
	}
	public void setRes(int res) {
		this.res = res;
	}	
}
