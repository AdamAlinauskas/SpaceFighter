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
		[Embed(source = '../assets/powerup3.png')] public static var spriteSheet:Class;
		
		public function PowerUpSprite() 
		{
			x = 100;
			y = 0;
			loadGraphic(spriteSheet,true,false,15,15);
			acceleration.y = 50;
			maxVelocity.y = 50;
			velocity.y = 50;
			
			addAnimation(new DoubleBulletWeapon().name(), [0,1], 3, true);
			addAnimation(new ZigZagWeapon().name(), [2,3], 3, true);
		}
		
		override public function update():void 
		{
			super.update();
		}
	}
}