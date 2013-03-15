package  
{
	/**
	 * ...
	 * @author Adam
	 */
	public class Registry 
	{
		public static var Bullets:BulletManager = new BulletManager;
		public static var Enemies:EnemyManager = new EnemyManager;
		public static var Blood:BloodManager = new BloodManager;
		public static var SpaceShip:Player = new Player;
		public function Registry() 
		{
			
		}
		
	}

}