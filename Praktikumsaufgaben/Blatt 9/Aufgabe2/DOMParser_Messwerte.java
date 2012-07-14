package Aufgabe2;

import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.util.ArrayList;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class DOMParser_Messwerte {
	
	private static String zeitpunkt;
	private static ArrayList<Integer> messWerte;
	
	public static void main(String [] args){
		Document doc;
		messWerte= new ArrayList<Integer>();
		zeitpunkt = "abend";
		// Einlesen des XML Files
		doc = parseXMLFile("Messwerte.xml");
		getWerteByZeitpunkt(doc);
		int mittelwert = bildeSumme() / messWerte.size();
		
		System.out.println("==============\nMittelwert: " + mittelwert);
	}
	
	private static int bildeSumme() {
		int summe = 0;
		for(int i = 0; i < messWerte.size(); i++)
			summe+=messWerte.get(i);
		
		return summe;
	}

	public static void getWerteByZeitpunkt(Document doc){
		// speichert den Rootknoten
		Element root;
		root = doc.getDocumentElement();
				
		/* Erstellt eine Knotenliste aller Knoten die
		 * die den Tag <wert> haben.
		*/
		NodeList werte = root.getElementsByTagName("wert");
		
		// Über diese Liste wird iteriert
		for(int i = 0; werte != null && i < werte.getLength(); i++){
			
			/* Das aktuelle Knotenelement wird als Element gespeichert. 
			   Da es aus der NodeList kommt ist es vom Typ Node und muss
			   gecastet werden auf Element.
			*/
			Element wertEle = (Element) werte.item(i);
	
			// Wenn das <wert> Attribute hat
			if(wertEle.hasAttributes()){
				// lies den Wert den Atributes "gueltig" aus und speichere ihn in werteAttr
				String werteAttr = wertEle.getAttribute("gueltig");
				// wenn das Attribute dem gesuchten zeitpunkt entspricht
				if(werteAttr.equals(zeitpunkt)){
					int aktWert = Integer.valueOf(wertEle.getTextContent());
					// getTextContent() gibt den Wert zwischen dem tag <wert> aus.
					System.out.println(aktWert);
					messWerte.add(aktWert);
				}
				}
		}
	}
	
	public static Document parseXMLFile(String filepath){
		Document doc = null;
		// erstellt eine neue DocBuilderFactory
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		
		try {
			
			//Erstellt ein neues "Leeres" Dokument
			DocumentBuilder db = dbf.newDocumentBuilder();
			
			//parst das XML File unt erhält ein DOM  Dokument
			doc = db.parse(filepath);
			

		}catch(ParserConfigurationException pce) {
			pce.printStackTrace();
		}catch(SAXException se) {
			se.printStackTrace();
		}catch(IOException ioe) {
			ioe.printStackTrace();
		}
		return doc;
	}
}

