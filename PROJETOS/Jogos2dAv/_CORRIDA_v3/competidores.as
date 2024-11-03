package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class competidores extends MovieClip {
		public var xInicial:Number = 50;
		public var yInicial:Number = 50;
		public var velocidade:Number = 2;
		
		public function competidores() {
			this.x = xInicial;
			this.y = yInicial;
			
			// MOVE
			addEventListener(Event.ENTER_FRAME, move_interno);
		}
		
		private function move_interno(evt:Event):void {				
			//trace("X: " + this.x);
			//trace("Y: " + this.y);
			
			if(this.x < 360 && this.y <= 50){
				this.x += this.velocidade;
			} else if(this.x >= 360 && this.y < 360){
				this.y += this.velocidade;
			} else if(this.x >= 50 && this.y <= 360){
				this.x -= this.velocidade;
			}  else if(this.x <= 50 && this.y <= 360){
				this.y -= this.velocidade;
			} 
			
			//trace(this.x);
		}

	}
	
}
