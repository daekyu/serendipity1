package kr.co.serendipity;
import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Map;


import java.io.IOException;

import javax.activation.CommandMap;
import javax.imageio.ImageIO;


import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.imgscalr.Scalr;
import org.imgscalr.Scalr.Method;
import org.imgscalr.Scalr.Mode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ImageTestController {
	/*
	 * @RequestMapping(value="/web/test/test") public ModelAndView
	 * test(CommandMap commandMap, HttpServletRequest request) throws Exception{
	 * ModelAndView mv = new ModelAndView("/web/test/test"); Map<String,Object>
	 * map = commandMap.getMap(); return mv; }
	 */

	@RequestMapping(value = "imageCheck.htm")
	public @ResponseBody MultipartFile test(CommandMap commandMap, HttpServletRequest request, @RequestParam("upload_media") MultipartFile multipart) throws Exception {
		ModelAndView mv = new ModelAndView("image_test");
		System.out.println("1111111111"+multipart.getName());
		System.out.println("2222222222"+multipart.getOriginalFilename());
		String originImg = request.getSession().getServletContext().getRealPath("/img/go.jpg");
		String targetrImg = request.getSession().getServletContext().getRealPath("/img/ee.jpg");
		BufferedImage img = ImageIO.read(new File(originImg));
		BufferedImage bufferedImage = ImageIO.read(new File(originImg));

		System.out.println("#############" + img.getHeight());

		img = ImageIO.read(new File(originImg));
		Scalr.resize(bufferedImage, 500, 500);
		//Resize.resizing(img, 500, 500);
		Scalr.resize(bufferedImage, Method.QUALITY, Mode.AUTOMATIC, 500);
		ImageIO.write(bufferedImage, "jpg", new File(targetrImg));
		//ImageIO.write(img, "jpg", new File(targetrImg));
		return null;
	}

}