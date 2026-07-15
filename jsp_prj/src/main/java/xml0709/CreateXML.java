package xml0709;

import java.io.FileOutputStream;
import java.io.IOException;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

public class CreateXML {

	public static void main(String[] args) {
		// JDOM Parser를 사용한 XML 문서 생성.
		// 1. XML 문서를 저장할 수 있는 문서 객체 생성.
		Document xmlDoc = new Document(); // <?xml version="1.0" encoding="UTF-8"?>

		// 2. 최상위 부모노드
		Element rootNode = new Element("depts");

		// 3. XML 문서 객체에 부모 노드를 추가
		xmlDoc.addContent(rootNode);

		// 4. 자식 노드를 생성
		Element messageNode = new Element("message");
		Element messageNode2 = new Element("message");

		// 5. 자식 노드에 값 설정
		messageNode.addContent("안녕하세요~");
		messageNode2.addContent("안녕히가세요~");

		// 6. 자식 노드를 부모노드에 추가
		rootNode.addContent(messageNode);
		rootNode.addContent(messageNode2);

		// 7. 생성된 XML 문서 객체를 출력
//		XMLOutputter xOut = new XMLOutputter(Format.getRawFormat()); // 한 줄로 출력
//		XMLOutputter xOut = new XMLOutputter(Format.getRawFormat()); // 한 줄로 출력
		XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());

		try {
			xOut.output(xmlDoc, System.out);

			FileOutputStream fos = new FileOutputStream(
					"C:/Users/user/git/jsp_prj/jsp_prj/src/main/webapp/xml0709/hello2.xml");

			if (fos != null) {
				fos.close();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
