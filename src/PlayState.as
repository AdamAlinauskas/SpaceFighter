package  
{
	import org.flixel.*;
	import org.flixel.FlxState;
	import org.flixel.FlxU;
	/**
	 * ...
	 * @author Adam
	 */
	public class PlayState extends FlxState
	{
		private var player:Player;
		private var tempPixel:FlxEmitter
		
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
			add(Registry.Blood); 
			
				tempPixel = new FlxEmitter;
				tempPixel.setSize(8, 8);
				tempPixel.gravity = 200;
				tempPixel.setXSpeed(-50, 50);
				tempPixel.setYSpeed( -30, -60);
				tempPixel.setRotation(0, 0);	// VITAL!!!
			//	tempPixel.createSprites(Pixel, 10, 0, true, 0, 0);
				tempPixel.makeParticles(BloodBitMap, 10, 0, true);
				
				
				add(tempPixel);
				
				
		}
		
		override public function update():void 
		{
			super.update();
			FlxG.overlap(Registry.Bullets, Registry.Enemies, Registry.Enemies.bulletHitEnemy);
			
			tempPixel.x = 50;
			tempPixel.y = 50;
			tempPixel.start(true, 0);
		}
	}
}