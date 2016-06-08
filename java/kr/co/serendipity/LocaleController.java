package kr.co.serendipity;
import java.io.File;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Controller
public class LocaleController {
	
	LocaleResolver localeResolver= null;
	
	//setter injection
	@Autowired
	public void setLocaleResolver(LocaleResolver localeResolver){
		this.localeResolver = localeResolver;
	}
	
	
	@RequestMapping("/changeLocale.htm")
	public ModelAndView changeLocale(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
			//request parameter "locale"�뿉 �궗�슜�옄媛� �꽕�젙�븳 locale�쓣 媛�吏�怨� �삩�떎.(ex> en, ko)
			Locale locale = new Locale(request.getParameter("locale"));
			localeResolver.setLocale(request, response, locale);
			return new ModelAndView("index");
		}
	}