package;

import kha.math.Vector2;
import kha.math.Matrix3;

class Camera
{
	
	public static var main:Camera;
	
	public var matrix:Matrix3 = Matrix3.identity();
	
	var position:Vector2 = new Vector2(0, 0);
	var offset:Vector2 = new Vector2(320, 240);
	var scale:Vector2 = new Vector2(1, 1);
	var rotation:Float = 0;
	var zoom:Float = 1;
	
	var input:Input;
	
	public function new()
	{
		if (Camera.main == null)
			Camera.main = this;
		
		input = new Input("a", "d", "w", "s", "q", "e", "r", "f");
	}
	
	public function update(delta:Float)
	{
		handleInput(delta);
		updateMatrix();
	}
	
	private function updateMatrix()
	{
		matrix = Matrix3.translation(offset.x, offset.y) *
				Matrix3.scale(scale.x * zoom, scale.y * zoom) *
				Matrix3.rotation(rotation * Math.PI / 180) *
				Matrix3.translation(position.x, position.y);
	}
	
	private function handleInput(delta:Float)
	{
		if (Input.shipControl) return;
		
		if (input.left) position.x -= 500 * delta;
		if (input.right) position.x += 500 * delta;
		if (input.up) position.y -= 500 * delta;
		if (input.down) position.y += 500 * delta;
		if (input.rotateLeft) rotation -= 100 * delta;
		if (input.rotateRight) rotation += 100 * delta;
		if (input.zoomIn) zoom += 5 * delta;
		if (input.zoomOut) zoom -= 5 * delta;
	}
	
}