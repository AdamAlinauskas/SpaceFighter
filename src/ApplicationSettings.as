package  
{
	import org.flixel.*;
	
	public class ApplicationSettings
	{
		public static var endOfLevelTextColor:int = 0xffA4A4B2;
		private static var levels:Array;
		public static var currentLevel:Level;
		public static var currentLevelNumber:int = 0;
		public static var numberOfEnemiesKilled:int = 0;
		public static var totalNumberOfEnemiesReleased:int = 0;
		
		public static function numberOfEnemiesToReleaseAtATime():int {
			return currentLevel.numberOfEnemiesToReleaseAtATime;
		}
		
		public static function maxNumberOfEnemiesOnTheScreenAtATime():int {
			return currentLevel.maxNumberOfEnemiesOnTheScreenAtATime;
		}
		
		public static function finshedLevel():Boolean 
		{
			return Registry.Enemies.countDead() == currentLevel.numberOfEnemies || Registry.SpaceShip.health == 0;
		};
		
		public static function LoadLevel(myLevels:Array):void {
			 levels = myLevels.reverse();
			 loadNextLevel();
		}
		
		public static function loadNextLevel():void {
			currentLevel = levels.pop();
			Registry.Enemies = new EnemyManager;
			currentLevelNumber += 1;
		}
		
		public static function hasNextLevel():Boolean {
			return levels.length > 0;
		}
		
		public static function canPlaySound():Boolean {
			return Registry.SpaceShip.health > 1;
		}
	}	
}