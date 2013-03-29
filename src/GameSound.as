package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxSound;
	/**
	 * ...
	 * @author Adam
	 */
	public class GameSound 
	{
		
		public function GameSound() 
		{
				
		}
		
		public static function play(EmbeddedSound:Class,Volume:Number=1.0,Looped:Boolean=false,AutoDestroy:Boolean=true):FlxSound {
			
			if(ApplicationSettings.canPlaySound())
				return FlxG.play(EmbeddedSound,Volume,Looped,AutoDestroy);
			else
				return null;
		}
		
	}

}