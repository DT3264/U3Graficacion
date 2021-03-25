static String paramsPrismaTriangular="Base=100\nAltura=200";

class PrismaTriangular extends Figura{
  //Parametros por defecto por si acaso
  float l=100;
  float h=200;
  public PrismaTriangular(ParamsFigura params){
    super(params);
    //Asignar los parámetros
    for(String linea : params.paramsFigura){
      String[] datos=linea.split("=");
      if(datos[0].equals("Base")){
        this.l=Float.parseFloat(datos[1]);
      }
      if(datos[0].equals("Altura")){
        this.h=Float.parseFloat(datos[1]);
      }
    }
    creaFigura();
  }
  
  void creaFigura() {
    
    int sides=3;
    PShape cylinder = createShape(GROUP);
    //En el createShape inicial o en cada beginShape
    fill(conColor);
    if(!conStroke) noStroke();
    else stroke(0);
    if(!conFill) noFill();
    
    float angle = 360 / sides;
    float halfHeight = h / 2;
   
    // draw top of the tube
    PShape top = createShape();
    top.beginShape();
    
    for (int i = 0; i < sides; i++) {
      float x = cos( radians( i * angle ) ) * l;
      float y = sin( radians( i * angle ) ) * l;
      top.vertex( x, y, -halfHeight);
    }
    top.endShape(CLOSE);
    cylinder.addChild(top);
   
    // draw bottom of the tube
    PShape bottom = createShape();
    bottom.beginShape();
    for (int i = 0; i < sides; i++) {
      float x = cos( radians( i * angle ) ) * l;
      float y = sin( radians( i * angle ) ) * l;
      bottom.vertex( x, y, halfHeight);
    }
    bottom.endShape(CLOSE);
    cylinder.addChild(bottom);
   
    // draw sides
    PShape middle = createShape();
    middle.beginShape(QUAD_STRIP);
    for (int i = 0; i < sides + 1; i++) {
      float x = cos( radians( i * angle ) ) * l;
      float y = sin( radians( i * angle ) ) * l;
      middle.vertex( x, y, halfHeight);
      middle.vertex( x, y, -halfHeight);
    }
    middle.endShape(CLOSE);
    cylinder.addChild(middle);
   
    shape=cylinder;
  }
}
