package world.festival.controller.utill;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.WebDriver;

import org.openqa.selenium.chrome.ChromeDriver;
 
public class SeleniumTest2 {
 
 
 
 
 
   public static void main(String[] args) throws InterruptedException {
 
 
 
 
 
       WebDriver driver=new ChromeDriver();
 
 
 
       driver.manage().window().maximize();
 
 
 
       driver.manage().timeouts().pageLoadTimeout(1, TimeUnit.SECONDS);
 
 
 
       driver.get("http://learn-automation.com/");
 
 
 
 
 
   }
 
 
 
}

