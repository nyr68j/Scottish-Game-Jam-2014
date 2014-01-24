package  
{
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	/**
	 * ...
	 * @author Vimarsh Raina
	 */
	public class SoundEffect extends Sound
	{
		private var channel:SoundChannel;
		
		public function SoundEffect() 
		{
			
		}
		
		private function InitSound(sound:Sound, sChannel:SoundChannel):void
		{
			this = sound;
			channel = sChannel;
		}
		
		public function PlaySound():void
		{
			channel = this.play(0, 0);
		}
		
		public function PlaySoundLoop():void
		{
			channel = this.PlaySoundLoop();	//if it doesn't work
			
			//channel = this.play();
			
			//channel.addEventListener(Event.SOUND_COMPLETE, onSoundComplete);
		}
		
		private function onSoundComplete(e:Event = null):void
		{
			//channel.removeEventListener(Event.SOUND_COMPLETE, onSoundComplete);
			//channel = this.play();
			//channel.addEventListener(Event.SOUND_COMPLETE, onSoundComplete);
		}
	}

}