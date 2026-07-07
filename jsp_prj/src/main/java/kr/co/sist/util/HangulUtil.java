package kr.co.sist.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

public class HangulUtil {

	public static String decode(String hangul) {
		if (hangul == null || "".equals(hangul)) {
			return "";
		}

		String decode = "";

		try {
			decode = URLDecoder.decode(URLEncoder.encode(hangul, "8859_1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return decode;
	}

}
