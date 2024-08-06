package test02;

import java.util.ArrayList;

public class DAO {
	private ArrayList<DTO> datas; // DB
	
	public DAO() {
		this.datas=new ArrayList<DTO>();
		
		DTO data1=new DTO();
		data1.setId("teemo");
		data1.setPassword("1234");
		this.datas.add(data1);
		DTO data2=new DTO();
		data2.setId("ari");
		data2.setPassword("333");
		this.datas.add(data2);
	}
	
	public DTO selectOne(DTO dto) {
		for(DTO data:this.datas) {
			if(data.getId().equals(dto.getId()) && data.getPassword().equals(dto.getPassword())) {
				return data;
			}
		}
		return null;
	}
}
