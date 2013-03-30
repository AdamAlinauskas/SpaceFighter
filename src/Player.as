package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Adam
	 */
	public class Player extends FlxSprite
	{

		[Embed(source="../assets/hit.mp3")] private var hitMusic:Class;		
		[Embed(source = '../assets/player.png')] public static var spriteSheet:Class;
		public function Player() 
		{
			super(FlxG.width / 2, FlxG.height - 50);
			makeGraphic(12, 12, 0xffaa1111);
			loadGraphic(spriteSheet,true,true,12,12);
			acceleration.x = 50;
			maxVelocity.x = 200;
			drag.x = maxVelocity.x * 4;
			
			acceleration.y = 50;
			maxVelocity.y = 200;
			drag.y = maxVelocity.y * 4;
			
			health = 4;
			
			addAnimation("normal", [0]);
			addAnimation("double", [1]);
			addAnimation("zigzag", [2]);
			addAnimation("hurt", [3,4],3,true);
		}
		
		public static var normalShip:String = "normal";
		public static var doubleWeaponShip:String = "double";
		public static var ZigZagWeaponShip:String = "zigzag";
		public static var hurtShip:String = "hurt";
		
		public function playAnimation(animation:String):void {
			if (health == 1) {
				play(hurtShip);
			}
			else{	
				play(animation);
			}
		}
		       
		override public function update():void 
		{
			super.update();
			
			acceleration.x = 0;
			acceleration.y = 0;
			
			if (FlxG.keys.RIGHT) {
				acceleration.x = maxVelocity.x * 4;
			}
			if (FlxG.keys.LEFT) {
				acceleration.x = -maxVelocity.x * 4;
			}
			
			if (FlxG.keys.UP) {
				acceleration.y = -maxVelocity.y * 4;
			}
			if (FlxG.keys.DOWN) {
				acceleration.y = maxVelocity.y * 4;
			}
			
			if (FlxG.keys.SPACE) {
				Registry.weaponManager.fire(x, y);
			}
			
			if (FlxG.width == x){
				acceleration.x = 0
				velocity.x = 0;
			}
			
			boundaryCheck();
		}
		
		private function boundaryCheck():void {
			if (!FlxG.keys.RIGHT && x <= 1) {
				acceleration.x = 0;
				velocity.x=0
			}
			
			if (!FlxG.keys.LEFT && x >= FlxG.width-width) {
				acceleration.x = 0;
				velocity.x=0
			}
			
			if (!FlxG.keys.UP && y >= FlxG.height-height) {
				acceleration.y = 0;
				velocity.y=0
			}
			
			if (!FlxG.keys.DOWN && y <= 0) {
				acceleration.y = 0;
				velocity.y=0
			}	
		}

		override public function hurt(Damage:Number):void{
            super.hurt(Damage);
            GameSound.play(hitMusic, .1);	
			if (health == 1) {
					play(hurtShip);
			}
		}
		
		public function bulletHit(bullet:FlxObject, player:FlxObject):void
        {
            bullet.kill();
            hurt(EnemyBullet(bullet).damage);
			player.flicker();
            Registry.Blood.explodeBlock(x, y);
        }
	}

}