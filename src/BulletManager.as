package  
{
	import flash.utils.setTimeout;
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author Adam
	 */
	public class BulletManager extends FlxGroup
	{
		private var canFire:Boolean = true;
		private var fireRate:int = 100
		public function BulletManager() 
		{
			super();
			
			for (var i:int = 0; i < 60; i++) {
				add(new Bullet);
			}
		}
		
		public function fire(bx:int, by:int):void {
			if ( canFire && getFirstAvailable()) {
				Bullet(getFirstAvailable()).fire(bx, by);
				
				canFire = false;
				setTimeout(function():void { canFire = true }, fireRate);
				
			}
		}
		
	}

}