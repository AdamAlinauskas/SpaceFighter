package  
{
	/**
	 * ...
	 * @author Adam
	 */
	public class Registry 
	{
		public static var weaponManager:WeaponManager;
		public static var Enemies:EnemyManager;
		public static var Blood:BloodManager;
		public static var SpaceShip:Player = new Player;
		public static var enemyBullet:EnemyBulletManager;
		public static var weaponPowerUp:WeaponPowerUpManager;
		public function Registry() 
		{
			
		}
		
		public static function load() {
			weaponManager = new WeaponManager;
			Enemies = new EnemyManager;
			Blood = new BloodManager;
			enemyBullet = new EnemyBulletManager;
			weaponPowerUp = new WeaponPowerUpManager;
		}
		
	}

}