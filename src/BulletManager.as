package  
{
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author Adam
	 */
	public class BulletManager extends FlxGroup
	{
		
		public function BulletManager() 
		{
			super();
			
			for (var i:int = 0; i < 60; i++) {
				add(new Bullet);
			}
		}
		
		public function fire(bx:int, by:int):void {
			if (getFirstAvailable()) {
				Bullet(getFirstAvailable()).fire(bx, by);
			}
		}
		
	}

}