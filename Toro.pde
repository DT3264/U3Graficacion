static String paramsToro="Puntos=40\nSegmentos=60\nGrosor=50\nRadioInterno=125";

class Toro extends Figura{
  //Parametros por defecto por si acaso
  int puntos = 40; 
  int segmentos = 60;
  float grosor = 50.0;
  float radioInterno = 125.0;
  public Toro(ParamsFigura params){
    super(params);
    //Asignar los parámetros
    for(String linea : params.paramsFigura){
      String[] datos=linea.split("=");
      if(datos[0].equals("Puntos")){
        this.puntos=Integer.parseInt(datos[1]);
      }
      if(datos[0].equals("Segmentos")){
        this.segmentos=Integer.parseInt(datos[1]);
      }
      if(datos[0].equals("Grosor")){
        this.grosor=Float.parseFloat(datos[1]);
      }
      if(datos[0].equals("RadioInterno")){
        this.radioInterno=Float.parseFloat(datos[1]);
      }
    }
    creaFigura();
  }
  
  void creaFigura() {
    
    PShape toro;
    PVector vertices[]=new PVector[puntos+1]; 
    PVector vertices2[]=new PVector[puntos+1];;
    float angulo = 0;
    float anguloInterno = 0;
    // fill arrays
    for(int i=0; i<=puntos; i++){
      vertices[i] = new PVector();
      vertices2[i] = new PVector();
      vertices[i].x = radioInterno + sin(radians(angulo))*grosor;
      vertices[i].z = cos(radians(angulo))*grosor;
      angulo+=360.0/puntos;
    }
    
    anguloInterno = 0;
    if(conStroke) stroke(0);
    else noStroke();
    if(conFill) fill(conColor);
    else noFill();
    toro=createShape(GROUP);
    for(int i=0; i<=segmentos; i++){
      PShape inner=createShape();
      inner.beginShape(QUAD_STRIP);
      for(int j=0; j<=puntos; j++){
        if (i>0){
          inner.vertex(vertices2[j].x, vertices2[j].y, vertices2[j].z);
        }
        vertices2[j].x = cos(radians(anguloInterno))*vertices[j].x;
        vertices2[j].y = sin(radians(anguloInterno))*vertices[j].x;
        vertices2[j].z = vertices[j].z;
        inner.vertex(vertices2[j].x, vertices2[j].y, vertices2[j].z);
      }
      anguloInterno+=360.0/segmentos;
      inner.endShape();
      toro.addChild(inner);
    }
    
    shape=toro;
  }
}  
