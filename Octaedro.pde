static String paramsOctaedro="Longitud=50";//Modificar

class Octaedro extends Figura{
  //Parametros por defecto por si acaso
  int longitud=50;
  public Octaedro(ParamsFigura params){
    super(params);
    //Asignar los parámetros
    for(String linea : params.paramsFigura){
      String[] datos=linea.split("=");
      if(datos[0].equals("Longitud")){
        this.longitud=Integer.parseInt(datos[1]);
      }
    }
    creaFigura();
  }
  
  void creaFigura() {
    longitud*=2;
    //Ajustes de visualización
    fill(conColor);
    if(!conStroke) noStroke();
    else stroke(0);
    if(!conFill) noFill();
    
    PShape octaedro=createShape(GROUP);
    PShape child;
    PVector pSuperior=new PVector(0, 0, longitud);
    PVector lados[] = new PVector[]{
      new PVector(-longitud, 0, 0),
      new PVector(0, -longitud, 0),
      new PVector(longitud, 0, 0),
      new PVector(0, longitud, 0),
    };
    
    int pActual=0;
    for(int i=0; i<4; i++){
      PVector v1=lados[pActual++];
      if(pActual==4) pActual=0;
      PVector v2=pSuperior;
      PVector v3=lados[pActual++];
      pActual--;
      if(pActual==4) pActual=0;
      //Cara superior
      child=createShape();
      child.beginShape();
      child.vertex(v1.x, v1.y, v1.z);
      child.vertex(v2.x, v2.y, v2.z);//Punto superior
      child.vertex(v3.x, v3.y, v3.z);
      child.vertex(v1.x, v1.y, v1.z);
      child.endShape(CLOSE);
      octaedro.addChild(child);
      
      //Cara inferior
      child=createShape();
      child.beginShape();
      child.vertex(v1.x, v1.y, v1.z);
      child.vertex(v2.x, v2.y, -v2.z);//Punto inferior
      child.vertex(v3.x, v3.y, v3.z);
      child.vertex(v1.x, v1.y, v1.z);
      child.endShape(CLOSE);
      octaedro.addChild(child);
    }
    shape=octaedro;
  }
}
