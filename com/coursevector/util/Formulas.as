
package com.coursevector.util {
	
	import com.coursevector.display.DisplayObject3D;
	import flash.display.DisplayObject;

	public class Formulas {
		
		// Return a random number between a range of numbers
		public static function randomRange(min:Number, max:Number):Number {	return Math.random() * (max - min) + min }
		
		public static function rgb2Hex(r:uint, g:uint, b:uint):Number {	return r << 16 | g << 8 | b	}
		public static function hex2RGB(col:Number):Object {
			var o:Object = new Object();
			o.red = col >> 16;
			o.green = col >> 8 & 0xFF;
			o.blue = col & 0xFF;
			return o;
		}
		
		public static function argb2Hex(a:uint, r:uint, g:uint, b:uint):Number { return a << 24 | r << 16 | g << 8 | b }
		public static function hex2ARGB(col:Number):Object {
			var o:Object = new Object();
			o.alpha = col >> 24 & 0xFF;
			o.red = col >> 16 & 0xFF;
			o.green = col >> 8 & 0xFF;
			o.blue = col & 0xFF;
			return o;
		}
		
		// Rotate a coordinate in a 2D space
		public static function coordRotate(obj:DisplayObject, aDec:Number, dir:uint):Object {
			var o:Object = new Object();
			var aRad:Number = Formulas.deg2Rad(aDec);
			var cosA = Math.cos(aRad);
			var sinA = Math.sin(aRad);
			if(dir == 1) {
				o.x = cosA * obj.x - sinA * obj.y;
				o.y = cosA * obj.y + sinA * obj.x;
			} else {
				o.x = cosA * obj.x + sinA * obj.y;
				o.y = cosA * obj.y - sinA * obj.x;
			}
			return o;
		}
		
		public static function dec2Hex(n:Number):String { return n.toString(16) }
		public static function hex2Dec(n:String):uint { return uint(n) }
		
		public static function deg2Rad(n:Number):Number { return n * Math.PI / 180 }
		public static function rad2Deg(n:Number):Number { return n * 180 / Math.PI }
		
		public static function getDistance3D(obj1:DisplayObject3D, obj2:DisplayObject3D):Number {
			var dx:Number = obj2.x - obj1.x;
			var dy:Number = obj2.y - obj1.y;
			var dz:Number = obj2.z - obj1.z;
			return Math.sqrt(dx * dx + dy * dy + dz * dz);
		}
		
		public static function getDistance(obj1:DisplayObject, obj2:DisplayObject):Number {
			var dx:Number = obj2.x - obj1.x;
			var dy:Number = obj2.y - obj1.y;
			return Math.sqrt(dx * dx + dy * dy);
		}
	}
}