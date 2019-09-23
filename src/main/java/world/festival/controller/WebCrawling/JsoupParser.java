package world.festival.controller.WebCrawling;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class JsoupParser {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String url = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=%EC%95%84%EC%8B%9C%EC%95%84%EC%B6%95%EC%A0%9C";
        Document doc = null;
         
        try {
            doc = Jsoup.connect(url).get();
        } catch (IOException e) {
            e.printStackTrace();
        }
         
        // 주요 뉴스로 나오는 태그를 찾아서 가져오도록 한다.
        Elements element = doc.select("div.scroll");
         
        // 1. 헤더 부분의 제목을 가져온다.
        String title = element.select("td").text();
 
        System.out.println("============================================================");
        System.out.println("n/"+title);
        System.out.println("============================================================");
         
        for(Element el : element.select("ul")) {    // 하위 뉴스 기사들을 for문 돌면서 출력
            System.out.println(el.text());
        }
         
        System.out.println("============================================================");
    }
}
 




