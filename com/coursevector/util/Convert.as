class com.coursevector.util.Convert {
	
	private function Convert () {
		//
	}
	
	public static function xmlToObject(__xml:XML):Object {
		try {
			if (__xml === null || __xml === undefined) {
				throw new Error ('XML data not defined.');
			} else if ( __xml instanceof XML === false) {
				throw new Error ('Unable to parse non-XML data.');	
			}
			return Convert.processParent(__xml.firstChild);
		} catch (e) {
			trace('Compile Error: ' + e.toString());
		}
		return null;
	}
	
	private static function processParent():Object {
		var oXML : Object = {};
		var oTemp : Object = {};
		var xml : XML = arguments[0];
		var aAttributes : Object = xml.attributes;
		
		for (var sKey in aAttributes) {
			if ( oTemp['attribute'] === undefined ) oTemp['attribute'] = {};
			oTemp['attribute'][sKey] = aAttributes[sKey];
		}
		
		if (xml.hasChildNodes()) {
			for (var i = 0; i < xml.childNodes.length; i++) {
				if (xml.childNodes[i].nodeType == 1) {
					if (Convert.isNextDuplicate(xml, i) && (oTemp[xml.childNodes[i].nodeName] === null || oTemp[xml.childNodes[i].nodeName] === undefined)) {
						oTemp[xml.childNodes[i].nodeName] = [];
						oTemp[xml.childNodes[i].nodeName].push( Convert.processChild(xml.childNodes[i]));
					} else if ( !Convert.isNextDuplicate(xml, i) && !Convert.isPrevDuplicate( xml, i)) {
						oTemp[xml.childNodes[i].nodeName] = Convert.processChild(xml.childNodes[i]);
					} else {
						oTemp[xml.childNodes[i].nodeName].push(Convert.processChild(xml.childNodes[i]));
					}
				} else if (xml.childNodes[i].nodeType == 3) {
					oTemp = Convert.processChild(xml.childNodes[i]);
				}
			}
		}
		
		if (arguments[1] === null || arguments[1] === undefined) {
			oXML[xml.nodeName] = oTemp;
		} else {
			oXML = oTemp;
		}
		return oXML;
	}
	
	private static function processChild(__xml:XML) {
		if (__xml.nodeType == 1) {
			return Convert.processParent(__xml, true);
		} else if (__xml.nodeType == 3) {
			return __xml.nodeValue;
		}
	}
	
	private static function isPrevDuplicate(__xml, iCurrentSibling):Boolean {
		if (__xml.childNodes[iCurrentSibling - 1] ) {
			if (__xml.childNodes[iCurrentSibling].nodeType == 1 && __xml.childNodes[iCurrentSibling - 1].nodeType == 1) {
				if (__xml.childNodes[iCurrentSibling].nodeName === __xml.childNodes[iCurrentSibling - 1].nodeName) {
					return true;
				}
			}
		}
		return false;
	}
	
	private static function isNextDuplicate(__xml, iCurrentSibling):Boolean {
		if (__xml.childNodes[iCurrentSibling + 1]) {
			if ( __xml.childNodes[iCurrentSibling].nodeType == 1 && __xml.childNodes[iCurrentSibling + 1].nodeType == 1) {
				if (__xml.childNodes[iCurrentSibling].nodeName === __xml.childNodes[iCurrentSibling + 1].nodeName) {
					return true;
				}
			}
		}
		return false;
	}
}