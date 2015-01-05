package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Daniel
	 */
	public class Main extends Sprite 
	{
		private var aDown:Boolean = false;
		private var dDown:Boolean = false;
		private var char:Player = new Player();
		private var blocks:Array = [];
		private var coins:Array = [];
		private var map:Array = [
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0],
		[0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0],
		[0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0],
		[1, 1, 1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2],
		[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
		];
		
		
		public function Main():void 
		{
			char.x = 500;
			char.y = 300;
			addChild(char);
			for (var i:int = 0; i < map.length; i++)
			{
				for (var j:int = 0; j < map[0].length; j++)
				{
					if (map[i][j] == 1)
					{
						var block:Block = new Block();
						block.x = j * 50 + 25;
						block.y = i * 50 + 25;
						blocks.push(block);
						addChild(block);
					}
					if (map[i][j] == 2)
					{
						var coin:Coin = new Coin();
						coin.x = j * 50 + 25;
						coin.y = i * 50 + 25;
						coins.push(coin);
						addChild(coin);
					}
				}
			}
			stage.addEventListener(Event.ENTER_FRAME, checkStuff);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keysDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keysUp);
		}
		public function checkStuff(e:Event):void 
		{
		
			if (aDown)
				char.x -= 5;
			if (dDown)
				char.x += 5;
			char.adjust();
			for (var i:int = 0; i < blocks.length; i++)
			{
				blocks[1].checkObj(char, 1);
			}
			for (var s:int = coins.length - 1; s >= 0; s--)
			{
				if (coins[s].checkObj(char)&&!coins[s],removed)
				{
					removeChild(coins[s]);
					coins.splice(s, 1);
				}
			}

		}
		public function keysDown(e:KeyboardEvent):void
		{
			if (e.keyCode == 65)
				aDown = true;
			if (e.keyCode == 68)
				dDown = true;
			if (e.keyCode == 87&&char.y+char.width/2==char.floor)
			char.grav = -15;
		}
		public function keysUp(e:KeyboardEvent):void
		{
			if (e.keyCode == 65)
				aDown = false;
			if (e.keyCode == 68)
				dDown = false;
		}
		
		
	}
}