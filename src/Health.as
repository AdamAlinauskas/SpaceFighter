package  
{
	import adobe.utils.CustomActions;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Adam
	 */
	public class Health extends FlxGroup 
	{		
		private var hearts:Array = new Array();
		
		[Embed(source = "../assets/heartbeat.mp3")] 
		private var lastLegsMusic:Class;
		
		private var playedMusic:Boolean;
		
		public function Health() { 
		}
		
		override public function update():void 
		{	
			super.update();
			createHearts();
			updateHearts();
			if (Registry.SpaceShip.health == 1 && playedMusic == false ) {
					playedMusic = true;
					FlxG.play(lastLegsMusic, 1, true);
			}
		}
		
		private function createHearts():void 
		{
			if (hearts.length == 0) {
				var heartX:Number = FlxG.width/2 - 50;
				for (var i:int = 0; i < Registry.SpaceShip.health; i++) 
				{
					var heart:Heart = new Heart;
					heart.x = heartX;
					heart.y = 0;
					heartX += 12;
					hearts.push(heart);
					add(heart);
				}
			}
		}
		
		private function updateHearts():void 
		{
			if (Registry.SpaceShip.health < hearts.length) {
				if (Registry.SpaceShip.health - 1 == 0) {
					Heart(hearts[Registry.SpaceShip.health ]).empty();
					Heart(hearts[Registry.SpaceShip.health-1]).flash();
				}
				else
					Heart(hearts[Registry.SpaceShip.health ]).empty();
			}
		}
	}
}