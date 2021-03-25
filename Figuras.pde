import g4p_controls.*;

Figura figura;
ParamsFigura params;
int rotacionX=240;
int rotacionY=180;
int rotacionZ=180;
float scale=1.0;

void setup(){
  size(1250, 750, P3D);  
  fill(100, 200, 0);
  params=new ParamsFigura();
  creaFigura();
  createGUI();
}


void draw() {
  background(204);
  muestraSecciones();// Está al final de la clase gui
  lights();// Luces en general
  directionalLight(128,128,128, 0, 1, 0);// Luz desde arriba
  lblRotX.setText("Rotacion X: " + rotacionX);
  lblRotY.setText("Rotacion Y: " + rotacionY);
  lblRotZ.setText("Rotacion Z: " + rotacionZ);
  figura.rota(rotacionX, rotacionY, rotacionZ);
  shape(figura.shape, width/2, height/2);
  
}

void actualizaTXTParametros(){
  if(params.idFigura==0) txtParametros.setText(paramsCilindro);
  if(params.idFigura==1) txtParametros.setText(paramsCono);
  if(params.idFigura==2) txtParametros.setText(paramsCubo);
  if(params.idFigura==3) txtParametros.setText(paramsCuboide);
  if(params.idFigura==4) txtParametros.setText(paramsDodecaedro);
  if(params.idFigura==5) txtParametros.setText(paramsEsfera);
  if(params.idFigura==6) txtParametros.setText(paramsIcosaedro);
  if(params.idFigura==7) txtParametros.setText(paramsOctaedro);
  if(params.idFigura==8) txtParametros.setText(paramsPiramideCuadrada);
  if(params.idFigura==9) txtParametros.setText(paramsPiramideHexagonal);
  if(params.idFigura==10) txtParametros.setText(paramsPrismaHexagonal);
  if(params.idFigura==11) txtParametros.setText(paramsPrismaPentagonal);
  if(params.idFigura==12) txtParametros.setText(paramsPrismaPentagramal);
  if(params.idFigura==13) txtParametros.setText(paramsPrismaTriangular);
  if(params.idFigura==14) txtParametros.setText(paramsTetraedro);
  if(params.idFigura==15) txtParametros.setText(paramsToro);
}
void creaFigura(){
  if(params.idFigura==0) figura=new Cilindro(params);
  if(params.idFigura==1) figura=new Cono(params);
  if(params.idFigura==2) figura=new Cubo(params);
  if(params.idFigura==3) figura=new Cuboide(params);
  if(params.idFigura==4) figura=new Dodecaedro(params);
  if(params.idFigura==5) figura=new Esfera(params);
  if(params.idFigura==6) figura=new Icosaedro(params);
  if(params.idFigura==7) figura=new Octaedro(params);
  if(params.idFigura==8) figura=new PiramideCuadrada(params);
  if(params.idFigura==9) figura=new PiramideHexagonal(params);
  if(params.idFigura==10) figura=new PrismaHexagonal(params);
  if(params.idFigura==11) figura=new PrismaPentagonal(params);
  if(params.idFigura==12) figura=new PrismaPentagramal(params);
  if(params.idFigura==13) figura=new PrismaTriangular(params);
  if(params.idFigura==14) figura=new Tetraedro(params);
  if(params.idFigura==15) figura=new Toro(params);
}
void keyPressed(){
  if(key=='w' || key=='s' || key=='a' || key=='d'){
    //Escala temporal
    float newScale=0.0;
    if(key=='w'){//UP
      params.idFigura--;
      if(params.idFigura<0) params.idFigura=15;
    }
    else if(key=='s'){//DOWN
      params.idFigura++;
      if(params.idFigura>15) params.idFigura=0;
    }
    else if(key=='a'){//LEFT
      scale-=0.1;
      if(scale<0.1) scale+=0.1;
      newScale=scale;
    }
    else if(key=='d'){//RIGHT
      scale+=0.1;
      if(scale>2.0) scale-=0.1;
      newScale=scale;
    }
    if(key=='w' || key=='s'){
      //Ajusta el índice seleccionado de la lista de figuras
      listaFiguras.setSelected(params.idFigura);
      //Actualiza el textbox con los parámetros de la figura
      actualizaTXTParametros();
    }
    //Crea figura
    btnCreaFiguraClick();
    
    //Actualiza escala de ser necesario
    if(newScale!=0.0){
      //Reestablece y ajusta la escala global si se actualizó
      scale=newScale;
      figura.shape.scale(scale);
    }
  }
}

class ParamsFigura{
  int idFigura;
  boolean conStroke;
  boolean conFill;
  color conColor;
  //Los parámetros de cada figura para más rápido
  String paramsFigura[];
  ParamsFigura(){
    idFigura=0;
    conStroke=true;
    conFill=true;
    conColor=#A2B38C;
    paramsFigura=paramsCilindro.split("\\n");
  }
}
