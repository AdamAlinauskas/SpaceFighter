package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Adam
	 */
	public class Health extends FlxSprite 
	{
		[Embed(source = '../assets/life.png')]
		public static var image:Class;
		private var widthOfImage = 13;
		public function Health() { 
			
			super(FlxG.width/2, 0);
		}
		
		override public function update():void 
		{
			super.update();
			loadGraphic(image, true, false, Registry.SpaceShip.health * widthOfImage, 9);
			exists = Registry.SpaceShip.health > 0;
		}
	}
}