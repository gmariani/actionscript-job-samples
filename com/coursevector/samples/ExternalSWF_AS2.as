import com.coursevector.util.Convert;

class com.coursevector.samples.ExternalSWF_AS2 {
	
	private var mcExternal:MovieClip;
	private var _local:MovieClip;
	
	public function ExternalSWF_AS2(mc:MovieClip) {
		_local = mc;
		init();
	}
	
	private function init():Void {
		mcExternal = _local.createEmptyMovieClip("mcExternal", _local.getNextHighestDepth());
		mcExternal._x = 25;
		mcExternal._y = 25;
		
		var txtText:TextField = _local.createTextField("txtText", _local.getNextHighestDepth(), 42.4, 43.8, 1, 1);
		txtText.text = "";
		txtText.autoSize = "left";
		txtText._width = Stage.width - 50;
		
		var mcl:MovieClipLoader = new MovieClipLoader();
		var objList:Object = new Object();
		objList.onLoadInit = function(mc:MovieClip) {
			txtText.text += "Loaded\n";
		}
		objList.onLoadStart = function(mc:MovieClip) {
			txtText.text += "Start Loading\n";
		}
		objList.onLoadProgress = function(mc:MovieClip, loaded:Number, total:Number) {
			var nPercent:Number = (loaded / total) * 100;
			txtText.text += "Percent Loaded: " + nPercent + "\n";
		}
		objList.onLoadError = function(target_mc:MovieClip, errorCode:String, httpStatus:Number) {
			txtText.text += "Error: " + errorCode + " : " + httpStatus + "\n";
		}
		mcl.addListener(objList);
		mcl.loadClip("SWF_AS2.swf", mcExternal);
	}
}
 
