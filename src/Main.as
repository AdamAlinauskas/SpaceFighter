package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Adam
	 */
	[SWF(width="800", height="600",backgroundColor="#008800")]
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			var game:Game = new Game();
			ApplicationSettings.LoadLevel(
			[new Level(10, 1000, 1, 2), 
			new Level(20,1000,1,10),
			new Level(50,500,1,10)]);
			
			
			//new Level(20,3000,2),new Level(30,1000,1),new Level(50,1000,1)])

			addChild(game);
		}
		
	}
	
}