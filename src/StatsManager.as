package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Adam
	 */
	public class StatsManager extends FlxGroup
	{
		private var score:FlxText;
		private var level:FlxText;
		
		private var numberOfEnemiesKilled:FlxText;
		private var totalNumberofEnemies:FlxText;
		private var killPercentage:FlxText;
		
		
		private var health:Health = new Health;

		public function StatsManager() 
		{
			score = new FlxText(3, 0, 100);
			level = new FlxText(FlxG.width - 45, 0,100);
			level.color = score.color = 0xB2B200;
			
			killPercentage = setTextSize(new FlxText(0, 40, 150));
			numberOfEnemiesKilled = setTextSize(new FlxText(0, 30, 150));
			totalNumberofEnemies = setTextSize(new FlxText(0, 20, 150));

			add(totalNumberofEnemies);
			add(numberOfEnemiesKilled);
			add(killPercentage)
			
			add(score);
			add(health);
			add(level);
		}
		
		private var statTextY:int = FlxG.height/2 -50;
		
		private function setTextSize(text:FlxText):FlxText {
			text.size = 8;
			text.alignment = "left";
			text.color = ApplicationSettings.endOfLevelTextColor;
			text.x = FlxG.width/2-50;
			text.y = statTextY;
			statTextY -= 10;
			return text;
		}
		
		override public function update():void 
		{
			super.update();
			score.text = "Score " + FlxG.score;
			level.text = "Level " + ApplicationSettings.currentLevelNumber;
			
			totalNumberofEnemies.exists = ApplicationSettings.finshedLevel();
			killPercentage.exists = ApplicationSettings.finshedLevel();
			numberOfEnemiesKilled.exists = ApplicationSettings.finshedLevel();
			
			totalNumberofEnemies.text = "Enemies encountered " + ApplicationSettings.totalNumberOfEnemiesReleased;
			numberOfEnemiesKilled.text = "Killed " + ApplicationSettings.numberOfEnemiesKilled;
			killPercentage.text = "Kill rate " + ((ApplicationSettings.numberOfEnemiesKilled / ApplicationSettings.totalNumberOfEnemiesReleased) * 100).toFixed(2) + "%";
		}
	}

}