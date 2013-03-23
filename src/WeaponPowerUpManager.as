package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Adam
	 */
	public class WeaponPowerUpManager extends FlxGroup{

		public var laser:LaserWeaponPowerUp;
		private var powerUpLasts = 15;
		private var HasPowerUp:Boolean = false;
		private var powerUpCounter:Number = 0;
		private var displayPowerUpAfterKilling:int = 20;
		private var powerUps:Array = new Array;
		private var selectedPowerUp = 0;
		[Embed(source="../assets/PowerupOrKill.mp3")] private var powerupMusic:Class;
		
		public function WeaponPowerUpManager(){
			laser = new LaserWeaponPowerUp;
			laser.kill();
			add(laser);
			powerUps.push(new DoubleBulletWeapon());
			powerUps.push(new ZigZagWeapon());
		}

		override public function update():void {
			super.update();
			FlxG.overlap(laser, Registry.SpaceShip, applyPowerUp);
			
			if (HasPowerUp == false &&  FlxG.score != 0 && FlxG.score %displayPowerUpAfterKilling == 0)
            {
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
			FlxG.play(powerupMusic, .5);
			Registry.Bullets.load(powerUps[selectedPowerUp]);
			selectedPowerUp += 1;
			if (selectedPowerUp == powerUps.length)
				selectedPowerUp = 0;
		}
	}
}



