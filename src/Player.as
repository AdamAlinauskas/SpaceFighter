package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Adam
	 */
	public class Player extends FlxSprite
	{
		public function Player() 
		{
			super(FlxG.width / 2, FlxG.height - 50);
			makeGraphic(10, 12, 0xffaa1111);
			
			acceleration.x = 10;
			maxVelocity.x = 140;
			drag.x = maxVelocity.x * 4;
			
			acceleration.y = 10;
			maxVelocity.y = 140;
			drag.y = maxVelocity.y * 4;
			
			health = 100;
		}
		       
		override public function update():void 
		{
			acceleration.x = 0;
			acceleration.y = 0;
			
			super.update();
			if (FlxG.keys.RIGHT) {
				acceleration.x = maxVelocity.x * 4;
			}
			if (FlxG.keys.LEFT) {
				acceleration.x = -maxVelocity.x * 4;
			}
			if (FlxG.keys.UP) {
				acceleration.y = -maxVelocity.y * 4;
			}
			if (FlxG.keys.DOWN) {
				acceleration.y = maxVelocity.y * 4;
			}
			
			if (FlxG.keys.SPACE) {
				Registry.Bullets.fire(x, y);
			}
		}
	}

}