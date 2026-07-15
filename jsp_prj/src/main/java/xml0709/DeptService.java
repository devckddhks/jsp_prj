package xml0709;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.jsp.JspWriter;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

/**
 * 조회한 결과를 사용하여 XML을 생성
 */
public class DeptService {

	private Document searchAllDept() {
		// 1. XML 문서 객체 생성
		Document xmlDoc = new Document();

		// 2. 최상위 부모노드 생성
		Element deptsNode = new Element("depts");

		// 3. 부모 노드를 XML 문서 객체에 추가.
		xmlDoc.addContent(deptsNode);

		// 4. 반복되는 자식 노드 <dept/>를 생성
		Element deptNode = null;
		Element deptnoNode = null;
		Element dnameNode = null;
		Element locNode = null;

		DeptDAO dDAO = DeptDAO.getInstance();

		try {
			// 데이터에 부가적인 정보 생성
			Element pupDateNode = new Element("pupDate");
			pupDateNode.setText(new SimpleDateFormat("yyyy-MM-dd EEEE hh:mm:ss").format(new Date()));

			Element resultNode = new Element("result");
			resultNode.setText(String.valueOf(false));

			// 부가적인 정보들을 최상위 부모노드에 추가
			deptsNode.addContent(pupDateNode);

			List<DeptDTO> list = dDAO.selectAllDept();

			resultNode.setText(String.valueOf(true));
			deptsNode.addContent(resultNode);

			for (DeptDTO dDTO : list) {
				// deptNode 생성
				deptNode = new Element("dept");
				deptnoNode = new Element("deptno");
				dnameNode = new Element("dname");
				locNode = new Element("loc");

				deptnoNode.setText(String.valueOf(dDTO.getDeptno()));
				dnameNode.setText(dDTO.getDname());
				locNode.setText(dDTO.getLoc());

				deptNode.addContent(deptnoNode);
				deptNode.addContent(dnameNode);
				deptNode.addContent(locNode);

				deptsNode.addContent(deptNode);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return xmlDoc;
	}

	public void consolePrint() throws IOException {
		XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());

		xOut.output(searchAllDept(), System.out);
	}

	public void createFile(String path) throws IOException {
		XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());

		FileOutputStream fos = new FileOutputStream(path);

		xOut.output(searchAllDept(), fos);

		if (fos != null) {
			fos.close();
		}

	}

	public void webBrowserPrint(JspWriter out) throws IOException {
		XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());

		xOut.output(searchAllDept(), out);
	}

}
