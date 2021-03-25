static String paramsPiramideCuadrada="base=200\naltura=300";//Modificar

class PiramideCuadrada extends Figura{
  //Parametros por defecto por si acaso
  float b=200;
  float h=200;
  public PiramideCuadrada(ParamsFigura params){
    super(params);
    //Asignar los parámetros
    for(String linea : params.paramsFigura){
      String[] datos=linea.split("=");
      if(datos[0].charAt(0)=='b'){
        this.b=Float.parseFloat(datos[1]);
      }
      if(datos[0].charAt(0)=='a'){
        this.h=Float.parseFloat(datos[1]);
      }
    }
    creaFigura();
  }
  
  void creaFigura() {
    
    PShape piramide = createShape(GROUP);
    //Ajusta parámetros en el createShape inicial o en cada beginShape, ejemplo en cilindro
    fill(conColor);
    if(!conStroke) noStroke();
    else stroke(0);
    if(!conFill) noFill();
    
    //Dibujar aquí
   
    PShape p = createShape();
    PShape p2 = createShape();
    PShape p3 = createShape();
    PShape p4 = createShape();
    PShape p5 = createShape();
    PShape p6 = createShape();
    
    p.beginShape();
     p.vertex(-b/2,0,0);
     p.vertex(-b/2,0,-b);
     p.vertex(b/2,0,-b);
     p.vertex(b/2,0,0);
     p.vertex(-b/2,0,0);
     p.endShape();
     piramide.addChild(p);
     
     p2.beginShape();
     p2.vertex(0,-h,-b/2);
     p2.vertex(b/2,0,0);
     p2.vertex(-b/2,0,0);
     p2.endShape();
     piramide.addChild(p2);
     
     p3.beginShape();
     p3.vertex(b/2,0,0);
     p3.vertex(b/2,0,-b);
     p3.vertex(0,-h,-b/2);
     p3.vertex(b/2,0,0);
     p3.endShape();
     piramide.addChild(p3);
     
     p4.beginShape();
     p4.vertex(b/2,0,-b);
     p4.vertex(-b/2,0,-b);
     p4.vertex(0,-h,-b/2);
     p4.vertex(b/2,0,-b);
     p4.endShape();
     piramide.addChild(p4);
     
     p5.beginShape();
     p5.vertex(-b/2,0,-b);
     p5.vertex(-b/2,0,0);
     p5.vertex(0,-h,-b/2);
     p5.vertex(-b/2,0,-b);
     p5.endShape();
     piramide.addChild(p5);

     
    shape=piramide;
  }
}
