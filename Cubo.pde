static String paramsCubo="Lado=200";

class Cubo extends Figura{
  //Parametros por defecto por si acaso
  float l=200;
  public Cubo(ParamsFigura params){
    super(params);
    //Asignar los parámetros
    for(String linea : params.paramsFigura){
      String[] datos=linea.split("=");
      if(datos[0].equals("Lado")){
        this.l=Float.parseFloat(datos[1]);
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
    PShape head = createShape(BOX, l);
    shape=head;
    
  }
}
