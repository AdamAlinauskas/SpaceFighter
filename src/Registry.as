package  
{
	/**
	 * ...
	 * @author Adam
	 */
	public class Registry 
	{
		public static var weaponManager:WeaponManager = new WeaponManager;
		public static var Enemies:EnemyManager = new EnemyManager;
		public static var Blood:BloodManager = new BloodManager;
		public static var SpaceShip:Player = new Player;
		public static var enemyBullet:EnemyBulletManager = new EnemyBulletManager;
		public static var weaponPowerUp:WeaponPowerUpManager = new WeaponPowerUpManager;
		public static var endLevel:EndLevelOrGameManager = new EndLevelOrGameManager;
		public static var health:Health = new Health;
		
		
		public function Registry() 
		{
		}
	}

}