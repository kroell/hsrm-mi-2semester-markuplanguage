package Aufgabe1;

import java.util.ArrayList;

import org.xml.sax.helpers.*;
import org.xml.sax.*;

public class MeinHandler implements ContentHandler {
	private String startTag;
	private String werteBereich, actAttribute;
	private ArrayList<Integer> werte = new ArrayList<Integer>();

	public MeinHandler(String s) {
		this.werteBereich = s;
	}

	@Override
	public void characters(char[] ch, int start, int length)
			throws SAXException {

		if (startTag.equalsIgnoreCase("wert")
				&& werteBereich.equalsIgnoreCase(actAttribute)) {
			Integer wert = Integer.valueOf(new String(ch, start, length));
			startTag = "";
			actAttribute = "";
			werte.add(wert);
		}

	}

	@Override
	public void endDocument() throws SAXException {
		int summe = 0;
		for (int i = 0; i < werte.size(); i++) {

			summe += werte.get(i);
		}
		
		System.out.println("Summme: " +summe);
		int mittelwert = summe / (werte.size());
		System.out.println("Der Mittelwert von: " + werteBereich);
		System.out.println(mittelwert);

	}

	@Override
	public void startElement(String namespaceURI, String localName,
			String qualifiedName, Attributes attrs) throws SAXException {

		startTag = localName;
		if (attrs != null) {
			actAttribute = attrs.getValue(0);
		}
	}

	@Override
	public void startPrefixMapping(String prefix, String uri)
			throws SAXException {
		// TODO Auto-generated method stub

	}

	@Override
	public void endElement(String uri, String localName, String qName) {
	}

	@Override
	public void endPrefixMapping(String prefix) throws SAXException {
	}

	@Override
	public void ignorableWhitespace(char[] ch, int start, int length)
			throws SAXException {
	}

	@Override
	public void processingInstruction(String target, String data)
			throws SAXException {
	}

	@Override
	public void setDocumentLocator(Locator locator) {
	}

	@Override
	public void skippedEntity(String name) throws SAXException {
	}

	@Override
	public void startDocument() throws SAXException {
	}

}