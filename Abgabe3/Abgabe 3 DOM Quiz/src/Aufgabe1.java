import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Text;

/**
 * Programm zum Einlesen und Auswerten einer XML Datei mit Fragenkatalog. Die
 * Datei und das Themengebiet des Fragenkatalogs wird mit Hilfe der
 * Kommandozeile eingelesen und fünf zufällige Fragen dieses Gebiets ausgegeben.
 * Im Anschluss hat der Nutzer die Möglichkeit die Frage zu beantworten, welche
 * dann als richtig oder falsch identifiziert wird. Am Ende wird eine
 * Zusammenfassung der richtigen Antworten ausgegeben.
 * 
 * @author Mareike Schulz, Nicole Emmel, Soeren Kroell
 * @version FINAL 17.06.2011
 * 
 */
public class Aufgabe1 {

	private static HashMap<Integer, HashMap<String, Boolean>> meinQuiz = new HashMap<Integer, HashMap<String, Boolean>>();

	/**
	 * Methode zum 
	 * - Einlesen einer Datei und eines Themengebiets über die Kommandozeile 
	 * - Eingrenzen der Fragen auf das ausgewählte Themengebiet 
	 * - Aufruf der Methode zufallsZahlBerechnen zum Erstellen einer Zufallszahl zum Finden von 5 Zufallsfragen 
	 * - Aufruf der Methode findeAntworten zum Finden der Antworten des ausgewählten Themengebiets
	 * 
	 * @param args: Zum Einlesen eines Dateipfades und Themengebiets
	 */
	public static void main(String[] args) {

		int[] zufallsFragenIndex = new int[5];
		char buchstabe = 'a';
		int richtigeAntwortenZaehler = 0;
		String richtigeAntwort = null;
		String dateipfad = args [0];
		String themengebiet = args[1];
		ArrayList<Element> ausgewaehlteFragen = new ArrayList<Element>();
		String[] fuenfFragen = new String[5];

		BufferedReader eingabe = new BufferedReader(new InputStreamReader(System.in));
		String eingegebeneAntwort = null;

		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setNamespaceAware(true);

		System.out.println("*** Willkommen zu Wiesbaden sucht die Super-Pappnase ***\n");
		System.out.println("Der Pfad Ihrer Datei lautet: " + dateipfad + " und ihr Themengebiet ist: " + themengebiet + "\n");

		try {

			DocumentBuilder builder = factory.newDocumentBuilder();

			// Einlesen der Fragekatalog-Datei als Kommandozeilenparameter
			Document dokument = builder.parse(new File(dateipfad));

			// Alle Fragen in eine NodeList schreiben
			NodeList alleFragen = dokument.getElementsByTagName("frage");

			for (int i = 0; i < alleFragen.getLength(); i++) {

				Element aktuellerKnoten = (Element) alleFragen.item(i);
				String gebiet = aktuellerKnoten.getAttribute("gebiet");

				// Themengebiet bezogen auf die Auswahl eingrenzen
				if (gebiet.equals(themengebiet)) {
					ausgewaehlteFragen.add(aktuellerKnoten);
				}
			}

			zufallsFragenIndex = zufallsZahlBerechnen(ausgewaehlteFragen,zufallsFragenIndex);
			findeAntworten(buchstabe,ausgewaehlteFragen,zufallsFragenIndex,richtigeAntwort,eingegebeneAntwort,eingabe,richtigeAntwortenZaehler, fuenfFragen);
			erzeugeHTML(themengebiet,fuenfFragen);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * Erstellen von fünf Zufallszahlen basierend auf der Anzahl der
	 * ausgewählten Fragen des Themengebiets
	 * 
	 * @param ausgewaehlteFragen: ArrayList in dem die Fragen des ausgewählten Themengebiets gespeichert sind
	 * @return
	 */
	private static int[] zufallsZahlBerechnen(ArrayList ausgewaehlteFragen,int[] zufallsFragenIndex) {

		int j = 0;
		boolean schonVorhanden = false;

		// Da Array zufallsFragenIndex 5 Felder hat
		while (j < 5) {

			if (ausgewaehlteFragen != null) {

				// Zufallszahlen erstellen aus der Anzahl der Fragen
				int zufallsZahl = (int) (Math.random() * (ausgewaehlteFragen
						.size())) + 1;
				schonVorhanden = false;

				// Zum Verhindern, dass eine Zufallszahl und damit eine Frage doppelt vorkommt
				for (int i = 0; i < zufallsFragenIndex.length; i++) {
					if (zufallsFragenIndex[i] == zufallsZahl) {
						schonVorhanden = true;
					}
				}

				if (schonVorhanden == false) {
					zufallsFragenIndex[j] = zufallsZahl;
					j++;
				}
			}
		}

		return zufallsFragenIndex;
	}

	/**
	 * Methode zur 
	 * - Ausgabe der betroffenen Fragen und Antworten 
	 * - Finden der richtigen Antwort 
	 * - Eingabemöglichkeit über die Tastatur 
	 * - Vergleich der Eingabe mit den richtigen Antworten 
	 * - Ausgabe der Anzahl der richtigen Antworten
	 * 
	 * @param buchstabe: Hochzaehlen des Buchstabenindex der einzelnen Fragen
	 * @param ausgewaehlteFragen: Fragen des ausgewählten Themengebiets
	 * @param zufallsFragenIndex: Zufallszahlen zum Finden von 5 Fragen
	 * @param richtigeAntwort: Korrekte Antwort bezogen auf die jeweilige Frage
	 * @param eingegebeneAntwort: Getätigte Eingabe
	 * @param eingabe: Eingabemöglichkeit über die Tastatur
	 * @param richtigeAntwortenZaehler: Zum Hochzählen der richtigen Antworten
	 */
	private static void findeAntworten(char buchstabe,ArrayList<Element> ausgewaehlteFragen,int[] zufallsFragenIndex,String richtigeAntwort,String eingegebeneAntwort,BufferedReader eingabe,int richtigeAntwortenZaehler,String[] fuenfFragen) {

		// Zufallszahl verwenden und auf die Fragen des ausgewählten
		// Themengebietes anwenden
		for (int j = 0; j < zufallsFragenIndex.length; j++) {

			// zum Zwischenspeicher der Antworten
			HashMap<String, Boolean> antwortenTemp = new HashMap<String, Boolean>();

			String stringFragen;

			// die zufälligen fünf Fragen in ein Array schreiben
			stringFragen = ausgewaehlteFragen.get(zufallsFragenIndex[j] - 1).getElementsByTagName("fragetext").item(0).getTextContent();
			fuenfFragen[j] = stringFragen;

			// Ausgewählte Fragen ausgeben
			System.out.println("Frage: " + stringFragen);

			NodeList antwortMoeglichkeiten = ausgewaehlteFragen.get(zufallsFragenIndex[j] - 1).getElementsByTagName("antwortmoeglichkeiten");
			NodeList alleAntworten = antwortMoeglichkeiten.item(0).getChildNodes();

			for (int k = 0; k < alleAntworten.getLength(); k++) {
				Node aktuelleAntworten = alleAntworten.item(k);

				if (aktuelleAntworten.getNodeName().equals("antwort")) {

					String stringAntworten;

					// die passenden Antowrten in ein String schreiben undausgeben
					stringAntworten = aktuelleAntworten.getTextContent();
					System.out.println(buchstabe + ") " + stringAntworten);

					buchstabe++;

					boolean richtig = false;

					// Richtige Antwort finden
					Element neuerKnoten = (Element) alleAntworten.item(k);
					String korrekt = neuerKnoten.getAttribute("korrekt");

					// Richtige Antwort in String richtigeAntwort schreiben
					if (korrekt.equals("ja")) {
						richtigeAntwort = aktuelleAntworten.getTextContent();
						richtig = true;
					}
					antwortenTemp.put(stringAntworten, richtig);
				}
			}
			// die entsprechenden Antworten mit dem dazugehörigen Index in eine HashMap speichern
			meinQuiz.put(j, antwortenTemp);

			System.out.print("Ihre Antwort in Textform: ");

			// Eingabemöglichkeit einer Antwort
			try {
				eingegebeneAntwort = eingabe.readLine();
			} catch (IOException e) {
				e.printStackTrace();
			}

			// Antwort kontrollieren
			if (eingegebeneAntwort.equalsIgnoreCase(richtigeAntwort)) {
				System.out.println("Diese Antwort ist korrekt");
				richtigeAntwortenZaehler++;
			} else {
				System.out.println("Ihre Antwort ist falsch. Richtig wäre " + richtigeAntwort + " gewesen.");
			}

			System.out.println(" ");
			buchstabe = 'a';

		}
		try {
			eingabe.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		System.out.println("Danke für Ihre Teilnahme. Sie haben " + richtigeAntwortenZaehler + " von 5 Fragen richtig beantwortet.");
		System.out.println("Es wurde ein HTML Dokument mit den Fragen und Antworten erzeugt. Die richtige Antwort ist fett makiert.");
	}

	/**
	 * Methode zum Erzeugen eines HTML Dokuments mit folgendem Inhalt: 
	 * - Überschrift mit dem ausgewählten Themengebiet 
	 * - die ausgwählten fünf Fragen 
	 * - die dazugehörigen Antworten 
	 * - fett schreiben der richtigen Antwort
	 * 
	 * @param themengebiet: Variable die das ausgewählte Themengebiet beinhaltet
	 * @param fuenfFragen: String Array mit den zuvor erstellten 5 Fragen
	 */
	public static void erzeugeHTML(String themengebiet, String[] fuenfFragen) {

		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setNamespaceAware(true);

		try {
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document htmlDoc = builder.newDocument();

			// Erzeugen der Baumstruktur eines HTML Dokuments
			Element html = htmlDoc.createElement("html");
			Element head = htmlDoc.createElement("head");
			Element title = htmlDoc.createElement("title");
			Text headText = htmlDoc.createTextNode(themengebiet);
			Element body = htmlDoc.createElement("body");
			Element h1 = htmlDoc.createElement("h1");
			Text h1Text = htmlDoc.createTextNode("5 Fragen aus dem Themengebiet: " + themengebiet);

			htmlDoc.appendChild(html);
			html.appendChild(head);
			head.appendChild(title);
			html.appendChild(body);
			body.appendChild(h1);
			title.appendChild(headText);
			h1.appendChild(h1Text);

			// Durchlauf aller Fragen
			for (int i = 0; i < fuenfFragen.length; i++) {
				Element p = htmlDoc.createElement("p");
				body.appendChild(p);
				Text pText = htmlDoc.createTextNode(fuenfFragen[i]);
				p.appendChild(pText);

				Element ol = htmlDoc.createElement("ol");
				body.appendChild(ol);

				// Durchlauf aller Antworten
				for (String a : meinQuiz.get(i).keySet()) {
					Element li = htmlDoc.createElement("li");
					ol.appendChild(li);

					// Richtige Antwort fett makieren
					if (meinQuiz.get(i).get(a) == true) {
						Element strong = htmlDoc.createElement("strong");
						li.appendChild(strong);
						Text strongText = htmlDoc.createTextNode(a);
						strong.appendChild(strongText);
					}
					// Alle anderen Antworten auflisten
					else {
						Text liText = htmlDoc.createTextNode(a);
						li.appendChild(liText);
					}
				}
			}

			// Erzeugen eines HTML Dokument mit dem Titel des ausgwählten Themengebiets
			TransformerFactory tf = TransformerFactory.newInstance();
			File file = new File(themengebiet + ".html");
			Transformer trans = tf.newTransformer();
			Source input = new DOMSource(htmlDoc);
			Result output = new StreamResult(file);
			trans.transform(input, output);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
