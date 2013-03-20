package  
{
	import flash.utils.clearTimeout;
	import flash.utils.getTimer;
	import flash.utils.SetIntervalTimer;
	import flash.utils.setTimeout;
	import org.flixel.*;
	/**
	 * ...
	 * @author Adam
	 */
	public class WeaponPowerUpManager extends FlxGroup{

		public var laser:LaserWeaponPowerUp;
		private var lastReleased:int;
        private var timeToWait:int = 1500;
		private var powerUpLasts = 5000;

		public function WeaponPowerUpManager(){
			laser = new LaserWeaponPowerUp;
			add(laser);
		}

		override public function update():void {
			super.update();
			FlxG.overlap(laser, Registry.SpaceShip, applyPowerUp);
			
			if (getTimer() > lastReleased + timeToWait)
            {
                lastReleased = getTimer();
				timeToWait = 15000
				laser.revive();
                laser.x = 150;
				laser.y = 0;
            }
			
		}

		public function applyPowerUp(weapon:WeaponPowerUp,player:FlxSprite):void{
			weapon.kill();
			Registry.Bullets.load(new DoubleBulletWeapon);
			//setTimeout(applyClassicBullets, 10000);
		}
		
		public function applyClassicBullets() {
			//Registry.Bullets.loadBullets(function():FlxSprite { return new Bullet } );
		}
	}
}



