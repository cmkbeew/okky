package common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

public class FileUtil2 {
	// 파일 업로드
	public static String uploadFile(HttpServletRequest req, String directory) throws ServletException, IOException {
		Part part = req.getPart("file");

		String pHeader = part.getHeader("content-disposition");
		System.out.println("pHeader : " + pHeader);
		String[] arrPartHeader = pHeader.split("filename=");
		String orgFileName = arrPartHeader[1].trim().replace("\"", "");

		if(!orgFileName.isEmpty()) {
			part.write(directory + File.separator + orgFileName);
		}

		return orgFileName;
	}

	// 파일명 변경
	public static String renameFile(HttpServletRequest req, String directory, String fileName) {
		//HttpServletRequest request;
		HttpSession session = req.getSession();
		String memberId = session.getAttribute("memberId") == null ? "" : session.getAttribute("memberId").toString();
		String ext = fileName.substring(fileName.lastIndexOf("."));
		String now = new SimpleDateFormat("yyyyMMdd_Hms").format(new Date());
		String newFileName = memberId+"_resume"+ ext;

		File oldFile = new File(directory + File.separator + fileName);
		File newFile = new File(directory + File.separator + newFileName);
		oldFile.renameTo(newFile);

		return newFileName;
	}

	// 다중 파일 업로드
	public static ArrayList<String> uploadFile2(HttpServletRequest req, String directory) throws ServletException, IOException {
		ArrayList<String> listFiles = new ArrayList<>();

		Collection<Part> parts = req.getParts();
		for(Part part : parts) {
			if(!part.getName().equals("file")) {
				continue;
			}

			String partHeader = part.getHeader("content-disposition");
			System.out.println("partHeader = " + partHeader);

			String[] arrPartHeader = partHeader.split("filename=");
			String orgFileName = arrPartHeader[1].trim().replace("\"", "");
			System.out.println("orgFileName = " + orgFileName);
			if(!orgFileName.isEmpty()) {
				part.write(directory + File.separator + orgFileName);
			}

			listFiles.add(orgFileName);
		}

		return listFiles;
	}

	// 파일 다운로드
	public static void download(HttpServletRequest req, HttpServletResponse resp, String orgFileName, String saveFileName) {
		String saveDirectory = "D:\\java4\\jsp\\okkyFIle";

		try {

			// 파일을 찾아 입력 스트림 생성
			File file = new File(saveDirectory, saveFileName);
			InputStream is = new FileInputStream(file);

			// 한글 파일명 깨짐 방지
			String client = req.getHeader("User-Agent");
			if(client.indexOf("WOW64") != -1) {
				orgFileName = new String(orgFileName.getBytes("UTF-8"), "ISO-8859-1");
			} else {
				orgFileName = new String(orgFileName.getBytes("KSC5601"), "ISO-8859-1");
			}

			// 파일 다운로드용 응답 헤더 설정
			resp.reset();
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename=\"" + orgFileName + "\"");
			resp.setHeader("Content-Length", "" + file.length());

//			out.clear();

			// response 객체로부터 새로운 출력 스트림 생성
			OutputStream os = resp.getOutputStream();

			// 출력 스트림에 파일 내용 출력
			byte b[] = new byte[(int)file.length()];
			int readBuffer = 0;
			while((readBuffer = is.read(b)) > 0) {
				os.write(b, 0, readBuffer);
			}

			// 입/출력 스트림 close
			is.close();
			os.close();

		} catch(FileNotFoundException e) {
			System.out.println("다운로드 중 파일을 찾을 수 없음");
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println("다운로드 중 예외 발생");
			e.printStackTrace();
		}
	}

	// 파일 삭제
	public static void deleteFile(HttpServletRequest req, String fileName) {
		String saveDirectory = "C:\\HK\\JSP\\bbsModel2\\src\\main\\webapp\\Upload";

		File file = new File(saveDirectory + File.separator + fileName);
		if(file.exists()) {
			file.delete();
		}
	}
}
