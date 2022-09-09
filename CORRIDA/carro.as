package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class carro extends MovieClip {
		private var teclaDireita:Boolean = false;
		private var teclaEsquerda:Boolean = false;
		private var teclaSobe:Boolean = false;
		private var teclaDesce:Boolean = false;
		private var colidiraAEsquerda:Boolean = false;
		private var colidiraADireita:Boolean = false;
		private var colidiraAcima:Boolean = false;
		private var colidiraAbaixo:Boolean = false;
		private var margem_esq:Number = 0;
		private var margem_dir:Number = 0;
		private var margem_sup:Number = 0;
		private var margem_inf:Number = 0;
		private var distX:Number = 5;
		private var distY:Number = 5;
		private var proximoX:Number;
		private var proximoY:Number;
		
		public function carro() {
			this.x = 50;
			this.y = 50;
		}
		
		public function controles(){
			stage.addEventListener(KeyboardEvent.KEY_DOWN, pressionar);
			stage.addEventListener(KeyboardEvent.KEY_UP, soltar);
			stage.addEventListener(Event.ENTER_FRAME, testa_tecla);
		}
		
		private function pressionar(event:KeyboardEvent){
			if(event.keyCode == 37){
				teclaEsquerda = true;
			}
			
			if(event.keyCode == 39){
				teclaDireita = true;
			}
			
			if(event.keyCode == 38){
				teclaSobe = true;
			}
			
			if(event.keyCode == 40){
				teclaDesce = true;
			}
		}
		
		private function soltar(event:KeyboardEvent){
			if(event.keyCode == 37){
				teclaEsquerda = false;
			}
			
			if(event.keyCode == 39){
				teclaDireita = false;
			}
			
			if(event.keyCode == 38){
				teclaSobe = false;
			}
			
			if(event.keyCode == 40){
				teclaDesce = false;
			}
		}
		
		private function testa_tecla(evt:Event){
			
			colidiraADireita = false;
			colidiraAEsquerda = false;
			colidiraAcima = false;
			colidiraAbaixo = false;
			//PERCORRE TODO O VETOR BARREIRAS TESTANDO COLISÕES E ATUALIZANDO A POSIÇÃO DO PERSONAGEM
			for (var i:Number=0; i<MovieClip(parent).barreiras.length; i++){
				//INCLUI O TAMANHO DO PERSONAGEM NO CÁLCULO DA MARGEM
				margem_dir=MovieClip(parent).barreiras[i].margem_dir + this.width/2;
				margem_esq=MovieClip(parent).barreiras[i].margem_esq - this.width/2;
				margem_sup=MovieClip(parent).barreiras[i].margem_sup - this.height/2;
				margem_inf=MovieClip(parent).barreiras[i].margem_inf + this.height/2;
				//TESTA COLISÃO A DIREITA E ESQUERDA
				if (this.y >= margem_sup && this.y <= margem_inf){
					if(teclaDireita && this.x + distX >= margem_esq && this.x-1 < margem_esq){
						colidiraAEsquerda = true;
						proximoX = margem_esq;
						//break;
					}
					if(teclaEsquerda && this.x - distX <= margem_dir && this.x+1 > margem_dir) {
						colidiraADireita = true;
						proximoX = margem_dir;
						//break;
					}	
				}
				//TESTA COLISÃO ACIMA E ABAIXO
				if (this.x >= margem_esq && this.x <= margem_dir){
					if(teclaSobe && this.y - <= margem_inf && this.y +1 > margem_inf) {
						colidiraAbaixo = true;
						proximoY = margem_inf;
						//break;
					}
					if(teclaDesce && this.y + distY >= margem_sup && this.y -1 < margem_sup) {
						colidiraAcima = true;
						proximoY = margem_sup;
						//break;
						}
				}
			}
			//DESLOCAMENTO QUANDO NÃO OCORRE COLISÃO	
			if(!colidiraADireita && teclaEsquerda && this.x >= this.width/2){
				proximoX = this.x - distX;
				};
			if(!colidiraAEsquerda && teclaDireita && this.x <= stage.stageWidth-this.width/2){
				proximoX = this.x + distX;
				}
			if(!colidiraAbaixo && teclaSobe && this.y >= this.height/2){
				proximoY = this.y - distY;
				}
			if(!colidiraAcima && teclaDesce && this.y <= stage.stageHeight-this.height/2){
				proximoY = this.y + distY;
				}
			//ATUALIZA O VALOR DO PERSONAGEM
			this.x = proximoX
			this.y = proximoY
		}
	}
}