package  
{
	import mx.core.FlexSprite;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Adam
	 */
	public class PowerUpSprite extends FlxSprite
	{
		
		public function PowerUpSprite() 
		{
			x = 100;
			y = 0;
			makeGraphic(15, 15, 0xff444444);
			acceleration.y = 50;
			maxVelocity.y = 50;
			velocity.y = 50;
			
			//makeGraphic(10, 10, 0xff444444);
			//y = 50;
			//x = 100;
		}
		
		override public function update():void 
		{
			super.update();
		}
	}
}