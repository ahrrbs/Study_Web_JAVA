package com.hanul.study;

import java.net.URL;

import net.htmlparser.jericho.Source;



public class GjBusDAO {
	//Jericho Html Parser : jericho-html-3.4.jar > WebContent > WEB-INF > lib
	public String makeJson() {
		String json = "";
		try {
			String addr = "http://api.gwangju.go.kr/json/lineInfo";
			URL url = new URL(addr);
			Source source = new Source(url);
			json += source.toString();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("makeJson 예외!!!!!!!!!!!");
		}
		return json;
	}
	
	public String makeXml() {
	      String xml = "";
	      try {
	         String addr = "http://api.gwangju.go.kr/xml/lineInfo";
	         URL url = new URL(addr);
	         Source source = new Source(url);
	         xml = source.toString();
	      } catch (Exception e) {
	         e.printStackTrace();
	         System.out.println("makeJson() Exception!!!");
	      }//try
	      return xml;
	   }//makeXml
}
