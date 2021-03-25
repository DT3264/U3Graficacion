static String paramsPrismaPentagramal="Radio=100\nAltura=50";//Modificar

class PrismaPentagramal extends Figura{
  //Parametros por defecto por si acaso
  float r=100;
  float h=50;
  
  public PrismaPentagramal(ParamsFigura params){
    super(params);
    //Asignar los parámetros
    for(String linea : params.paramsFigura){
      String[] datos=linea.split("=");
      if(datos[0].equals("Radio")){
        this.r=Float.parseFloat(datos[1]);
      }
      if(datos[0].equals("Altura")){
        this.h=Float.parseFloat(datos[1]);
      }
    }
    creaFigura();
  }
  
  void creaFigura() {
    
    PShape pentagram = createShape(GROUP);
    //Ajusta parámetros en el createShape inicial o en cada beginShape, ejemplo en cilindro
    fill(conColor);
    if(!conStroke) noStroke();
    else stroke(0);
    if(!conFill) noFill();
    int pointCount = 5;
    //int pointCount = this.pc;
    float outerRadius = r;
    float innerRadius = outerRadius * 0.5;
    float halfHeight = h / 2;
    
    //Dibujar aquí
    float theta = 0.0;
    int vertCount = pointCount * 2;
    float thetaRot = TWO_PI / vertCount;
    float tempRadius = 0.0;
    float x = 0.0, y = 0.0;
    //Dibujar arriba
    PShape arriba = createShape();
    arriba.beginShape();
    for(int i=0 ; i<pointCount+1; i++){
      for(int j=0; j<2; j++){
        tempRadius = innerRadius;
        if(j%2 == 0){
          tempRadius = outerRadius;
        }
        x = cos(theta) * tempRadius;
        y = sin(theta) * tempRadius;
        arriba.vertex(x, y, halfHeight);        
        theta += thetaRot;
      }
    }
    arriba.endShape(CLOSE);
    pentagram.addChild(arriba);
    //Dibujar abajo
    PShape abajo = createShape();
    abajo.beginShape();
    for(int i=0 ; i<pointCount+1; i++){
      for(int j=0; j<2; j++){
        tempRadius = innerRadius;
        if(j%2 == 0){
          tempRadius = outerRadius;
        }
        x = cos(theta) * tempRadius;
        y = sin(theta) * tempRadius;
        abajo.vertex(x, y, -halfHeight);        
        theta += thetaRot;
      }
    }
    abajo.endShape(CLOSE);
    pentagram.addChild(abajo);
    
    //Dibujar contorno
    PShape contorno = createShape();
    contorno.beginShape(QUAD_STRIP);
    for(int i=0 ; i<pointCount+1; i++){
      for(int j=0; j<2; j++){
        tempRadius = innerRadius;
        if(j%2 == 0){
          tempRadius = outerRadius;
        }
        x = cos(theta) * tempRadius;
        y = sin(theta) * tempRadius;
        contorno.vertex(x, y, halfHeight);
        contorno.vertex(x, y, -halfHeight);
        
        theta += thetaRot;
      }
    }
    contorno.endShape(CLOSE);
    pentagram.addChild(contorno);
    shape=pentagram;
  }
}
