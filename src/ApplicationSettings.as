package  
{
	import org.flixel.*;
	
	public class ApplicationSettings
	{
		
		private static var levels:Array;
		public static var currentLevel:Level;
		
		
		public static function finshedLevel():Boolean 
		{
			return Registry.Enemies.countDead() == currentLevel.numberOfEnemies;
		};
		
		public static function LoadLevel(myLevels:Array):void {
			 levels = myLevels.reverse();
			 currentLevel = levels.pop();
		}
		
		public static function loadNextLevel():void {
			currentLevel = levels.pop();
			Registry.Enemies = new EnemyManager;
		}
		
		public static function hasNextLevel():Boolean {
			return levels.length > 0;
		}
	}	
}