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
		private var startDirectionLeft:int = 1;
		
		public function ZigZagWeapon(){
			
		}
		
		override public function fire(bx:int, by:int,weaponManager:WeaponManager):void {
			counter += FlxG.elapsed;
			if(counter >= fireRate){
				shoot(bx, by, true, weaponManager);
				shoot(bx, by, false, weaponManager);
				counter = 0;
			}
		}
		
		private function shoot(bx:int, by:int, shootRight:Boolean,weaponManager:WeaponManager):void {
			var bullet:ZigZagBullet = ZigZagBullet(weaponManager.getFirstAvailable());
				if (bullet != null) {
      				bullet.setInitialBulletXaxisDirection(shootRight);
					bullet.fire(bx, by);
				}
		}
		
		override public function addBulletsTo(weaponManager:WeaponManager):void {
			for (var i:int = 0; i < 60; i++) {
				weaponManager.add(new ZigZagBullet);
			}
		}
		
	}

}