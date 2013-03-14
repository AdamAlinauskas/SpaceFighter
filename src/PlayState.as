package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Adam
	 */
	public class PlayState extends FlxState
	{
		private var player:Player;
		
		public function PlayState() 
		{
		
		}
		
		override public function create():void 
		{
			super.create();
			player = new Player();
			add(player);
			add(Registry.Bullets);
			add(Registry.Enemies);
		}
		
		override public function update():void 
		{
			super.update();
			FlxG.overlap(Registry.Bullets, Registry.Enemies, Registry.Enemies.bulletHitEnemy);
		}
	}
}