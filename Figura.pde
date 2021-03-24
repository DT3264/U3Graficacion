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
    //Calcula la diferencia de rotación
    float deltaX=radians(nuevoX-rotacionX);
    float deltaY=radians(nuevoY-rotacionY);
    float deltaZ=radians(nuevoZ-rotacionZ);
    
    //Ajusta la rotación
    shape.rotateX(deltaX);
    shape.rotateY(deltaY);
    //rotateZ da error en la versión 3.4 de processing
    //con PShape porque no lo define como figura 3D
    //Pero esto hace lo mismo
    shape.rotate(deltaZ, 0.0, 0.0, 1.0);
    
    //Actualiza los valores de referencia
    rotacionX=nuevoX;
    rotacionY=nuevoY;
    rotacionZ=nuevoZ;
  }
}
