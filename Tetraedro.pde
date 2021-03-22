static String paramsTetraedro="Longitud=100";//Modificar

class Tetraedro extends Figura{
  //Parametros por defecto por si acaso
  float longitud=100;
  public Tetraedro(ParamsFigura params){
    super(params);
    //Asignar los parámetros
    for(String linea : params.paramsFigura){
      String[] datos=linea.split("=");
      if(datos[0].equals("Longitud")){
        this.longitud=Float.parseFloat(datos[1]);
      }
    }
    creaFigura();
  }
  
  void creaFigura() {
    
    PShape tetraedro;
       
    fill(conColor);
    if(!conStroke) noStroke();
    else stroke(0);
    if(!conFill) noFill();
    tetraedro=createShape();
    tetraedro.beginShape(TRIANGLE_STRIP);
    tetraedro.vertex( longitud,  longitud,  longitud); // v1
    tetraedro.vertex(-longitud, -longitud,  longitud); // v2
    tetraedro.vertex(-longitud,  longitud, -longitud); // v3
    tetraedro.vertex( longitud, -longitud, -longitud); // v4
    
    tetraedro.vertex( longitud,  longitud,  longitud); //v1 
    tetraedro.vertex(-longitud, -longitud,  longitud); //v2 
    
    tetraedro.endShape();
    
    shape=tetraedro;
  }
}
