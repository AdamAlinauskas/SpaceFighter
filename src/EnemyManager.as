package  
{
	import org.flixel.*;
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author Adam
	 */
	public class EnemyManager extends FlxGroup
	{
		private var lastReleased:int;
        private var releaseRate:int = 500;
		
		public function EnemyManager() 
		{
			super();
			for (var i:int = 0; i < 100; i++)
            {
                add(new Enemy);
            }
		}
		
		override public function update():void
        {
            super.update();
            
            if (getTimer() > lastReleased + releaseRate)
            {
                lastReleased = getTimer();
                release();
            }
        }
		
		public function release():void
        {
            var enemy:Enemy = Enemy(getFirstAvailable());
            
            if (enemy)
            {
                enemy.launch();
            }
        }
		
		public function bulletHitEnemy(bullet:FlxObject, enemy:FlxObject):void
        {
            bullet.kill();
            enemy.hurt(1);
            FlxG.score += 1;
        }
		
		
	}

}