package;

import kha.input.Keyboard;
import kha.Key;

class Input
{
	public static var shipControl:Bool = true;
	
	public var left:Bool = false;
	public var right:Bool = false;
	public var up:Bool = false;
	public var down:Bool = false;
	public var rotateLeft:Bool = false;
	public var rotateRight:Bool = false;
	public var zoomIn:Bool = false;
	public var zoomOut:Bool = false;
	
	var chars:Array<String> = [];
	
	public function new(left:String, right:String, up:String, down:String, rotateLeft:String, rotateRight:String, zoomIn:String, zoomOut:String)
	{
		chars[0] = left;
		chars[1] = right;
		chars[2] = up;
		chars[3] = down;
		chars[4] = rotateLeft;
		chars[5] = rotateRight;
		chars[6] = zoomIn;
		chars[7] = zoomOut;
		
		Keyboard.get().notify(keyDown, keyUp);
	}
	
	private function keyDown(key:Key, char:String)
	{
		if(char == chars[0]) left = true;
		if(char == chars[1]) right = true;
		if(char == chars[2]) up = true;
		if(char == chars[3]) down = true;
		if(char == chars[4]) rotateLeft = true;
		if(char == chars[5]) rotateRight = true;
		if(char == chars[6]) zoomIn = true;
		if(char == chars[7]) zoomOut = true;
	}
	
	private function keyUp(key:Key, char:String)
	{
		if(char == chars[0]) left = false;
		if(char == chars[1]) right = false;
		if(char == chars[2]) up = false;
		if(char == chars[3]) down = false;
		if(char == chars[4]) rotateLeft = false;
		if(char == chars[5]) rotateRight = false;
		if(char == chars[6]) zoomIn = false;
		if(char == chars[7]) zoomOut = false;
	}
	
}