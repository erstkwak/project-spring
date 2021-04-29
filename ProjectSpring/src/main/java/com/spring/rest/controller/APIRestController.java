package com.spring.rest.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.rest.vo.Address;
import com.spring.rest.vo.WeatherVo;

//@RestController : @Controller + @ResponseBody
@RestController
@RequestMapping("/camp")
public class APIRestController {
	
	//캠핑 위치 검색 목록 가져오기
	@RequestMapping(value="/searchText" ,  produces = "application/text; charset=utf8")
	public String searchText(HttpServletRequest req, HttpServletResponse response, Address address) {
		
		String currentPage = address.getCurrentPage();
		String countPerPage = address.getCountPerPage();
		String confmKey = "URJtlVsos5Nv8BPYVPiJkUojyx2HlZrzmQppph7RiChID%2FFOCBs4p2BBVD%2F6ghv%2BEMzWBR%2B7dSVuLaukK5w9Yg%3D%3D";
		String keyword = address.getKeyword();
		
		StringBuffer sb = null;
		BufferedReader br = null;
		String apiUrl = "";
		try {
			if(keyword == null || keyword== "") {
				apiUrl = "http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList?MobileOS=ETC&MobileApp=AppTest&_type=json&pageNo=" + currentPage
						+ "&numOfRows=" + countPerPage +"&ServiceKey=" + confmKey;
			} else {
				apiUrl = "http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/searchList?MobileOS=ETC&MobileApp=AppTest&_type=json&pageNo=" + currentPage
						+ "&numOfRows=" + countPerPage + "&ServiceKey=" + confmKey +"&keyword=" + URLEncoder.encode(keyword, "UTF-8");
			}
			
			URL url = new URL(apiUrl);
			br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			sb = new StringBuffer();
			String tempStr = null;

			while (true) {
				tempStr = br.readLine();
				if (tempStr == null)
					break;
				sb.append(tempStr);
			}
		} catch (Exception e) {
		}finally {
		}
		return sb.toString();
	}
	
	//캠핑 날씨 가져오기
	@RequestMapping(value="/weather", produces = "application/text;", method = RequestMethod.GET)
	public String weather(HttpServletRequest req, HttpServletResponse response, WeatherVo weatherVo) {
		System.out.println("apiRestController");
		String appID = "65fd3083cf05e3a296f75d4695829012";
		String lat = weatherVo.getLAT();  
		String lon = weatherVo.getLNG();
		String mode = weatherVo.getMODE();
		String apiUrl = "";
		System.out.println(lat);
		System.out.println(lon);
		
		StringBuffer sb = null;
		BufferedReader br = null;
		
		//http://api.openweathermap.org/data/2.5/onecall?&lat="+lat+"&lon="+lon+"&appid="+appID+"&exclude="+mode+"&units=metric&lang=kr"
		//apiUrl = "http://api.openweathermap.org/data/2.5/forecast?lat="+lat+"&lon="+lon+"&appid="+appID+"&exclude="+mode+"&units=metric";
		apiUrl = "http://api.openweathermap.org/data/2.5/onecall?lat="+lat+"&lon="+lon+"&appid="+appID+"&exclude="+mode+"&units=metric";
		try {		
			URL url = new URL(apiUrl);
			br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			sb = new StringBuffer();
			String tempStr = null;

			while (true) {
				tempStr = br.readLine();
				if (tempStr == null)
					break;
				sb.append(tempStr);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return sb.toString();
	}
}
