package  
{
	import flash.utils.setTimeout;
	/**
	 * ...
	 * @author Adam
	 */
	public class ClassicWeapon extends Weapon
	{
		private var canFire:Boolean = true;
		
		public function ClassicWeapon(){
			
		}
		
		override public function fire(bx:int, by:int,weaponManager:WeaponManager):void {
			var bullet = Bullet(weaponManager.getFirstAvailable());
			if ( canFire && bullet) {
				bullet.fire(bx, by);
				
				if(bullet.fireRate > 0){
					canFire = false;
					setTimeout(function():void { canFire = true }, bullet.fireRate);
				}
			}	
		}
		
		override public function addBulletsTo(weaponManager:WeaponManager) {
			for (var i:int = 0; i < 60; i++) {
				weaponManager.add(new Bullet);
			}
		}
		
	}

}