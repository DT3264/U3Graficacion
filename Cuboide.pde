static String paramsCuboide="lado=200\nancho=50";//Modificar

class Cuboide extends Figura{
  //Parametros por defecto por si acaso
  float l=200;
  float a=50;
  public Cuboide(ParamsFigura params){
    super(params);
    //Asignar los parámetros
    for(String linea : params.paramsFigura){
      String[] datos=linea.split("=");
      if(datos[0].equals("lado")){
        this.l=Float.parseFloat(datos[1]);
      }
      if(datos[0].equals("ancho")){
        this.a=Float.parseFloat(datos[1]);
      }
    }
    creaFigura();
  }
  
  void creaFigura() {
    
    PShape cuboide = createShape(GROUP);
    //Ajusta parámetros en el createShape inicial o en cada beginShape, ejemplo en cilindro
    fill(conColor);
    if(!conStroke) noStroke();
    else stroke(0);
    if(!conFill) noFill();
    
    //Dibujar aquí
    PShape cub = createShape();
    PShape cub2 = createShape();
    PShape cub3 = createShape();
    PShape cub4 = createShape();
    PShape cub5 = createShape();
    PShape cub6 = createShape();
    
    cub.beginShape();
    //Derecha
    cub.vertex(l/2, 0, 0);
    cub.vertex(l/2, -l, 0);
    cub.vertex(l/2, -l, -a);
    cub.vertex(l/2, 0, -a);
    cub.vertex(l/2, 0, 0);
    cub.endShape();
    cuboide.addChild(cub);
     //Atras
    cub2.beginShape();
    cub2.vertex(l/2, 0, -a);
    cub2.vertex(l/2, -l, -a);
    cub2.vertex(-l/2, -l, -a);
    cub2.vertex(-l/2, 0, -a);
    cub2.vertex(l/2, 0, -a);
    cub2.endShape();
     cuboide.addChild(cub2);
    
    cub3.beginShape();
    //Izquierda
    cub3.vertex(-l/2, 0, -a);
    cub3.vertex(-l/2, -l, -a);
    cub3.vertex(-l/2, -l, 0);
    cub3.vertex(-l/2, 0, 0);
    cub3.vertex(-l/2, 0, -a);
     cub3.endShape();
    cuboide.addChild(cub3);
     
     cub4.beginShape();
     //Enfrente
     cub4.vertex(-l/2, 0, 0);
     cub4.vertex(-l/2, -l, 0);
     cub4.vertex(l/2, -l, 0);
     cub4.vertex(l/2, 0, 0);
     cub4.vertex(-l/2, 0, 0);
     cub4.endShape();
     cuboide.addChild(cub4);
     
     cub5.beginShape();
     //Abajo
     cub5.vertex(-l/2, 0, 0);
     cub5.vertex(-l/2, 0, -a);
     cub5.vertex(l/2, 0, -a);
     cub5.vertex(l/2, 0, 0);
     cub5.vertex(-l/2, 0, 0);
     cub5.endShape();
     cuboide.addChild(cub5);
     
      cub6.beginShape();
     //Arriba
     cub6.vertex(-l/2, -l, 0);
     cub6.vertex(-l/2, -l, -a);
     cub6.vertex(l/2, -l, -a);
     cub6.vertex(l/2, -l, 0);
     cub6.vertex(-l/2, -l, 0);
     cub6.endShape();
     cuboide.addChild(cub6);
     
     
   
    shape=cuboide;
  }
}
