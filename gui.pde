/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void sliderX_change(GCustomSlider source, GEvent event) { //_CODE_:sliderX:780867:
  rotacionX=source.getValueI();
} //_CODE_:sliderX:780867:

public void sliderY_change(GCustomSlider source, GEvent event) { //_CODE_:sliderY:383972:
  rotacionY=source.getValueI();
} //_CODE_:sliderY:383972:

public void sliderZ_change(GCustomSlider source, GEvent event) { //_CODE_:sliderZ:300281:
  rotacionZ=source.getValueI();
} //_CODE_:sliderZ:300281:

public void chkStroke_clicked(GCheckbox source, GEvent event) { //_CODE_:chkStroke:948418:
  params.conStroke=source.isSelected();
} //_CODE_:chkStroke:948418:

public void chkFill_clicked(GCheckbox source, GEvent event) { //_CODE_:chkFill:535128:
  params.conFill=source.isSelected();
} //_CODE_:chkFill:535128:

public void listaFiguras_click(GDropList source, GEvent event) { //_CODE_:listaFiguras:407774:
  params.idFigura=source.getSelectedIndex();
  actualizaTXTParametros();
} //_CODE_:listaFiguras:407774:

public void txtColor_change(GTextField source, GEvent event) { //_CODE_:txtColor:862990:
  params.conColor=unhex("FF" + source.getText());
} //_CODE_:txtColor:862990:

public void txtParametros_change(GTextArea source, GEvent event) { //_CODE_:txtParametros:521962:
  //params.paramsFigura=source.getTextAsArray();
} //_CODE_:txtParametros:521962:

public void btnFigura_click(GButton source, GEvent event) { //_CODE_:btnCrearFigura:772746:
  //Resetear sliders
  sliderX.setValue(240.0);
  sliderY.setValue(180.0);
  sliderZ.setValue(180.0);
  params.paramsFigura=txtParametros.getTextAsArray();
  params.conStroke=chkStroke.isSelected();
  creaFigura();
} //_CODE_:btnCrearFigura:772746:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  
  int actY=0;
  
  actY+=20;
  
  GLabel lblRot = new GLabel(this, 5, actY, 360, 20);
  actY+=20+1;
  lblRot.setOpaque(false);
  
  lblRotX = new GLabel(this, 5, actY, 360, 20);
  actY+=20+1;
  lblRotX.setText("Rotacion X:");
  lblRotX.setOpaque(false);
  
  sliderX = new GCustomSlider(this, 5, actY, 360, 40, "grey_blue");
  actY+=40+1;
  sliderX.setLimits(220, 0, 360);
  sliderX.setNbrTicks(360);
  sliderX.setNumberFormat(G4P.INTEGER, 0);
  sliderX.setOpaque(false);
  sliderX.addEventHandler(this, "sliderX_change");
  
  lblRotY = new GLabel(this, 5, actY, 360, 20);
  actY+=20+1;
  lblRotY.setText("Rotacion Y:");
  lblRotY.setOpaque(false);
  
  sliderY = new GCustomSlider(this, 5, actY, 360, 40, "grey_blue");
  actY+=40+1;
  sliderY.setLimits(180, 0, 360);
  sliderY.setNumberFormat(G4P.INTEGER, 0);
  sliderY.setOpaque(false);
  sliderY.addEventHandler(this, "sliderY_change");
  
  lblRotZ = new GLabel(this, 5, actY, 360, 20);
  actY+=20+1;
  lblRotZ.setText("Rotacion Z:");
  lblRotZ.setOpaque(false);
  
  sliderZ = new GCustomSlider(this, 5, actY, 360, 40, "grey_blue");
  actY+=40+1;
  sliderZ.setLimits(180, 0, 360);
  sliderZ.setNumberFormat(G4P.INTEGER, 0);
  sliderZ.setOpaque(false);
  sliderZ.addEventHandler(this, "sliderZ_change");
  
  
  actY+=80;
  
  chkStroke = new GCheckbox(this, 5, actY, 160, 20);
  actY+=20+1;
  chkStroke.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  chkStroke.setText("Stroke");
  chkStroke.setOpaque(false);
  chkStroke.addEventHandler(this, "chkStroke_clicked");
  chkStroke.setSelected(true);
  
  chkFill = new GCheckbox(this, 5, actY, 160, 20);
  actY+=20+1;
  chkFill.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  chkFill.setText("Fill");
  chkFill.setOpaque(false);
  chkFill.addEventHandler(this, "chkFill_clicked");
  chkFill.setSelected(true);
  
  txtColor = new GTextField(this, 5, actY, 160, 20, G4P.SCROLLBARS_NONE);
  actY+=20+1;
  txtColor.setText("8ECD9A");
  txtColor.setOpaque(true);
  txtColor.addEventHandler(this, "txtColor_change");
  
  listaFiguras = new GDropList(this, 5, actY, 160, 360, 16, 10);
  actY+=20+1;
  listaFiguras.setItems(loadStrings("list_407774"), 0);
  listaFiguras.addEventHandler(this, "listaFiguras_click");
  
  txtParametros = new GTextArea(this, 5, actY, 160, 100, G4P.SCROLLBARS_NONE);
  actY+=100+1;
  txtParametros.setText("Radio=100\nAltura=300");
  txtParametros.setOpaque(true);
  txtParametros.addEventHandler(this, "txtParametros_change");
  
  
  btnCrearFigura = new GButton(this, 5, actY, 160, 30);
  actY+=30+1;
  btnCrearFigura.setText("Crear figura");
  btnCrearFigura.addEventHandler(this, "btnFigura_click");
}
void muestraSecciones(){
  //Pinta límites de secciones
  strokeWeight(2);
  //Sección de rotación
  limite(2, 2, 365, 230, #A2B38C);
  //Sección de nueva figura
  limite(2, 260, 365, 530, #A2B3CC);
  
  //Pinta titulos de secciones
  PFont font = createFont("Courier New", 30);
  textFont(font);
  textAlign(LEFT);
  fill(0);
  text("ROTACIÓN", 5, 30);
  text("CREACIÓN DE FIGURA", 5, 295);
  
  //Reestablece el fill original
  fill(#A2B38C);
}

void limite(int x1, int y1, int x2, int y2, color fondo){
  beginShape();
  fill(fondo);
  vertex(x1,y1);
  vertex(x2, y1);
  vertex(x2, y2);
  vertex(x1, y2);
  endShape(CLOSE);
}

// Variable declarations 
// autogenerated do not edit
GLabel lblRotX; 
GCustomSlider sliderX; 
GLabel lblRotY; 
GCustomSlider sliderY; 
GLabel lblRotZ; 
GCustomSlider sliderZ; 
GCheckbox chkStroke; 
GCheckbox chkFill; 
GCheckbox checkbox3; 
GDropList listaFiguras; 
GPanel panel1; 
GLabel lblParams; 
GTextField txtColor; 
GLabel lblColor; 
GTextArea txtParametros; 
GButton btnCrearFigura; 
