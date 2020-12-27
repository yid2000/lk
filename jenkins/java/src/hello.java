/*
 Comment 1
*/
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

public class hello
{
  public static void main(String[] args) {
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();
    System.out.println("Hi, current time: " + dtf.format(now));
  }
}
