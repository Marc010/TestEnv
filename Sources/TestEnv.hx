package;

import kha.Font;
import kha.graphics2.Graphics;
import kha.Framebuffer;
import kha.math.Matrix3;
import kha.Scaler;
import kha.Image;
import kha.Game;
import kha.Loader;
import kha.FontStyle;
import kha.Color;
import kha.Configuration;
import kha.LoadingScreen;
import kha.Key;
import kha.Scheduler;
import kha.input.Keyboard;

class TestEnv extends Game
{
	
	var backbuffer: Image;
	
	var ship:Ship;
	var camera:Camera;
	var font:Font;
	
	public function new()
	{
		super("TestEnv", false);
	}
	
	override public function init()
	{
		backbuffer = Image.createRenderTarget(640, 480);
		Configuration.setScreen(new LoadingScreen());
		Loader.the.loadRoom("main", initLevel);
	}
	
	private function initLevel()
	{
		Configuration.setScreen(this);
		Keyboard.get().notify(onKeyDown, keyUp);
		
		ship = new Ship();
		camera = new Camera();
		font = Loader.the.loadFont("Arimo", new FontStyle(false, false, false), 20);
	}

	override public function update()
	{
		ship.update(Scheduler.deltaTime);
		camera.update(Scheduler.deltaTime);
	}
	
	override public function render(frame: Framebuffer): Void {
		var g = backbuffer.g2;
		
		g.begin();
		g.clear();
		g.color = Color.White;
		
		ship.render(g);
		
		g.font = font;
		g.drawString("Movement: wasd", 6, 4);
		g.drawString("Rotation: q/e", 6, 20);
		g.drawString("Zoom: r/f", 6, 36);
		
		g.pushTransformation(Matrix3.scale(2, 2));
		if (Input.shipControl)
		{
			g.color = Color.Red;
			g.drawString("Ship", 208, 4);
			g.color = Color.White;
			g.drawString("Camera", 248, 4);
		}
		else
		{
			g.color = Color.Red;
			g.drawString("Camera", 248, 4);
			g.color = Color.White;
			g.drawString("Ship", 208, 4);
		}
		g.popTransformation();
		
		g.drawString("Switch(Space)", 500, 44);
		
		g.end();
		
		startRender(frame);
		Scaler.scale(backbuffer, frame, kha.Sys.screenRotation);
		endRender(frame);
	}
	
	private function onKeyDown(key:Key, char:String)
	{
		if (char == " ")
			Input.shipControl = !Input.shipControl;
	}
	
}
