package  
{
	import flash.utils.setTimeout;
	/**
	 * ...
	 * @author Adam
	 */
	public class DoubleBulletWeapon extends Weapon
	{
		
		public function DoubleBulletWeapon() 
		{
			
		}
		private var canFire:Boolean = true;
		
		override public function fire(bx:int, by:int,weaponManager:WeaponManager):void {
			if ( canFire ) {
				
				fireBullet(bx + 7, by,weaponManager);
				fireBullet(bx-7, by,weaponManager);
				
				if(new Bullet().fireRate > 0){
					canFire = false;
					setTimeout(function():void { canFire = true }, new Bullet().fireRate);
				}
			}	
		}
		
		private function fireBullet(bx,by,weaponManager:WeaponManager) {
			var bullet = Bullet(weaponManager.getFirstAvailable());
			if(bullet)
				bullet.fire(bx + 7, by);
		}
		
		
		override public function addBulletsTo(weaponManager:WeaponManager) {
			for (var i:int = 0; i < 60; i++) {
				var bullet:Bullet = new Bullet
				bullet.makeGraphic(5, 5, 0xff5588dd);
				weaponManager.add(bullet);
			}
		}
	}

}