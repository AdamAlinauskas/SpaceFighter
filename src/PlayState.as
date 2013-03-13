package  
{
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author Adam
	 */
	public class PlayState extends FlxState
	{
		private var player:Player;
		
		public function PlayState() 
		{
		
		}
		
		override public function create():void 
		{
			super.create();
			player = new Player();
			add(player);
		}
		
		override public function update():void 
		{
			super.update();
		}
	}
}