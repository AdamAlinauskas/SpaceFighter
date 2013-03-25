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
        private var releaseRate:int = ApplicationSettings.enemyReleaseRate;
		private var enemies:Array = new Array;
		
		public function EnemyManager() 
		{
			super();
			for (var i:int = 0; i < ApplicationSettings.numberOfEnemies; i++)
            {
                enemies.push(new Enemy);
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
            var enemy:Enemy = Enemy(enemies.pop());
            
            if (enemy)
            {
				add(enemy);
                enemy.launch();
            }
        }
		
		public function bulletHitEnemy(bullet:FlxObject, enemy:FlxObject):void
        {
            bullet.kill();
            enemy.hurt(1);
        }	
	}

}