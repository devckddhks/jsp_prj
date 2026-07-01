package day0630;

import java.math.BigDecimal;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class AjaxService {

	@SuppressWarnings("unchecked")
	public String paramProcess(AjaxDTO aDTO) {
		// 1. JSONObject 생성
		JSONObject jsonObj = new JSONObject();

		// 2. 값 할당
		jsonObj.put("userName", aDTO.getNa());

		jsonObj.put("userAge", aDTO.getAge());
		jsonObj.put("userAddr", aDTO.getAddress());
		jsonObj.put("type", aDTO.getType());
		
		String [] data = {"Java SE", "Oracle DBMS", "JSBC", "HTML"};

		JSONArray jsonArr = new JSONArray();
		JSONObject jsonTemp = null;
		
		for(int i = 0; i < data.length; i++) {
			// 데이터가 존재하면 데이터를 저장하기 위해 JSONObject 생성
			jsonTemp = new JSONObject();
			
			// 생성된 JSONObject 값 할당
			jsonTemp.put("subject", data[i]);
			
			// 값을 가진 JSONObject을 JSONArray 할당
			jsonArr.add(jsonTemp);
		}
		
		// 모든 데이터를 가지고 있는 jsonArr를 JSONObject에 할당
		jsonObj.put("data", jsonArr);
		
		// 3. jsonObj 문자열을 반환
		return jsonObj.toJSONString();
	}
}
