package  
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		private var score:FlxText;
		private var message:FlxText;
		
		public function PlayState() 
		{
		}
		
		override public function create():void 
		{
			super.create();
			//FlxG.visualDebug = true;
			score = new FlxText(5, 0, 100);
			add(score);
			add(Registry.SpaceShip);
			add(Registry.weaponManager);
			add(Registry.Enemies);
			add(Registry.Blood);
 			add(Registry.enemyBullet);
 			add(Registry.weaponPowerUp);
			add(Registry.endLevel);
			add(Registry.health);
			Registry.weaponManager.load(new ClassicWeapon);
		}
		
		override public function update():void 
		{
			super.update();
			score.text = "Score " + FlxG.score;
			FlxG.overlap(Registry.weaponManager, Registry.Enemies, Registry.Enemies.bulletHitEnemy);
			FlxG.overlap(Registry.enemyBullet, Registry.SpaceShip, Registry.SpaceShip.bulletHit);
		}
	
	}
}