package com.middlepj.ict05;

import java.io.File;
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

import java.util.UUID;
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
	@RequestMapping("/image/upload")
	public Map<String, Object> uploadImage(@RequestParam("upload") MultipartFile uploadFile) throws IOException {
	    System.out.println("upload image");

	    Map<String, Object> result = new HashMap<>();

	    if (uploadFile.isEmpty()) {
	        result.put("uploaded", false);
	        result.put("error", Map.of("message", "파일이 비어있습니다."));
	        return result;
	    }

	    // 원래 파일 확장자 추출
	    String originalFilename = uploadFile.getOriginalFilename();
	    String extension = "";
	    if (originalFilename != null && originalFilename.contains(".")) {
	        extension = originalFilename.substring(originalFilename.lastIndexOf("."));
	    }

	    // UUID로 새로운 파일 이름 생성
	    String uuidFilename = UUID.randomUUID().toString() + extension;

	    // 업로드 폴더
	    File uploadDir = new File("D:/DEV05/workspace_spring_ict05/ict05_pj_1team/src/main/webapp/resources/uploads/");
	    if(!uploadDir.exists()) {
	        uploadDir.mkdirs();
	    }

	    String savePath = uploadDir.getAbsolutePath() + File.separator + uuidFilename;
	    uploadFile.transferTo(new File(savePath));

	    // 접근 가능한 URL
	    String fileUrl = "/resources/uploads/" + uuidFilename;

	    result.put("uploaded", true);
	    result.put("url", "http://localhost/ict05" + fileUrl);
	    
	    System.out.println(fileUrl);
	    
	    return result;
	}



}
