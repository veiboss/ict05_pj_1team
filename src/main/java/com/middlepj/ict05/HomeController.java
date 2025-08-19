package com.middlepj.ict05;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.UUID;

import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}

	@RequestMapping("/sample/ckeditor")
	public String ckeditorAction() {

		return "sample/ckeditor";
	}


	@RequestMapping("/sample/ckeditorAction")
	public String ckeditorAction(HttpServletRequest request, HttpServletResponse response, Model model) {

		String title = request.getParameter("title");
		String editor = request.getParameter("editor");

		System.out.println("title: " + title);
		System.out.println("editor: " + editor);

		model.addAttribute("title", title);
		model.addAttribute("editor", editor);

		return "sample/ckeditorAction";
	}


	@ResponseBody
	@RequestMapping("/image/upload/normal")
	public Map<String, Object> uploadImage(MultipartHttpServletRequest request, HttpServletResponse response) throws IOException {
	    System.out.println("upload image");
	    
	    Map<String, Object> result = new HashMap<>();
	    MultipartFile file = request.getFile("upload");
	    
	    // 업로드 폴더 경로
	    String saveDir = "D:/DEV05/workspace_spring_ict05/ict05_pj_1team/src/main/webapp/resources/uploads/";
//	    String realDir = "D:/DEV05/workspace_spring_ict05/ict05_pj_1team/src/main/webapp/resources/uploads/";
	    
	    if(file != null && !file.isEmpty()) {
	    	FileInputStream fis = null;
	    	FileOutputStream fos = null;
	    	
	    	try {
	    		 // // 폴더 생성
	    		File uploadDir = new File(saveDir);
	    		if (!uploadDir.exists()) uploadDir.mkdirs();

	    		// UUID 파일명
	    		String originalFilename = file.getOriginalFilename();
	    		String extension = "";
	    		if (originalFilename != null && originalFilename.contains(".")) {
	    		    extension = originalFilename.substring(originalFilename.lastIndexOf("."));
	    		}
	    		String uuidFilename = UUID.randomUUID().toString() + extension;

	    		// 파일 저장
	    		File saveFile = new File(saveDir + uuidFilename);
	    		file.transferTo(saveFile);

	    		// CKEditor URL 반환
	    		String fileUrl = "/resources/uploads/" + uuidFilename;

	    		result.put("uploaded", true);
	    		result.put("url", request.getContextPath() + fileUrl);
	    	} finally {
	    		 if (fis != null) fis.close();
	             if (fos != null) fos.close();
	    	}
	    } else {
	    	result.put("uploaded", false);
	        result.put("error", Map.of("message", "파일이 비어있습니다."));
	    }
        return result;

	}
	
	
	@ResponseBody
	@RequestMapping("/image/upload")
	public Map<String, Object> uploadSftpImage(MultipartHttpServletRequest request, HttpServletResponse response) throws IOException {
	    Map<String, Object> result = new HashMap<>();
	    MultipartFile file = request.getFile("upload");

	    if (file != null && !file.isEmpty()) {
	        Session session = null;
	        ChannelSftp channelSftp = null;

	        try {
	            // JSch 객체 생성
	            JSch jsch = new JSch();
	            
	            // 세션 연결 (호스트, 포트, 사용자)
	            session = jsch.getSession("ict05", "ict05.wwwbiz.kr", 22);
	            session.setPassword("admin*1472");

	            // 보안 설정 (호스트 키 체크 무시)
	            java.util.Properties config = new java.util.Properties();
	            config.put("StrictHostKeyChecking", "no");
	            session.setConfig(config);

	            session.connect();

	            // 채널 오픈
	            channelSftp = (ChannelSftp) session.openChannel("sftp");
	            channelSftp.connect();

	            // 파일명 생성
	            String originalFilename = file.getOriginalFilename();
	            String extension = "";
	            if (originalFilename != null && originalFilename.contains(".")) {
	                extension = originalFilename.substring(originalFilename.lastIndexOf("."));
	            }
	            String uuidFilename = UUID.randomUUID().toString() + extension;

	            String remoteDir = "/httpdocs/";
	            channelSftp.cd(remoteDir);

	            // 업로드 실행
	            channelSftp.put(file.getInputStream(), uuidFilename);

	            // 업로드 성공 시 URL 반환
	            String fileUrl = "http://ict05.wwwbiz.kr/" + uuidFilename;
	            result.put("uploaded", true);
	            result.put("url", fileUrl);

	        } catch (Exception e) {
	            e.printStackTrace();
	            result.put("uploaded", false);
	            result.put("error", Map.of("message", e.getMessage()));
	        } finally {
	            if (channelSftp != null && channelSftp.isConnected()) channelSftp.disconnect();
	            if (session != null && session.isConnected()) session.disconnect();
	        }

	    } else {
	        result.put("uploaded", false);
	        result.put("error", Map.of("message", "파일이 비어있습니다."));
	    }

	    return result;
	}

}
