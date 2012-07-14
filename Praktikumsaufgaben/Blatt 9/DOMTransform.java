

import javax.xml.parsers.*;
import org.w3c.dom.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.*;
import javax.xml.transform.stream.*;

public class DOMTransform {
  public static void main(String[] args) {
    try {
     DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
     DocumentBuilder docBuilder = factory.newDocumentBuilder();
    

     Document doc = docBuilder.parse("file:Buch.xml");

     TransformerFactory tf = TransformerFactory.newInstance();
     Transformer trans = tf.newTransformer(
  			new StreamSource("file:Buch.xsl"));

     Source input  = new DOMSource(doc);
     Result output = new StreamResult(System.out);
     trans.transform(input,output);
    } catch (Exception e) {  e.printStackTrace(); }
  }
}