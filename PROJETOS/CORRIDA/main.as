package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class main extends MovieClip{
		public var carro_obj:carro = new carro();
		public var competidor1_obj:competidor1 = new competidor1(5);
		public var competidor2_obj:competidor2 = new competidor2(7);
		public var competidor3_obj:competidor3 = new competidor3(2);
		public var barreiras:Array = new Array();
		public var trackPoints:Array = new Array();
		private var barreira:Object;
		private var trackPoint:Object;
		
		public function main() {
			addChild(carro_obj);
			carro_obj.controles();
			addChild(competidor1_obj);
			addChild(competidor2_obj);
			addChild(competidor3_obj);
			montaVetores();
		}
		
		private function montaVetores() {
			for (var i:int=0; i<numChildren;i++) {
				var objeto:Object = getChildAt(i);
				if (objeto is barreira_padrao) {
					barreira = new Object();
					barreira.objeto = objeto;
					barreira.margem_dir = objeto.x + objeto.width/2;
					barreira.margem_esq = objeto.x - objeto.width/2;
					barreira.margem_sup = objeto.y - objeto.height/2;
					barreira.margem_inf = objeto.y + objeto.height/2;
					barreiras.push(barreira);
				}
				if (objeto is trackPoint_padrao) {
					trackPoint = new Object();
					trackPoint = objeto;
					trackPoints.push(trackPoint);
				}		
			}
			trace(barreiras);
			trace(trackPoints);
		}
	}
}
