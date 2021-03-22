static String paramsDodecaedro="Longitud=40.0";

class Dodecaedro extends Figura{
  //Parametros por defecto por si acaso
  float longitud=40.0;
  public Dodecaedro(ParamsFigura params){
    super(params);
    //Asignar los parámetros
    for(String linea : params.paramsFigura){
      String[] datos=linea.split("=");
      if(datos[0].equals("Longitud")){
        this.longitud=Float.parseFloat(datos[1]);
      }
    }
    //Doble dibujado porque la primera vez 
    //que se dibuja empieza como con la longitud*2
    //La siguiente vez debe ser una longitud distinta para que sea correcto
    //Por eso se dibuja con Longitud-1 y luego con Longitud
    //¿Por qué, quien sabe? xD
    longitud--;
    creaFigura();
    longitud++;
    creaFigura();
  }
  
  void creaFigura() {
   //Variables a usar
    float C2=  longitud;
    float C0 = (1 + sqrt(5))*(C2/2);
    float C1 = (3 + sqrt(5))*(C2/2);
    //Los puntos del dodecaedro
    PVector puntos[]=new PVector[]{
      new PVector( 0.0,  C2,   C1),
      new PVector( 0.0,  C2,  -C1),
      new PVector( 0.0, -C2,   C1),
      new PVector( 0.0, -C2,  -C1),
      new PVector(  C1,  0.0,  C2),
      new PVector(  C1,  0.0, -C2),
      new PVector( -C1,  0.0,  C2),
      new PVector( -C1,  0.0, -C2),
      new PVector( C2,   C1,  0.0),
      new PVector( C2,  -C1,  0.0),
      new PVector(-C2,   C1,  0.0),
      new PVector(-C2,  -C1,  0.0),
      new PVector(  C0,   C0,   C0),
      new PVector(  C0,   C0,  -C0),
      new PVector(  C0,  -C0,   C0),
      new PVector(  C0,  -C0,  -C0),
      new PVector( -C0,   C0,   C0),
      new PVector( -C0,   C0,  -C0),
      new PVector( -C0,  -C0,   C0),
      new PVector( -C0,  -C0,  -C0)
    };
    //Las coordenadas de cada pentagrama
    int[][] coordenadasPentagramas=new int[][]{
      new int[]{0,  2, 14,  4, 12 },
      new int[]{0, 12,  8, 10, 16 },
      new int[]{0, 16,  6, 18,  2 },
      new int[]{7,  6, 16, 10, 17 },
      new int[]{7, 17,  1,  3, 19 },
      new int[]{7, 19, 11, 18,  6 },
      new int[]{9, 11, 19,  3, 15 },
      new int[]{9, 15,  5,  4, 14 },
      new int[]{9, 14,  2, 18, 11 },
      new int[]{13,  1, 17, 10,  8 },
      new int[]{13,  8, 12,  4,  5 },
      new int[]{13,  5, 15,  3,  1 }
    };
    
    
    //Ajuste de visualización
    if(conFill) fill(conColor);
    else noFill();
    if(!conStroke) noStroke();
    else stroke(0);
    
    //Armado del dodecaedro
    PShape dodecaedro=createShape(GROUP);
    for(int[] v : coordenadasPentagramas){
      PVector v1=puntos[v[0]];
      PVector v2=puntos[v[1]];
      PVector v3=puntos[v[2]];
      PVector v4=puntos[v[3]];
      PVector v5=puntos[v[4]];
      
      PShape pentagrama=createShape();
      pentagrama.beginShape();         
      pentagrama.vertex(v1.x, v1.y, v1.z);
      pentagrama.vertex(v2.x, v2.y, v2.z);
      pentagrama.vertex(v3.x, v3.y, v3.z);
      pentagrama.vertex(v4.x, v4.y, v4.z);
      pentagrama.vertex(v5.x, v5.y, v5.z);
      pentagrama.vertex(v1.x, v1.y, v1.z);
      pentagrama.endShape(CLOSE);
      dodecaedro.addChild(pentagrama);
    }
    shape=dodecaedro;
  }
}
