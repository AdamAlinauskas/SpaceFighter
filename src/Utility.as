package  
{
	public class Utility 
	{
		public function Utility() {	}
		
		public static function RandomNumberBetween(from:int, to:int):int {
			return Math.floor(Math.random()*(to-from+1)+from);
		}
		
		 public static function chanceRoll(chance:uint = 50):Boolean
		{
				if (chance <= 0 )
						return false;
				else if (chance >= 100)
						return true;
				else
				{
						if (Math.random() * 100 >= chance)
								return false;
						else
								return true;
				}
		}

	}
}