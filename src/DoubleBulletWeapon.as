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
		[Embed(source="../assets/Laser_Shoot5.mp3")] private var shootMusic:Class;

		
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
		
		private function fireBullet(bx:int,by:int,weaponManager:WeaponManager):void {
			var bullet:Bullet = Bullet(weaponManager.getFirstAvailable());
			if(bullet){
				bullet.fire(bx + 7, by);
			 	GameSound.play(shootMusic,.03);

			}
		}
		
		
		override public function addBulletsTo(weaponManager:WeaponManager):void {
			Registry.SpaceShip.playAnimation(Player.doubleWeaponShip);
			for (var i:int = 0; i < 60; i++) {
				var bullet:Bullet = new Bullet
				bullet.makeGraphic(5, 5, 0xff5588dd);
				weaponManager.add(bullet);
			}
		}
		
		override public function name():String{
			return "double";
		}
	}

}