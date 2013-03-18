package  
{
	/**
	 * ...
	 * @author Adam
	 */
	public class Laser extends Bullet
	{
		
		public function Laser() 
		{
			super();
			makeGraphic(4, 50, 0xff4501ff);
			damage = 4;
			fireRate = 0;
			speed = 200;
		}
		
	}

}