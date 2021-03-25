static String paramsPiramideHexagonal="base=100\naltura=250";//Modificar

class PiramideHexagonal extends Figura{
  //Parametros por defecto por si acaso
  float l=100;
  float h=300;
  public PiramideHexagonal(ParamsFigura params){
    super(params);
    //Asignar los parámetros
    for(String linea : params.paramsFigura){
      String[] datos=linea.split("=");
      if(datos[0].charAt(0)=='b'){
        this.l=Float.parseFloat(datos[1]);
      }
      if(datos[0].charAt(0)=='a'){
        this.h=Float.parseFloat(datos[1]);
      }
    }
    creaFigura();
  }
  
  void creaFigura() {
    
    PShape hexa = createShape(GROUP);
    //Ajusta parámetros en el createShape inicial o en cada beginShape, ejemplo en cilindro
    fill(conColor);
    if(!conStroke) noStroke();
    else stroke(0);
    if(!conFill) noFill();
    
    
    float hip=sqrt((l*l)-((l/2)*(l/2)));
    
    
    hexa.translate(0, l, hip);
    hexa.rotateX(radians(-60));
    
    PShape he = createShape();
    PShape he2 = createShape();
    PShape he3 = createShape();
    PShape he4 = createShape();
    PShape he5 = createShape();
    PShape he6 = createShape();
    PShape he7 = createShape();
    
    //Dibujar aquí
    
    he.beginShape();
    he.vertex(-l/2, 0,0);
    he.vertex(l/2, 0,0);
    he.vertex(l/2+(l*0.5), 0,-hip);
    he.vertex(l/2, 0,-hip*2);
    he.vertex(-l/2, 0,-hip*2);
    he.vertex(-l/2-(l*0.5), 0,-hip);
    he.vertex(-l/2, 0,0);
    he.endShape();
    hexa.addChild(he);
    
    he2.beginShape();
    he2.vertex(l/2, 0,0);
    he2.vertex(0, -h,-hip);
    he2.vertex(-l/2, 0,0);
    he2.vertex(l/2, 0,0);
    he2.endShape();
    hexa.addChild(he2);
   
    
    he3.beginShape();
    he3.vertex(l/2+(l*0.5), 0,-hip);  
    he3.vertex(-0, -h,-hip);
    he3.vertex(l/2, 0,0);
    he3.vertex(l/2+(l*0.5), 0,-hip);  
    he3.endShape();
    hexa.addChild(he3);
    
    he4.beginShape();
    he4.vertex(l/2, 0,-hip*2);
    he4.vertex(-0, -h,-hip);
    he4.vertex(l/2+(l*0.5), 0,-hip);
    he4.vertex(l/2, 0,-hip*2);
    he4.endShape();
    hexa.addChild(he4);
   
    he5.beginShape();
    he5.vertex(-l/2, 0,-hip*2);
    he5.vertex(-0, -h,-hip);
    he5.vertex(l/2, 0,-hip*2);
    he5.vertex(-l/2, 0,-hip*2);
    he5.endShape();
    hexa.addChild(he5);
    
    he6.beginShape();
    he6.vertex(-l/2-(l*0.5), 0,-hip);
    he6.vertex(-0, -h,-hip);
    he6.vertex(-l/2, 0,-hip*2);
    he6.vertex(-l/2-(l*0.5), 0,-hip);
    he6.endShape();
    hexa.addChild(he6);
    
    he7.beginShape();
    he7.vertex(-l/2, 0,0);
    he7.vertex(-0, -h,-hip);
    he7.vertex(-l/2-(l*0.5), 0,-hip);
    he7.vertex(-l/2, 0,0);
    he7.endShape();
    hexa.addChild(he7);

    
    shape=hexa;
  }
}
