static String paramsPrismaHexagonal="r=1\nh=30";//Modificar

class PrismaHexagonal extends Figura{
  //Parametros por defecto por si acaso
  float r=100;
  float h=300;
  public PrismaHexagonal(ParamsFigura params){
    super(params);
    //Asignar los parámetros
    for(String linea : params.paramsFigura){
      String[] datos=linea.split("=");
      if(datos[0].charAt(0)=='r'){
        this.r=Float.parseFloat(datos[1]);
      }
      if(datos[0].charAt(0)=='h'){
        this.h=Float.parseFloat(datos[1]);
      }
    }
    creaFigura();
  }
  
  void creaFigura() {
    
    PShape cylinder = createShape();
    //Ajusta parámetros en el createShape inicial o en cada beginShape, ejemplo en cilindro
    fill(conColor);
    if(!conStroke) noStroke();
    else stroke(0);
    if(!conFill) noFill();
    
    //Dibujar aquí
    
    shape=cylinder;
  }
}
