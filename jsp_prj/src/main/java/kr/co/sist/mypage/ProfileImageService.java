package kr.co.sist.mypage;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.sist.user.member.MemberDTO;

public class ProfileImageService {

	@SuppressWarnings("unchecked")
	public JSONObject uploadImg(HttpServletRequest request) throws IOException, ServletException {
		JSONObject jsonObj = new JSONObject();

		// 저장경로
		File saveDir = new File("C:/Users/user/git/jsp_prj/jsp_prj/src/main/webapp/upload/profile");

		// 최대 파일 크기(15Mbyte)
		int maxSize = 1024 * 1024 * 15;

		// 최대 파일 크기(50Mbyte)
		int uploadMaxSize = 1024 * 1024 * 50;

		MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(), uploadMaxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		File uploadFile = new File(saveDir.getAbsolutePath() + File.separator + mr.getFilesystemName("upProfile"));

		// 업로드 허용 크기 체크
		if (uploadFile.length() > maxSize) {
			jsonObj.put("result", false);
			jsonObj.put("result_msg", "파일의 크기가 15Mbyte를 초과할 수 없습니다.");

			uploadFile.delete();

			return jsonObj;
		}

		// 업로드된 파일의 이름 변경
		StringBuilder fileName = new StringBuilder(uploadFile.getName());
		String rename = UUID.randomUUID().toString().replaceAll("-", "");

		fileName.delete(0, fileName.lastIndexOf("."));
		fileName.insert(0, rename);

		File renameFile = new File(uploadFile.getParent() + File.separator + fileName);

		uploadFile.renameTo(renameFile);

		MypageService mps = new MypageService();

		HttpSession session = request.getSession();
		MemberDTO mDTO = (MemberDTO) session.getAttribute("userInfo");

		boolean resultFlag = false;

		if (mDTO != null) { // 로그인이 되어있다면
			String id = mDTO.getId();

			resultFlag = mps.modifyProfile(id, fileName.toString()); // 아이디에 해당하는 프로필 이미지 변경
		}

		jsonObj.put("result", resultFlag);
		jsonObj.put("imgName", fileName.toString());

		return jsonObj;
	} // uploadImg

} // class
