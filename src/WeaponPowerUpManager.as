package  
{
	import flash.utils.SetIntervalTimer;
	import flash.utils.setTimeout;
	import org.flixel.*;
	/**
	 * ...
	 * @author Adam
	 */
	public class WeaponPowerUpManager extends FlxGroup{

		public var laser:LaserWeaponPowerUp;

		public function WeaponPowerUpManager(){
			laser = new LaserWeaponPowerUp;
		}
		

		override public function update():void {
			super.update();
			FlxG.overlap(laser, Registry.SpaceShip, applyPowerUp);
			setTimeout(function() { add(laser); }, 10000);
		}

		public function applyPowerUp(weapon:FlxSprite,player:FlxSprite):void{
			weapon.kill();
			Registry.Bullets.loadBullets(WeaponPowerUp(weapon).makeBullet);
		}


	}
}



