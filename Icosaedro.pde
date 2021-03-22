static String paramsIcosaedro="Radio=150";

class Icosaedro extends Figura{
  float radio = 150;
  //interno variables
  float x, y, z;
  float w, h, d;
  PVector puntoSuperior;
  PVector[] pentSuperior = new PVector[5];
  PVector puntoInferior;
  PVector[] pentInferior = new PVector[5];
  float angulo = 0;
  float triDist;
  float triAlt;
  float a, b, c;
  public Icosaedro(ParamsFigura params){
    super(params);
    //Asignar los parámetros
    for(String linea : params.paramsFigura){
      String[] datos=linea.split("=");
      if(datos[0].equals("Radio")){
        this.radio=Float.parseFloat(datos[1]);
      }
    }
    creaFigura();
  }
  
  // Calcula la geometría
  void init(){
    c = dist(cos(0)*radio, sin(0)*radio, cos(radians(72))*radio,  sin(radians(72))*radio);
    b = radio;
    a = (float)(Math.sqrt(((c*c)-(b*b))));

    triAlt = (float)(Math.sqrt((c*c)-((c/2)*(c/2))));

    for (int i=0; i<pentSuperior.length; i++){
      pentSuperior[i] = new PVector(cos(angulo)*radio, sin(angulo)*radio, triAlt/2.0f);
      angulo+=radians(72);
    }
    puntoSuperior = new PVector(0, 0, triAlt/2.0f+a);
    angulo = 72.0f/2.0f;
    for (int i=0; i<pentSuperior.length; i++){
      pentInferior[i] = new PVector(cos(angulo)*radio, sin(angulo)*radio, -triAlt/2.0f);
      angulo+=radians(72);
    }
    puntoInferior = new PVector(0, 0, -(triAlt/2.0f+a));
  }
  
  void creaFigura() { 
    init();
    PShape icosaedro=createShape(GROUP);
    //Ajusta parámetros en el createShape inicial o en cada beginShape, ejemplo en cilindro
    fill(conColor);
    if(!conStroke) noStroke();
    else stroke(0);
    if(!conFill) noFill();
    for (int i=0; i<pentSuperior.length; i++){
      // icosahedron top
      PShape interno=createShape();
      
      interno.beginShape();
      if (i<pentSuperior.length-1){
        interno.vertex(x+pentSuperior[i].x, y+pentSuperior[i].y, z+pentSuperior[i].z);
        interno.vertex(x+puntoSuperior.x, y+puntoSuperior.y, z+puntoSuperior.z);
        interno.vertex(x+pentSuperior[i+1].x, y+pentSuperior[i+1].y, z+pentSuperior[i+1].z);
      } 
      else {
        interno.vertex(x+pentSuperior[i].x, y+pentSuperior[i].y, z+pentSuperior[i].z);
        interno.vertex(x+puntoSuperior.x, y+puntoSuperior.y, z+puntoSuperior.z);
        interno.vertex(x+pentSuperior[0].x, y+pentSuperior[0].y, z+pentSuperior[0].z);
      }
      interno.endShape(CLOSE);
      icosaedro.addChild(interno);
      
      interno=createShape();
      // icosahedron bottom
      interno.beginShape();
      if (i<pentInferior.length-1){
        interno.vertex(x+pentInferior[i].x, y+pentInferior[i].y, z+pentInferior[i].z);
        interno.vertex(x+puntoInferior.x, y+puntoInferior.y, z+puntoInferior.z);
        interno.vertex(x+pentInferior[i+1].x, y+pentInferior[i+1].y, z+pentInferior[i+1].z);
      } 
      else {
        interno.vertex(x+pentInferior[i].x, y+pentInferior[i].y, z+pentInferior[i].z);
        interno.vertex(x+puntoInferior.x, y+puntoInferior.y, z+puntoInferior.z);
        interno.vertex(x+pentInferior[0].x, y+pentInferior[0].y, z+pentInferior[0].z);
      }
      interno.endShape(CLOSE);
      icosaedro.addChild(interno);
    }

    // icosahedron body
    for (int i=0; i<pentSuperior.length; i++){
      PShape interno=createShape();
      if (i<pentSuperior.length-2){
        interno=createShape();
        interno.beginShape();
        interno.vertex(x+pentSuperior[i].x, y+pentSuperior[i].y, z+pentSuperior[i].z);
        interno.vertex(x+pentInferior[i+1].x, y+pentInferior[i+1].y, z+pentInferior[i+1].z);
        interno.vertex(x+pentInferior[i+2].x, y+pentInferior[i+2].y, z+pentInferior[i+2].z);
        interno.endShape(CLOSE);
        icosaedro.addChild(interno);
        
        interno=createShape();
        interno.beginShape();
        interno.vertex(x+pentInferior[i+2].x, y+pentInferior[i+2].y, z+pentInferior[i+2].z);
        interno.vertex(x+pentSuperior[i].x, y+pentSuperior[i].y, z+pentSuperior[i].z);
        interno.vertex(x+pentSuperior[i+1].x, y+pentSuperior[i+1].y, z+pentSuperior[i+1].z);
        interno.endShape(CLOSE);
        icosaedro.addChild(interno);
      } 
      else if (i==pentSuperior.length-2){
        interno=createShape();
        interno.beginShape();
        interno.vertex(x+pentSuperior[i].x, y+pentSuperior[i].y, z+pentSuperior[i].z);
        interno.vertex(x+pentInferior[i+1].x, y+pentInferior[i+1].y, z+pentInferior[i+1].z);
        interno.vertex(x+pentInferior[0].x, y+pentInferior[0].y, z+pentInferior[0].z);
        interno.endShape(CLOSE);
        icosaedro.addChild(interno);

        interno=createShape();
        interno.beginShape();
        interno.vertex(x+pentInferior[0].x, y+pentInferior[0].y, z+pentInferior[0].z);
        interno.vertex(x+pentSuperior[i].x, y+pentSuperior[i].y, z+pentSuperior[i].z);
        interno.vertex(x+pentSuperior[i+1].x, y+pentSuperior[i+1].y, z+pentSuperior[i+1].z);
        interno.endShape(CLOSE);
        icosaedro.addChild(interno);
      }
      else if (i==pentSuperior.length-1){
        interno=createShape();
        interno.beginShape();
        interno.vertex(x+pentSuperior[i].x, y+pentSuperior[i].y, z+pentSuperior[i].z);
        interno.vertex(x+pentInferior[0].x, y+pentInferior[0].y, z+pentInferior[0].z);
        interno.vertex(x+pentInferior[1].x, y+pentInferior[1].y, z+pentInferior[1].z);
        interno.endShape(CLOSE);
        icosaedro.addChild(interno);

        interno=createShape();
        interno.beginShape();
        interno.vertex(x+pentInferior[1].x, y+pentInferior[1].y, z+pentInferior[1].z);
        interno.vertex(x+pentSuperior[i].x, y+pentSuperior[i].y, z+pentSuperior[i].z);
        interno.vertex(x+pentSuperior[0].x, y+pentSuperior[0].y, z+pentSuperior[0].z);
        interno.endShape(CLOSE);
        icosaedro.addChild(interno);
      }
    }
    
    shape=icosaedro;
  }
}
