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
		private var shiftBulletDirectionTime:Number = .15;
		private var counter:Number = 0;
		private var startDirectionLeft:Boolean = true;
		
		public function ZigZagBullet() 
		{
			super();
			makeGraphic(5, 5, 0xff885522);
			exists = false;
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
		
		public function setInitialBulletXaxisDirection(isRight:Boolean):void {
			var direction:int = isRight ? 1 : -1;
			velocity.x = 200 * direction;
			acceleration.x = 200 * direction;
			counter = 0;
		}
	}
}