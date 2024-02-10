import com.coursevector.util.Convert;

class com.coursevector.samples.ExternalXML_AS2 {
	
	private var xmlData:Object = new Object();
	private var _local:MovieClip;
	
	public function ExternalXML_AS2(mc:MovieClip) {
		_local = mc;
		init();
	}
	
	private function init():Void {
		var t = this;
		var xmlTemp:XML = new XML();
		xmlTemp.ignoreWhite = true;
		xmlTemp.onLoad = function(success:Boolean):Void {
			if(success) {
				t.init2(this);
			} else {
				trace("Error loading xml");
			}
		}
		
		xmlTemp.load("Data.xml");
	}
	
	private function init2(xml:XML):Void {
		xmlData = Convert.xmlToObject(xml);
		xmlData = xmlData.data;
		_local.txtText.autoSize = "left";
		_local.txtText._width = Stage.width - 50;
		
		// Home
		_local.txtText.htmlText = "<b>Home Text:</b> " + xmlData.home.content + "</br>";
		
		// Products
		_local.txtText.htmlText += "<b>" + xmlData.products.title + ":</b> " + xmlData.products.content + "</br>";
		for(var i:String in xmlData.products.list.item) {
			_local.txtText.htmlText += "<b>Item" + i + " - " + xmlData.products.list.item[i].title +  ":</b> " + xmlData.products.list.item[i].description + "</br>";
		}
		
		// Services
		_local.txtText.htmlText += "<b>" + xmlData.services.title + ":</b> " + xmlData.services.content + "</br>";
		for(var j:String in xmlData.services.list.item) {
			_local.txtText.htmlText += "<b>Item" + j + " - " + xmlData.services.list.item[j].title +  ":</b> " + xmlData.services.list.item[j].description + "</br>";
		}
		
		// Contact
		_local.txtText.htmlText += "<b>" + xmlData.contact.email.title + ":</b> " + xmlData.contact.email.content + "</br>";
		_local.txtText.htmlText += "<b>" + xmlData.contact.phone.title + ":</b> " + xmlData.contact.phone.content + "</br>";
		_local.txtText.htmlText += "<b>" + xmlData.contact.address.title + ":</b> " + xmlData.contact.address.content + "</br>";
		
		// Footer
		_local.txtText.htmlText += "<b>Footer Text:</b> " + xmlData.footer + "</br>";
	}
}
