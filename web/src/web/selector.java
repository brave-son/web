package web;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class selector {
	public static void main(String[] args) throws IOException {
		Document doc = Jsoup.connect("https://www.w3schools.com/css/default.asp").get();

		Elements els = doc.select("#leftmenuinnerinner > a > font > font");
		for (int i = 0; i < els.size(); i++) {
			Element el = els.get(i);
			String num = el.text();
			System.out.println(num);

		}

	}
}
