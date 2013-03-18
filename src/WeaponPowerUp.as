package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Adam
	 */
	public class WeaponPowerUp extends FlxGroup{

		public var laser:FlxSprite;

		public function WeaponPowerUp(){
			laser = new FlxSprite(100,0);
			laser.makeGraphic(15,15,0xff00ff00);
			laser.velocity.y = 50;
			add(laser);
		}

		override public function update():void {
			super.update();
			
			FlxG.overlap(laser,Registry.SpaceShip,applyPowerUp);
		}

		public function applyPowerUp(weapon:FlxSprite,player:FlxSprite):void{
			weapon.kill();
			Registry.Bullets.loadBullets(makeLaserBullet);
		}

		public function makeLaserBullet(){
			var bullet:Bullet = new Bullet;
			bullet.damage = 4;
			bullet.fireRate = 0;
			bullet.speed = 200;
			bullet.width = 50;
			bullet.height = 5;
			return bullet;
		}
	}
}



