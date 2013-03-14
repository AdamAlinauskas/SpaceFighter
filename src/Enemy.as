package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	public class Enemy extends FlxSprite
	{
		public function Enemy() 
		{
			makeGraphic(15, 10, 0xff0000aa);
			exists = false;
		}
		
		public function launch():void {
			x = Utility.RandomNumberBetween(0, FlxG.width - width);
			y = -16;
			
			//velocity.x = 50 + int(Math.random() * 100);
			velocity.y = 50;
			
			health = 4;
			exists = true;
		}
		
		override public function kill():void 
		{
			super.kill();
			FlxG.score += 28;
		}
		
		override public function update():void 
		{
			super.update();
			if (y > FlxG.height) {
					exists = false;
			}
		}
	}
}