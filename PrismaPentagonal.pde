static String paramsPrismaPentagonal="lado=100\naltura=200";//Modificar

class PrismaPentagonal extends Figura{
  //Parametros por defecto por si acaso
  float l=100;
  float h=200;
  public PrismaPentagonal(ParamsFigura params){
    super(params);
    //Asignar los parámetros
    for(String linea : params.paramsFigura){
      String[] datos=linea.split("=");
      if(datos[0].charAt(0)=='l'){
        this.l=Float.parseFloat(datos[1]);
      }
      if(datos[0].charAt(0)=='a'){
        this.h=Float.parseFloat(datos[1]);
      }
    }
    creaFigura();
  }
  
  void creaFigura() {
    
    PShape penta = createShape(GROUP);
    //Ajusta parámetros en el createShape inicial o en cada beginShape, ejemplo en cilindro
    fill(conColor);
    if(!conStroke) noStroke();
    else stroke(0);
    if(!conFill) noFill();
    
    float hip=sqrt((l*l)-((l/2)*(l/2)));
    
    
    penta.translate(0, l, hip);
    penta.rotateX(radians(-60));
    
    PShape p = createShape();
    PShape p2 = createShape();
    PShape p3 = createShape();
    PShape p4 = createShape();
    PShape p5 = createShape();
    PShape p6 = createShape();
    PShape p7 = createShape();
   
    //Dibujar aquí
    
    p.beginShape();
    p.vertex(-l/2, 0,0);
    p.vertex(l/2, 0,0);
    p.vertex(l/2+(l*0.4), 0,-hip-(l*0.2));
    p.vertex(0, 0,-hip*2);
    p.vertex(-l/2-(l*0.4), 0,-hip-(l*0.2));
    p.vertex(-l/2, 0,0);
    p.endShape();
    penta.addChild(p);
    
    p2.beginShape();
    p2.vertex(-l/2, 0,0);
    p2.vertex(-l/2, -h,0);
    p2.vertex(l/2, -h,0);
    p2.vertex(l/2, 0,0);
    p2.vertex(-l/2, 0,0);
    p2.endShape();
    penta.addChild(p2);
    
    p3.beginShape();
   p3.vertex(l/2, 0,0);
   p3.vertex(l/2, -h,0);
   p3.vertex(l/2+(l*0.4), -h,-hip-(l*0.2));
   p3.vertex(l/2+(l*0.4), 0,-hip-(l*0.2));
   p3.vertex(l/2, 0,0);
   p3.endShape();
   penta.addChild(p3);
   
   p4.beginShape();
   p4.vertex(l/2+(l*0.4), 0,-hip-(l*0.2));
   p4.vertex(l/2+(l*0.4), -h,-hip-(l*0.2));
   p4.vertex(0, -h,-hip*2);
   p4.vertex(0, 0,-hip*2);
   p4.vertex(l/2+(l*0.4), 0,-hip-(l*0.2));
   p4.endShape();
   penta.addChild(p4);
   
   p5.beginShape();
   p5.vertex(0, 0,-hip*2);
   p5.vertex(0, -h,-hip*2);
   p5.vertex(-l/2-(l*0.4), -h,-hip-(l*0.2));
   p5.vertex(-l/2-(l*0.4), 0,-hip-(l*0.2));
   p5.vertex(0, 0,-hip*2);
   p5.endShape();
   penta.addChild(p5);
    
   p6.beginShape();
   p6.vertex(-l/2-(l*0.4), 0,-hip-(l*0.2));
   p6.vertex(-l/2-(l*0.4), -h,-hip-(l*0.2));
   p6.vertex(-l/2, -h,0);
   p6.vertex(-l/2, 0,0);
   p6.vertex(-l/2-(l*0.4), 0,-hip-(l*0.2));
   p6.endShape();
   penta.addChild(p6);
   
    p7.beginShape();
    p7.vertex(-l/2, -h,0);
    p7.vertex(l/2, -h,0);
    p7.vertex(l/2+(l*0.4), -h,-hip-(l*0.2));
    p7.vertex(0, -h,-hip*2);
    p7.vertex(-l/2-(l*0.4), -h,-hip-(l*0.2));
    p7.vertex(-l/2, -h,0);
    p7.endShape();
    penta.addChild(p7);
   
  
    
    shape=penta;
  }
}
