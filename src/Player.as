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
			
			acceleration.x = 50;
			maxVelocity.x = 200;
			drag.x = maxVelocity.x * 4;
			
			acceleration.y = 50;
			maxVelocity.y = 200;
			drag.y = maxVelocity.y * 4;
			
			health = 100;
		}
		       
		override public function update():void 
		{
			super.update();
			
			acceleration.x = 0;
			acceleration.y = 0;
			
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
		
		public function bulletHit(bullet:FlxObject, player:FlxObject):void
        {
            bullet.kill();
            hurt(25);
            Registry.Blood.explodeBlock(x, y);
        }
	}

}