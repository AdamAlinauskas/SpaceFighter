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

		[Embed(source="../assets/Laser_Shoot9.mp3")] private var shootMusic:Class;
		
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
				 	GameSound.play(shootMusic,.03);
				}
		}
		
		override public function addBulletsTo(weaponManager:WeaponManager):void {
			Registry.SpaceShip.playAnimation(Player.ZigZagWeaponShip);
			for (var i:int = 0; i < 60; i++) {
				weaponManager.add(new ZigZagBullet);
			}
		}
		
	}

}