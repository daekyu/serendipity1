package kr.co.serendipity;
import java.net.HttpCookie;
import java.net.HttpURLConnection;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.LocaleResolver;

@Controller
@RequestMapping("/locale/")
public class LocaleController {
	
	LocaleResolver localeResolver= null;
	
	//setter injection
	@Autowired
	public void setLocaleResolver(LocaleResolver localeResolver){
		this.localeResolver = localeResolver;
	}
	
	
	@RequestMapping("changeLocale.htm")
	public String changeLocale(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
			//request parameter "locale"�뿉 �궗�슜�옄媛� �꽕�젙�븳 locale�쓣 媛�吏�怨� �삩�떎.(ex> en, ko)
			Locale locale = new Locale(request.getParameter("locale"));
			localeResolver.setLocale(request, response, locale);
			session.setAttribute("locale", request.getParameter("locale"));
			System.out.println("1111" + request.getLocale().getLanguage());
			return "redirect:/index.htm";
		}
	}