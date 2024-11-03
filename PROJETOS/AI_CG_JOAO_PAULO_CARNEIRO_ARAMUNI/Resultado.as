package {
    public class Resultado {
        public function Resultado() {
        /*CONSTRUTOR*/
        }
		/*MÉTODOS*/
	    public function ResFinais(pontos:String, balas:String, vida:String, relogio:String) {
		  this.pt = pontos;
		  this.bs = balas;
		  this.vd = vida;
		  this.rl = relogio;
        }
		/*PROPRIEDADES*/
		public var pt:String;
		public var bs:String;
		public var vd:String;
		public var rl:String;
    }
}