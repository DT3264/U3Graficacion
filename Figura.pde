abstract class Figura{
  PShape shape;
  int rotacionX;
  int rotacionY;
  int rotacionZ;
  boolean conStroke; 
  boolean conFill;
  color conColor;
  abstract void creaFigura();
  Figura(ParamsFigura params){
    this.conStroke=params.conStroke;
    this.conFill=params.conFill;
    this.conColor=params.conColor;
  }
  void rota(int nuevoX, int nuevoY, int nuevoZ){
    float deltaX=radians(nuevoX-rotacionX);
    float deltaY=radians(nuevoY-rotacionY);
    float deltaZ=radians(nuevoZ-rotacionZ);
    shape.rotateX(deltaX);
    shape.rotateY(deltaY);
    shape.rotate(deltaZ, 0.0, 0.0, 1.0);
    rotacionX=nuevoX;
    rotacionY=nuevoY;
    rotacionZ=nuevoZ;
  }
}
