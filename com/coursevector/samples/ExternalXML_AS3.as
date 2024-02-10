
package com.coursevector.samples {
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.utils.*;

	public class ExternalXML_AS3 extends Sprite {
		
		private var xmlData:XML = new XML();
		private var txtText:TextField = new TextField();
		private var ulLoader:URLLoader;
		
		public function ExternalXML_AS3() {
			ulLoader = new URLLoader(new URLRequest("Data.xml"));
			ulLoader.addEventListener(Event.COMPLETE, onCompleteHandler);
			
			txtText.autoSize = TextFieldAutoSize.LEFT;
			txtText.multiline = true;
			txtText.wordWrap = true;
			txtText.x = 42.4;
			txtText.y = 43.8;
			txtText.width = stage.width - 50;
			addChild(txtText);
		}
		
		private function onCompleteHandler(e:Event):void {
			xmlData = XML(ulLoader.data);
			init();
		}
		
		private function init():void {
			// Home
			txtText.htmlText = "<b>Home Text:</b> " + xmlData.home.content + "<br>";
			
			// Products
			txtText.htmlText += "<b>" + xmlData.products.title + ":</b> " + xmlData.products.content + "<br>";
			for(var i:String in xmlData.products.list.item) {
				txtText.htmlText += "<b>Item" + i + " - " + xmlData.products.list.item[i].title +  ":</b> " + xmlData.products.list.item[i].description + "<br>";
			}
			
			// Services
			txtText.htmlText += "<b>" + xmlData.services.title + ":</b> " + xmlData.services.content + "<br>";
			for(var j:String in xmlData.services.list.item) {
				txtText.htmlText += "<b>Item" + j + " - " + xmlData.services.list.item[j].title +  ":</b> " + xmlData.services.list.item[j].description + "<br>";
			}
			
			// Contact
			txtText.htmlText += "<b>" + xmlData.contact.email.title + ":</b> " + xmlData.contact.email.content + "<br>";
			txtText.htmlText += "<b>" + xmlData.contact.phone.title + ":</b> " + xmlData.contact.phone.content + "<br>";
			txtText.htmlText += "<b>" + xmlData.contact.address.title + ":</b> " + xmlData.contact.address.content + "<br>";
			
			// Footer
			txtText.htmlText += "<b>Footer Text:</b> " + xmlData.footer + "<br>";
		}
	}
}