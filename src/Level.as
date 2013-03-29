package  
{
	/**
	 * ...
	 * @author Adam
	 */
	public class Level 
	{
		public var numberOfEnemies:int;
		public var enemyReleaseRate:int;
		public var numberOfEnemiesToReleaseAtATime:int
		public var maxNumberOfEnemiesOnTheScreenAtATime:int
		
		public function Level(numberOfEnemies:int, enemyReleaseRate:int, numberOfEnemiesToReleaseAtATime:int,maxNumberOfEnemiesOnTheScreenAtATime:int) 
		{
			this.enemyReleaseRate = enemyReleaseRate;
			this.numberOfEnemies = numberOfEnemies;
			this.numberOfEnemiesToReleaseAtATime = numberOfEnemiesToReleaseAtATime;
			this.maxNumberOfEnemiesOnTheScreenAtATime = maxNumberOfEnemiesOnTheScreenAtATime;
		}
		
	}
}