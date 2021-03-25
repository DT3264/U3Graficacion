static String paramsCono="Radio=100\nAltura=200";

class Cono extends Figura{
  //Parametros por defecto por si acaso
  float r=100;
  float h=200;
  public Cono(ParamsFigura params){
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
    int sides = 30;
    float angle = 360 / sides;
    float halfHeight = h / 2;
    float bottomRadius = r;
    float tall = h;
    float angleIncrement = TWO_PI / sides;
    
    
    PShape cone = createShape(GROUP);
    //Ajusta parámetros en el createShape inicial o en cada beginShape, ejemplo en cilindro
    fill(conColor);
    if(!conStroke) noStroke();
    else stroke(0);
    if(!conFill) noFill();
    
    //Dibujar aquí
    //draw bottom of the cone
    PShape bottom = createShape();
    bottom.beginShape();
    for (int i = 0; i < sides ; i++) {
        float ca = cos(radians(i * angle)) * r;
        float sa = sin(radians(i * angle)) * r;
        bottom.vertex(ca, sa, -halfHeight);
    }
    bottom.endShape(CLOSE);
    cone.addChild(bottom);
    //draw sides
    PShape con = createShape(); 
    con.beginShape(QUAD_STRIP);
    for (int i = 0; i < sides+1; i++) {
        float ca = cos(radians(i * angle)) * r;
        float sa = sin(radians(i * angle)) * r;
        con.vertex(0, 0, halfHeight);
        con.vertex(ca, sa, -halfHeight);
    }
    con.endShape();
    cone.addChild(con);
    shape=cone;
  }
}
