package  
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		private var score:FlxText;
		private var health:FlxText;
		
		public function PlayState() 
		{
		}
		
		override public function create():void 
		{
			super.create();
			
			score = new FlxText(5, 0, 100);
			health = new FlxText(200, 0, 50);
			add(score);
			add(health);
			add(Registry.SpaceShip);
			add(Registry.weaponManager);
			add(Registry.Enemies);
			add(Registry.Blood);
 			add(Registry.enemyBullet);
 			add(Registry.weaponPowerUp);
			Registry.weaponManager.load(new ClassicWeapon);
		}
		
		override public function update():void 
		{
			super.update();
			score.text = "Score " + FlxG.score;
			health.text = "Health " + Registry.SpaceShip.health;
			FlxG.overlap(Registry.weaponManager, Registry.Enemies, Registry.Enemies.bulletHitEnemy);
			FlxG.overlap(Registry.enemyBullet, Registry.SpaceShip, Registry.SpaceShip.bulletHit);
		}
	}
}