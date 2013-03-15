package  
{
	import flash.utils.setInterval;
	import org.flixel.*;
	
	public class Enemy extends FlxSprite
	{
		
		private var shoot:Boolean;
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
			
			if (Utility.chanceRoll(75)) {
				shoot = false;
				setInterval(function():void { shoot = true; }, 3000);
			}
		}
		
		override public function kill():void 
		{
			super.kill();
			FlxG.score += 28;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (shoot) {
				//Fire a bullet in the direction of the player.
				//or striaght down if its easier.
			}
			
			if (y > FlxG.height) {
					exists = false;
			}
		}
	}
}