package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Adam
	 */
	public class Bullet extends FlxSprite
	{
		public var damage:int = 1;
		public var speed:int = 300;
		
		public function Bullet() 
		{
			super(1, 1);
			makeGraphic(3, 3, 0xffffffff);
			exists = false;
		}
		
		public function fire(bx:int, by:int):void {
			x = bx;
			y = by;
			velocity.y = -speed;
			exists = true;
		}
		
		override public function update():void {
			super.update();
			
			if (exists && y < - height) {
					exists = false;
			}
		}
		
	}

}