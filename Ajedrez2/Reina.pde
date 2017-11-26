class Reina extends Piezas {
  protected PVector trans;
  protected boolean dye;
  protected float PosX, PosY;
  protected String identity;

  public Reina(int x, int y, boolean Dye, String Identity) {
    super(x, y, Dye, Identity);

    Dye = dye;
    Identity = identity;
  }




  @Override
    void drawFigure(boolean dye) {
    if (dye == true) {
      image(db, 0, 0, height/9, height/9);
    } else if (dye == false) {
      image(dn, 0, 0, height/9, height/9);
    }
  }


  @Override
    void move(int x, int y) {
    for (int i = 1; i < 8; i++) {
      if ((y - i) >= 0 && (x - i) >= 0) {
        fill(#FA4417);
        rect(Mx[y-i][x-i], My[y-i][x-i], height/8, height/8);
      }
      if ((y + i) < 8 && (x + i) < 8) {
        fill(#FA4417);
        rect(Mx[y+i][x+i], My[y+i][x+i], height/8, height/8);
      }
      if ((y + i) < 8 && (x - i) >= 0) {
        fill(#FA4417);
        rect(Mx[y+i][x-i], My[y+i][x-i], height/8, height/8);
      }
      if ((y - i) >= 0 && (x + i) < 8) {
        fill(#FA4417);
        rect(Mx[y-i][x+i], My[y-i][x+i], height/8, height/8);
      }
      if ((x - i) >= 0) {
        fill(#FA4417);
        rect(Mx[y][x-i], My[y][x-i], height/8, height/8);
      }
      if ((x + i) < 8) {
        fill(#FA4417);
        rect(Mx[y][x+i], My[y][x+i], height/8, height/8);
      }
      if ((y + i) < 8) {
        fill(#FA4417);
        rect(Mx[y+i][x], My[y+i][x], height/8, height/8);
      }
      if ((y - i) >= 0) {
        fill(#FA4417);
        rect(Mx[y-i][x], My[y-i][x], height/8, height/8);
      }
    }

    if (mousePressed&&get(mouseX, mouseY)==#FA4417) {
      cont=2;
      println(get(mouseX, mouseY));
    }
    if (cont == 2) {
      for (int j = 0; j < 8; j++) {
        if ((mouseX > a+(height/8)*j) && (mouseX <= a+(height/8)*(j+1))) {
          x = j;
        }
      }
      for (int j = 8; j > 0; j--) {
        if ((mouseY < (height/8)*(j)) && (mouseY >= (height/8)*(j-1))) {
          switch(j - 1) {
          case 7:
            y = 0;
            break;
          case 6:
            y = 1;
            break;
          case 5:
            y = 2;
            break;
          case 4:
            y = 3;
            break;
          case 3:
            y = 4;
            break;
          case 2:
            y = 5;
            break;
          case 1:
            y = 6;
            break;
          default:
            y = 7;
            break;
          }
        }
      } 
      setTranslation(x, y);
      if (selectb == true) {
        selectb = false;
        Turno =! Turno;
      } else if (selectn == true) {
        selectn = false;
        Turno =! Turno;
      }
      cont = 0;
    }

    if (dye == true) {
      Turno = true;
    } else {
      Turno = false;
    }
  }
}