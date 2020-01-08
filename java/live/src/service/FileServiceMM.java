package service;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.Forward;
import bean.Product;
import dao.MemberDao;
import dao.ProductDao;

public class FileServiceMM {
	HttpServletRequest request;
	HttpServletResponse response;
	Forward fw = null;
	
	
	public FileServiceMM(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}
	
	public Forward executefirst() {
		HttpSession session = request.getSession();
		// db sq번호 얻기
		//db에 넣기 
		ProductDao pDao = new ProductDao();
		int reginum = pDao.registerSQ();
		String id = (String)session.getAttribute("id");
		
		
		String uploadPath = "C:/liveproject/java/live/WebContent/img/mainhouse/";
		int size = 10 * 1024 * 1024; // 10Mb까지
		String housetype = null;
		String attendance = null;
		String address = null;
		String addressDetail = null;

		String sysfileName = null;// upload폴더(서버)에 저장된 파일이름
		String orifileName = null;// 원래 파일 이름

		File forder = new File(uploadPath);
		if (!forder.exists()) {
			forder.mkdir();
			System.out.println("폴더가 생성됌");
		}

		try {

			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",
					new DefaultFileRenamePolicy());

			housetype = multi.getParameter("housetype");
			attendance = multi.getParameter("attendanceNum");
			address = multi.getParameter("address");
			addressDetail = multi.getParameter("addressDetail");
			orifileName = multi.getOriginalFileName("mainpic");
			sysfileName = multi.getFilesystemName("mainpic");
			// 응닫페이지 출력

			System.out.println("housetype : " + housetype);
			System.out.println("attendance : " + attendance);
			System.out.println("address" + address);
			System.out.println("addressDetail : " + addressDetail);
			System.out.println("orifileName : " + orifileName);
			System.out.println("sysfileName : " + sysfileName);

			System.out.println("uploadPath : " + uploadPath);

			request.setAttribute("housetype", housetype);
			request.setAttribute("attendance", attendance);
			request.setAttribute("address", address);
			request.setAttribute("addressDetail", addressDetail);
			request.setAttribute("orifileName", orifileName);
			request.setAttribute("sysfileName", sysfileName);
			request.setAttribute("reginum", reginum);
			
			

			int i = -1;
			i = sysfileName.lastIndexOf("."); // 파일 확장자 위치
			String realFileName = id+reginum+"_" + sysfileName.substring(i, sysfileName.length()); // 현재시간과 확장자 합치기

			File oldFile = new File(uploadPath + sysfileName);
			File newFile = new File(uploadPath + realFileName);

			System.out.println(realFileName);
			System.out.println(sysfileName);

			oldFile.renameTo(newFile); // 파일명 변경
			request.setAttribute("realFileName", uploadPath+realFileName);
			
		} catch (IOException e) {
			e.printStackTrace();
		}

		fw = new Forward();
		fw.setPath("./registHouseDetail.jsp");
		fw.setRedireact(false);
		return fw;

	}

	public Forward executesecond() throws IOException {
	
		HttpSession session = request.getSession();
		String picscollect = "";
		String reginum = request.getParameter("reginum");
		String id = (String)session.getAttribute("id");
		System.out.println("등록 번호 : " +reginum);
		System.out.println("id : " +id);		
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(request); // multipart로 전송되었는가를 체크
		if (isMultipart) { // multipart로 전송 되었을 경우
			File temporaryDir = new File("c:/tmp/"); // 업로드 된 파일의 임시 저장 폴더를 설정
			
			String realDir = "C:/liveproject/java/live/WebContent/img/detailhouse/";
			// tmp의 폴더의 전송된 파일을 upload 폴더로 카피 한다.
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(1 * 1024 * 1024); // 1메가가 넘지 않으면 메모리에서 바로 사용
			factory.setRepository(temporaryDir); // 1메가 이상이면 temporaryDir 경로 폴더로 이동
			// 실제 구현단계 아님 설정단계였음
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(10 * 1024 * 1024);
			// 최대 파일 크기(10M)
			List<FileItem> items;
			
			
			try {
				items = upload.parseRequest(request);
				Iterator iter = items.iterator(); // Iterator 사용
				while (iter.hasNext()) {
					FileItem fileItem = (FileItem) iter.next(); // 파일을 가져온다

					if (fileItem.isFormField()) { // 업로드도니 파일이 text형태인지 다른 형태인지 체크
													// text형태면 if문에 걸림
						try {
							System.out.println(
									"폼 파라미터: " + fileItem.getFieldName() + "=" + fileItem.getString("UTF-8"));
							request.setAttribute(fileItem.getFieldName(), fileItem.getString("UTF-8"));            // 제일 중요 <= 침대 욕조 수 등 갯수 정리
						} catch (UnsupportedEncodingException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					} else { // 파일이면 이부분의 루틴을 탄다
						if (fileItem.getSize() > 0) { // 파일이 업로드 되었나 안되었나 체크 size>0이면 업로드 성공
							String fieldName = fileItem.getFieldName();
							String fileName = fileItem.getName();
							String contentType = fileItem.getContentType();
							boolean isInMemory = fileItem.isInMemory();
							long sizeInBytes = fileItem.getSize();
							//System.out.println("파일 [fieldName] : " + fieldName + "<br/>");
							System.out.println("파일 [fileName] : " + fileName + "<br/>");
							//System.out.println("파일 [contentType] : " + contentType + "<br/>");
							//System.out.println("파일 [isInMemory] : " + isInMemory + "<br/>");
							//System.out.println("파일 [sizeInBytes] : " + sizeInBytes + "<br/>");
							
							
							File uploadedFile = new File(realDir, "h1_"+fileName); // 실제 디렉토리에 fileName으로 카피 된다.   // 파일 이름 변경
							
							picscollect+=realDir+id+reginum+"_"+fileName+",";
							
							try {
								fileItem.write(uploadedFile);
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							fileItem.delete(); // 카피 완료후 temp폴더의 temp파일을 제거
						}
					}
				}
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // 실제 업로드 부분(이부분에서 파일이 생성된다)

			
		} else {
			System.out.println("인코딩 타입이 multipart/form-data 가 아님.");
		}

		
		System.out.println(picscollect);
		request.setAttribute("picscollect", picscollect);            // 제일 중요 <= 침대 욕조 수 등 갯수 정리
		
		fw = new Forward();
		fw.setPath("./registHousechdate.jsp");
		fw.setRedireact(false);
		return fw;

	}
	
	public Forward registHousechdate() {  // 정보만 requset에 담기
		
		HttpSession session = request.getSession();
		String reginum = request.getParameter("reginum");
		String id = (String)session.getAttribute("id");
		System.out.println("등록 번호 : " +reginum);
		System.out.println("id : " +id);	
		
		
		String mindate = request.getParameter("mindate");
		String maxdate = request.getParameter("maxdate");
		int oneprice = Integer.parseInt(request.getParameter("oneprice"));
		
		String housetype = request.getParameter("housetype");
		String attendance = request.getParameter("attendance");
		String address = request.getParameter("address");
		String addressDetail = request.getParameter("addressDetail");
		String realFileName = request.getParameter("realFileName");
		
		String parkarea = request.getParameter("parkarea");
		String roomscnt = request.getParameter("roomscnt");
		String bathcnt = request.getParameter("bathcnt");
		String bedcnt = request.getParameter("bedcnt");
		String toiletcnt = request.getParameter("toiletcnt");
		String picscollect = request.getParameter("picscollect");
		
		
		System.out.println("넘어온 값 확인 ");
		System.out.println("첫날 : "+mindate);
		System.out.println("막날 : "+maxdate);
		System.out.println("1박가격 : "+oneprice);
		

		System.out.println("reginum : "+reginum);
		
		
		
		
		// 넘어 오는 거 확인
		System.out.println("넘어 오는 모든 값 확인");

//		String housetype = (String)request.getAttribute("housetype");
//		String attendance = (String)request.getAttribute("attendance");
//		String address = (String)request.getAttribute("address");
//		String addressDetail = (String)request.getAttribute("addressDetail");
//		String realFileName = (String)request.getAttribute("realFileName"); // 다시 하기
//		
//		String parkarea = (String)request.getAttribute("parkarea"); // 다시 하기
//		String roomscnt = (String)request.getAttribute("roomscnt"); // 다시 하기
//		String bathcnt = (String)request.getAttribute("bathcnt"); // 다시 하기
//		String bedcnt = (String)request.getAttribute("bedcnt"); // 다시 하기
//		String toiletcnt = (String)request.getAttribute("toiletcnt"); // 다시 하기
//		String picscollect = (String)request.getAttribute("picscollect"); // 다시 하기
		
		// mindate maxdate oneprice  // 저장되 있음
		
		System.out.println("housetype : " + housetype);
		System.out.println("attendance : " + attendance);
		System.out.println("address : " + address);
		System.out.println("addressDetail : " + addressDetail);
		System.out.println("realFileName : " + realFileName);
		
		System.out.println("parkarea : " + parkarea);
		System.out.println("roomscnt : " + roomscnt);
		System.out.println("bathcnt : " + bathcnt);
		System.out.println("bedcnt : " + bedcnt);
		System.out.println("toiletcnt : " + toiletcnt);
		System.out.println("picscollect : " + picscollect);
		
		System.out.println("첫날 : "+mindate);
		System.out.println("막날 : "+maxdate);
		System.out.println("1박가격 : "+oneprice);
		
		//db에 넣기 
		//Product pDao = new Product();
		//result = pDao.registerHouse(housetype, attendance, address, addressDetail, realFileName, parkarea, roomscnt, bathcnt, bedcnt, toiletcnt, picscollect, mindate, maxdate, oneprice);
		
		//
		fw = new Forward();
		fw.setPath("./main.jsp");
		fw.setRedireact(false);
		return fw;
		
		
	}

}
