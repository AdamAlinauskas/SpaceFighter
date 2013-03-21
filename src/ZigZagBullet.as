package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Adam
	 */
	public class ZigZagBullet extends Bullet
	{
		var shiftBulletDirectionTime:Number = .2;
		var counter:Number = 0;
		private var startDirectionLeft:Boolean = true;
		
		public function ZigZagBullet() 
		{
			//super(1, 1);
			super();
			makeGraphic(5, 5, 0xff885522);
			exists = false;
			velocity.x 200;
			acceleration.x = 200;
			maxVelocity.x = 200;
		}
		
		override public function update():void 
		{
			super.update();
			counter += FlxG.elapsed;
			velocity.y = -250;
		
			if (counter >= shiftBulletDirectionTime) {
				acceleration.x = acceleration.x * -1;
				velocity.x = velocity.x * -1;
				counter = 0;
			}		
		}
		
		override public function revive():void 
		{
			super.revive();
			counter = 0;
		}	
	}
}