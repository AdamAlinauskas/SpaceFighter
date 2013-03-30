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
        private var releaseRate:int = ApplicationSettings.currentLevel.enemyReleaseRate;
		private var enemies:Array = new Array;
		
		public function EnemyManager() 
		{
			super();
			for (var i:int = 0; i < ApplicationSettings.currentLevel.numberOfEnemies; i++)
            {
                enemies.push(new Enemy);
            }
		}
		
		override public function update():void
        {
            super.update();
            
            if (getTimer() > lastReleased + releaseRate)
            {
				if (super.countLiving()  < ApplicationSettings.maxNumberOfEnemiesOnTheScreenAtATime()){
					lastReleased = getTimer();
					release();
				}
            }
        }
		
		public function release():void
        {
			var enemiesTorelease:Array = new Array;
			for (var i:int = 0; i < ApplicationSettings.numberOfEnemiesToReleaseAtATime(); i++) 
			{
				enemiesTorelease.push(enemies.pop());
			}
			
			var enemy:Enemy = Enemy(enemiesTorelease.pop());
			while (enemy != null) {
				
				add(enemy);
				enemy.launch();
				ApplicationSettings.totalNumberOfEnemiesReleased += 1;
				enemy = enemiesTorelease.pop();
			}
        }
		
		public function bulletHitEnemy(bullet:FlxObject, enemy:FlxObject):void
        {
            bullet.kill();
            enemy.hurt(1);
        }

        public function removeAll():void{
        	super.clear();
        	enemies = [];
        }	
	}

}