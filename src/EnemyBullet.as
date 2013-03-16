package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Adam
	 */
	public class EnemyBullet extends FlxSprite
	{
		public var damage:int = 25;
		public var speed:int = 100;
		
		public function EnemyBullet() 
		{
			super(1, 1);
			makeGraphic(4, 4, 0xff00ff00);
			exists = false;
		}
		
		public function fire(bx:int, by:int):void {
			x = bx;
			y = by;
			velocity.y = +speed;
			exists = true;
		}
		
		override public function update():void {
			super.update();
			
			if (exists && y > FlxG.height ) {
					exists = false;
			}
		}
	}

}