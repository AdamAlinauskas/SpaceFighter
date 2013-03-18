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


		public function BulletManager() 
		{
			super();
			
			for (var i:int = 0; i < 60; i++) {
				add(new Bullet);
			}
		}

		public function loadBullets(createBullet){
			super.clear();
			for(var i:int=0; i<150; i++){
				add(createBullet());
			}
		}
		
		public function fire(bx:int, by:int):void {
			if ( canFire && getFirstAvailable()) {
				var bullet:Bullet = Bullet(getFirstAvailable());
				bullet.fire(bx, by);
				
				if(bullet.fireRate > 0){
					canFire = false;
					setTimeout(function():void { canFire = true }, bullet.fireRate);
				}
			}
		}
		
	}

}