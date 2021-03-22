static String paramsCilindro="Radio=100\nAltura=300";

class Cilindro extends Figura{
  //Parametros por defecto por si acaso
  float radio=100;
  float altura=300;
  public Cilindro(ParamsFigura params){
    super(params);
    //Asignar los parámetros
    for(String linea : params.paramsFigura){
      String[] datos=linea.split("=");
      if(datos[0].equals("Radio")){
        this.radio=Float.parseFloat(datos[1]);
      }
      if(datos[0].equals("Altura")){
        this.altura=Float.parseFloat(datos[1]);
      }
    }
    creaFigura();
  }
  
  void creaFigura() {
    int lados=30;
    PShape cilindro = createShape(GROUP);
    //En el createShape inicial o en cada beginShape
    fill(conColor);
    if(!conStroke) noStroke();
    else stroke(0);
    if(!conFill) noFill();
    
    float angulo = 360 / lados;
    float mediaAltura = altura / 2;
   
    // draw superior of the tube
    PShape superior = createShape();
    superior.beginShape();
    
    for (int i = 0; i < lados; i++) {
      float x = cos( radians( i * angulo ) ) * radio;
      float y = sin( radians( i * angulo ) ) * radio;
      superior.vertex( x, y, -mediaAltura);
    }
    superior.endShape(CLOSE);
    cilindro.addChild(superior);
   
    // draw inferior of the tube
    PShape inferior = createShape();
    inferior.beginShape();
    for (int i = 0; i < lados; i++) {
      float x = cos( radians( i * angulo ) ) * radio;
      float y = sin( radians( i * angulo ) ) * radio;
      inferior.vertex( x, y, mediaAltura);
    }
    inferior.endShape(CLOSE);
    cilindro.addChild(inferior);
   
    // draw lados
    PShape medio = createShape();
    medio.beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < lados + 1; i++) {
      float x = cos( radians( i * angulo ) ) * radio;
      float y = sin( radians( i * angulo ) ) * radio;
      medio.vertex( x, y, mediaAltura);
      medio.vertex( x, y, -mediaAltura);
    }
    medio.endShape(CLOSE);
    cilindro.addChild(medio);
   
    shape=cilindro;
  }
}
