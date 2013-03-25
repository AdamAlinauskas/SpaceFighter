package  
{
	import org.flixel.*;
	
	public class ApplicationSettings
	{
		public static var numberOfEnemies:int = 50;
		public static var enemyReleaseRate:int = 1000;
		//public static var enemiesKilledOrRemovedFromTheScreen = 0;
		
		public static function finshedLevel():Boolean 
		{
			return Registry.Enemies.countDead() == numberOfEnemies
			//return enemiesKilledOrRemovedFromTheScreen == numberOfEnemies
		};
	}
}