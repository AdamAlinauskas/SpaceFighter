package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Adam
	 */
	public class Heart extends FlxSprite
	{
		[Embed(source = '../assets/SingleHeartSpriteSheet.png')]
		public static var spriteSheet:Class;
		
		public function Heart() 
		{
			loadGraphic(spriteSheet, true, false, 10, 9);
			super.addAnimation("empty", [2], 0, false);
			super.addAnimation("flash", [0,2], 3, false);
		}
		
		public function empty():void {
				super.play("empty");
		}
		
		public function flash():void {
				super.play("flash");
		}
	}

}