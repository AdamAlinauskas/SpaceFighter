package  
{
	import flash.utils.setTimeout;
	import org.flixel.FlxGroup;
	
	public class WeaponManager extends FlxGroup
	{
		private var canFire:Boolean = true;
		private var weapon:Weapon;

		public function WeaponManager() 
		{
			super();
		}
	
		public function fire(bx:int, by:int):void {
			weapon.fire(bx, by,this);
		}
		
		public function load(weapon:Weapon):void {
			clear();
			this.weapon = weapon;
			weapon.addBulletsTo(this);
		}
		
	}

}