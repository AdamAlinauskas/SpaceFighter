package  
{
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author Adam
	 */
	public class EnemyBulletManager extends FlxGroup
	{
		
		public function EnemyBulletManager() 
		{
			for (var i:int = 0; i < 10; i++) {
				add(new EnemyBullet);
			}
		}
		
	}

}