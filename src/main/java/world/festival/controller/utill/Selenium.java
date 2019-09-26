	package world.festival.controller.utill;
	
	import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
	
	import org.openqa.selenium.By;
	import org.openqa.selenium.WebDriver;
	import org.openqa.selenium.WebElement;
	import org.openqa.selenium.chrome.ChromeDriver;
	import org.openqa.selenium.chrome.ChromeOptions;
	import org.openqa.selenium.support.ui.WebDriverWait;

import world.festival.VO.ListVO;
	
	
	public class Selenium {
	
		public static void main(String[] args) {
			Selenium selTest = new Selenium();
			selTest.crawlingTest(null);
	
		}
	
		//WebDriver
		private WebDriver driver;
		private WebDriverWait wait;
		private WebElement webElement;
	
		//Properties
		public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
		public static final String WEB_DRIVER_PATH = "C:/Users/kita/Desktop/install/chromedriver_win32/chromedriver.exe";
	
		private String base_url;
	
		public Selenium() {
			super();
	
			//System Property SetUp
			System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
	
			//Driver SetUp
			ChromeOptions options = new ChromeOptions();
			options.setCapability("ignoreProtectedModeSettings", true);
			options.addArguments("headless");
			driver = new ChromeDriver(options);
	
			base_url = "https://www.google.com";
		}
	
	
		public ArrayList<String> crawlingTest(ListVO vo) {
			System.out.println("셀레니움 까지 도달하였나? "+vo);
			//	String myengso1;
			try {
				driver.get(base_url);
	
				webElement = driver.findElement(By.name("q")); // searchKeyword
				String searchKeyword = vo.getCountry();
				if(searchKeyword == ""||searchKeyword==null){
					searchKeyword=" ";
				}
				String searchKeyword2 = vo.getSurround_place();
				if(searchKeyword2 ==""||searchKeyword2==null){
					searchKeyword2 = " ";
				}
				String searchKeyword3 ="名所";
				webElement.sendKeys(searchKeyword+" "+searchKeyword2+" "+searchKeyword3);
	
				webElement = driver.findElement(By.name("btnK"));
				webElement.submit();
	
				Thread.sleep(1000);
				String a="";
				String b="";
				List <WebElement> list = driver.findElements(By.className("fzgNVd"));
				List <WebElement> list2 = driver.findElements(By.className("x34okf"));
				ArrayList<String> alist =  new ArrayList<String>();
				System.out.println("list 의 사이즈 즉 갯수 " + list.size());
				
				for (int i = 0; i < list.size(); i++) {
					a = list.get(i).getText();
					alist.add(a);
					b = list2.get(i).getAttribute("src");
					alist.add(b);
					
				}
	
				return alist;
	
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				driver.close();
			}
			return null;
	
		}
	
	}
	
	
