
package com.coursevector.samples {
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.IOErrorEvent;
	import flash.utils.*;

	public class ExternalSWF_AS3 extends Sprite {
		
		private var txtText:TextField = new TextField();
		private var loader:Loader = new Loader();
		
		public function ExternalSWF_AS3() {
			init();
		}
		
		private function init():void {
			loader.load(new URLRequest("SWF_AS3.swf"));
			loader.contentLoaderInfo.addEventListener(Event.OPEN, onOpenHandler);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgressHandler);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIOErrorHandler);
			loader.x = 25;
			loader.y = 25;
			addChild(loader);
			
			txtText.autoSize = TextFieldAutoSize.LEFT;
			txtText.multiline = true;
			txtText.wordWrap = true;
			txtText.x = 42.4;
			txtText.y = 43.8;
			txtText.width = stage.width - 50;
			addChild(txtText);
		}
		
		private function onOpenHandler(e:Event):void {
			txtText.appendText("Start Loading\n");
		}
		
		private function onCompleteHandler(e:Event):void {
			txtText.appendText("Loaded\n");
		}
		
		private function onProgressHandler(e:ProgressEvent):void {
			var nPercent:int = int((e.bytesLoaded / e.bytesTotal) * 100);
			txtText.appendText("Percent Loaded: " + nPercent + "\n");
		}
		
		private function onIOErrorHandler(e:IOErrorEvent):void {
			txtText.appendText("Error: " + e + "\n");
		}
	}
}