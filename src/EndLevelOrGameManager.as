package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Adam
	 */
	public class EndLevelOrGameManager extends FlxGroup
	{
		private var message;
		public function EndLevelOrGameManager() 
		{
			message = new FlxText(0, FlxG.height / 2, FlxG.width, "You Win");
			message.setFormat(null, 12, 0xff009900,"center");
			add(message);
			message.exists = false;
		}
		
		override public function update():void 
		{
			super.update();
			if (ApplicationSettings.finshedLevel()) {
				message.exists = true;
				if (ApplicationSettings.hasNextLevel()) {
    					message.text = "Level complete. Press X to play the next level.";
					if (FlxG.keys.X) {
						ApplicationSettings.loadNextLevel();
						Registry.Enemies = new EnemyManager;
						add(Registry.Enemies);
					}
				}
				else {
					message.text = "You Win";
					
				}
					
			}
			else {
					message.exists = false;
			}
		}
		
	}

}