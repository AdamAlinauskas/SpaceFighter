package  
{
	import flash.utils.setTimeout;
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Adam
	 */
	public class ClassicWeapon extends Weapon
	{
		
		
		private var canFire:Boolean = true;
		[Embed(source="../assets/Laser_Shoot5.mp3")] private var shootMusic:Class;
		public function ClassicWeapon(){
			
		}
		
		override public function fire(bx:int, by:int,weaponManager:WeaponManager):void {
			var bullet = Bullet(weaponManager.getFirstAvailable());
			if ( canFire && bullet) {
				bullet.fire(bx, by);
				FlxG.play(shootMusic, .05);
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