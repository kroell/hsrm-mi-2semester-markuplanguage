package Aufgabe1;

import org.xml.sax.*;
import org.xml.sax.helpers.*;


public class MiniSax {

	public static void main(String[] args) throws SAXException{
		System.out.println("Bitte wählen:  morgen --- mittag --- abend");
		String werteBereich = In.readString();
		
		XMLReader reader = XMLReaderFactory.createXMLReader();
		reader.setContentHandler(new MeinHandler(werteBereich));
		
		try{
			reader.parse("messwerte.xml");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
