package  
{
	import flash.utils.setInterval;
	import flash.utils.setTimeout;
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
			
			var direction:int = -1;
			
			if (x < FlxG.width / 2)
				direction = 1;
			
			velocity.x = int(Math.random() * 25) * direction;
			velocity.y = 50;
			health = 2;
			exists = true;
			shoot = false;
			if (Utility.chanceRoll(50)) {
				setTimeout(function():void { shoot = true; }, 1000);
			}
		}
		
		private function direction():int {
			var value = Utility.RandomNumberBetween(0, 100) % 2;
			return value == 0 ? 1 : -1;
		}
		
		override public function kill():void 
		{
			super.kill();
			FlxG.score += 1;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (shoot ==true) {
				//Fire a bullet in the direction of the player.
				//or striaght down if its easier.
				shoot = false;
				var bullet:EnemyBullet = EnemyBullet(Registry.enemyBullet.getFirstAvailable());
				if(bullet)
					bullet.fire(x + 5, y + 5);
				
			}
			
			if (y > FlxG.height) {
					exists = false;
			}
		}
	}
}