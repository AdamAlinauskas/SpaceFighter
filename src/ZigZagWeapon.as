package  
{
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Adam
	 */
	public class ZigZagWeapon extends Weapon
	{
		private var canFire:Boolean = true;
		private var fireRate:Number = .05;
		private var counter:Number = 0;
		private var startDirectionLeft = true;
		
		public function ZigZagWeapon(){
			
		}
		
		override public function fire(bx:int, by:int,weaponManager:WeaponManager):void {
			counter += FlxG.elapsed;
			if(counter >= fireRate){
				var bullet = Bullet(weaponManager.getFirstAvailable());
				if (bullet != null) {
  				//	bullet.startDirectionLeft = startDirectionLeft;
					bullet.fire(bx, by);
				}
				counter = 0;
			}
		}
		
		override public function addBulletsTo(weaponManager:WeaponManager) {
			for (var i:int = 0; i < 60; i++) {
				weaponManager.add(new ZigZagBullet);
			}
		}
		
	}

}