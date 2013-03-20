package  
{
	/**
	 * ...
	 * @author Adam
	 */
	public class ClassicBulletWeaponPowerUp extends WeaponPowerUp
	{
		
		public function ClassicBulletWeaponPowerUp() 
		{
			
		}
		
		override public function makeBullet():Object 
		{
			return new Bullet;
		}
		
	}

}