package day0713;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.jdom2.Document;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UseURL {

	private String url;

	public Document createXml() throws IOException {
		Document doc = new Document();

		// 1. 문자열을 URL객체로 생성
		URL url = new URL("https://news-ex.jtbc.co.kr/v1/get/rss" + this.url);

		// 2. 서버와 연결
		URLConnection uc = url.openConnection();

		// 3. 서버에 스트림을 연결
		BufferedReader br = null;

		try {
			br = new BufferedReader(new InputStreamReader(uc.getInputStream()));

			String line = "";

			while ((line = br.readLine()) != null) {
				System.out.println(line);
			}

		} finally {
			if (br != null) {
				br.close();
			}
		}

		return doc;
	}

	public void outputXml(Document doc) throws IOException {
		XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());
		xOut.output(doc, System.out);
	}
}
