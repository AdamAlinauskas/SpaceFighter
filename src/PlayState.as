package  
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		
		public function PlayState() 
		{
		}
		
		override public function create():void 
		{
			super.create();
			
			add(Registry.SpaceShip);
			add(Registry.Bullets);
			add(Registry.Enemies);
			add(Registry.Blood);
 			add(Registry.enemyBullet);
		}
		
		override public function update():void 
		{
			super.update();
			FlxG.overlap(Registry.Bullets, Registry.Enemies, Registry.Enemies.bulletHitEnemy);
		}
	}
}