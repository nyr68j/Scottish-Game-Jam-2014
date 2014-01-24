package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Vimarsh Raina
	 */
	public class AnimatedSprite extends Bitmap
	{
		private var sourceBitmap:Bitmap;
		
		private var frameWidth:int;
		private var frameHeight:int;
		
		private var currentWidth:int;
		private var currentHeight:int;
		
		public function AnimatedSprite() 
		{
			if (stage)
			{
				Initialize();
			}
			else
			{
				addEventListener(Event.ADDED_TO_STAGE, Initialize);
			}
		}
		
		private function Initialize(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, Initialize);
			
			frameHeight = 0;
			frameWidth = 0;
			
			currentHeight = 0;
			currentWidth = 0;
		}
		
		public function InitSprite(spriteSheet:Bitmap, fWidth:int, fHeight:int)
		{
			sourceBitmap = spriteSheet;

			frameHeight = fHeight;
			frameWidth = fWidth;
			
			bitmapData = new BitmapData(fWidth, fHeight);
			bitmapData.copyPixels(sourceBitmap.bitmapData, new Rectangle(currentWidth, currentHeight, frameWidth, frameHeight),
												new Point(0, 0));
												
			stage.addChild(this);
		}
		
		public function NextFrame():void
		{
			currentWidth += frameWidth;
			
			if (currentWidth >= sourceBitmap.width)
			{
				currentWidth = 0;
				currentHeight += frameHeight;
				
				if (currentHeight >= sourceBitmap.height)
				{
					currentHeight = 0;
				}
			}
			
			bitmapData.copyPixels(sourceBitmap.bitmapData, new Rectangle(currentWidth, currentHeight, frameWidth, frameHeight),
												new Point(0, 0));
		}
		
	}

}