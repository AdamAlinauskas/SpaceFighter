package  
{
	import mx.core.FlexSprite;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Adam
	 */
	public class LaserWeaponPowerUp extends WeaponPowerUp
	{
		
		public function LaserWeaponPowerUp() 
		{
			x = 100;
			y = 0;
			makeGraphic(15, 15, 0xff00ff00);
			acceleration.y = 50;
			maxVelocity.y = 50;
			velocity.y = 50;
		}
		
		override public function makeBullet(){
		
			return new Laser;
		}
		
	}

}