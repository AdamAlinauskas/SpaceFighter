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
		private var powerUpLasts = 15;
		private var HasPowerUp:Boolean = false;
		private var powerUpCounter:Number = 0;
		private var displayPowerUpAfterKilling:int = 20;

		public function WeaponPowerUpManager(){
			laser = new LaserWeaponPowerUp;
			laser.kill();
			add(laser);
		}

		override public function update():void {
			super.update();
			FlxG.overlap(laser, Registry.SpaceShip, applyPowerUp);
			
			if (HasPowerUp == false &&  FlxG.score != 0 && FlxG.score %displayPowerUpAfterKilling == 0)
            {
                lastReleased = getTimer();
				timeToWait = 15000
				laser.revive();
                laser.x = 150;
				laser.y = -25;
            }
			
			if (HasPowerUp) {
				powerUpCounter += FlxG.elapsed;
				if (powerUpCounter >= powerUpLasts) {
					powerUpCounter = 0;
					HasPowerUp = false;
					Registry.Bullets.load(new ClassicWeapon);
				}
			}
		}

		public function applyPowerUp(weapon:WeaponPowerUp, player:FlxSprite):void {
			HasPowerUp = true;
			weapon.kill();
			Registry.Bullets.load(new DoubleBulletWeapon);
		}
	}
}



