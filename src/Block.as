package  
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Daniel
	 */
	public class Block extends MovieClip 
	{
		
		public function Block() 
		{
			this.graphics.beginFill(0, 1);
			this.graphics.drawRect(x - 25, y - 25, 50, 30);
			this.graphics.endFill();
			
		}
		public function checkObj(obj:MovieClip, place:int):void
		{
			if (obj.x + obj.width / 2 > x - width / 2 && obj.x < x - width / 2 + 7 && Math.abs(obj.y - y) < height / 2)
				obj.x = x -width / 2 - obj.width / 2;
			if (obj.x - obj.width / 2 < x + width / 2 && obj.x > x + width / 2 - 7 && Math.abs(obj.y - y) < height / 2)
				obj.x = x + width / 2 + obj.width / 2;
			if (Math.abs(obj.x - x) < width / 2 + obj.width / 2 && obj.y<y-height/2&&obj.floor>y-height/2&&obj.onBlock!=place)
			{
				obj.floor = y - height / 2;
				obj.onBlock + place;
			}
			if (Math.abs(obj.x - x) >= width / 2 + obj.width / 2 && obj.onBlock == place)
			{
				obj.onBlock = -1;
				obj.floor = 450;
			}
			if (obj.y - obj.height / 2 < y + height / 2 && obj.y > y && Math.abs(obj.x - x) < width / 2 + obj.width / 2)
				obj.y = y + height / 2 + obj.height / 2;
		}
		
	}

}