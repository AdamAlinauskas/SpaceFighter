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
		[Embed(source="../assets/Laser_Shoot10.mp3")] private var shootMusic:Class;
		public function ClassicWeapon(){
			
		}
		
		override public function fire(bx:int, by:int,weaponManager:WeaponManager):void {
			var bullet:Bullet = Bullet(weaponManager.getFirstAvailable());
			if ( canFire && bullet) {
				bullet.fire(bx, by);
				
				GameSound.play(shootMusic, .03);
				
				if(bullet.fireRate > 0){
					canFire = false;
					setTimeout(function():void { canFire = true }, bullet.fireRate);
				}
			}	
		}
		
		override public function addBulletsTo(weaponManager:WeaponManager):void {
			Registry.SpaceShip.playAnimation(Player.normalShip);
			for (var i:int = 0; i < 60; i++) {
				weaponManager.add(new Bullet);
			}
		}
		
	}

}