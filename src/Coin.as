package  
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Daniel
	 */
	public class Coin extends MovieClip 
	{
		
		public function Coin() 
		{
			this.graphics.beginFill(0xFF6600, 1);
			this.graphics.drawEllipse(x - 10, y - 20, 22, 40);
			this.graphics.endFill();
			
		}
		
		public function checkObj(obj:MovieClip):Boolean
		{
			if (Match.abs(obj.x - x) < width && Math.abs(obj.y - y < height)
				return true;
			return false;
		}
	}

}