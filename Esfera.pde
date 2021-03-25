static String paramsEsfera="Radio=100";

class Esfera extends Figura{
  //Parametros por defecto por si acaso
  float r=100;
  public Esfera(ParamsFigura params){
    super(params);
    //Asignar los parámetros
    for(String linea : params.paramsFigura){
      String[] datos=linea.split("=");
      if(datos[0].equals("Radio")){
        this.r=Float.parseFloat(datos[1]);
      }
    }
    creaFigura();
  }
  
  void creaFigura() {
    //Ajusta parámetros en el createShape inicial o en cada beginShape, ejemplo en cilindro
    fill(conColor);
    if(!conStroke) noStroke();
    else stroke(0);
    if(!conFill) noFill();
    
    //Dibujar aquí
    //sphereDetail(4, 40);
    PShape esferaD = createShape(SPHERE, r);
    shape=esferaD;
  }
}
