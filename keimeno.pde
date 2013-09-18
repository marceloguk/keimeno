PFont fontSource, fontNews;
String source, news;
boolean inNews, test;
float rotX, rotY;
int trans, index;
String[] positions;

void setup () {
  size(800, 600, P3D);
  fontSource = createFont("FreeSans Bold", 24);
  fontNews = createFont("FreeSans Bold", 64);
  source = "Fonte";
  news = "Notícia";
  inNews = false;

  // to change positions, edit the file  
  positions = loadStrings("positions.txt");
  for (index = 0; index < positions.length; index++) {
    String[] variables = split(positions[index], '\t');
    println(variables);
    if (variables.length == 4) {
      rotX = float(variables[0]);
      rotY = float(variables[1]);
      trans = int(variables[2]);
      test = boolean(variables[3]);
    }
  }
  if (test) stroke(255); // test
}

void draw() {
  background(0);
  rotateX(rotX);
  rotateY(rotY);
  translate(trans, 0);
  if (test) noFill(); // test
  if (test) rect(50, 10, 700, 30); // test
  if (test) fill(255); // test
  textFont(fontSource);
  text(source, 50, 10, 700, 30);
  if (test) noFill(); // test
  if (test) rect(50, 50, 700, 350); // test
  if (test) fill(255); // test
  textFont(fontNews);
  text(news, 50, 50, 700, 350);
}

void keyTyped() {
  if (key == TAB) {
    if (inNews == true) inNews = false;
    else inNews = true;
  } else if (inNews == true) {
    if ((key == BACKSPACE) && (news.length() > 0)) {
      news = news.substring(0,news.length()-1);
    } else {
      news += key;
    }
  } else if (inNews == false) {
    if ((key == BACKSPACE) && (source.length() > 0)) {
      source = source.substring(0,source.length()-1);
    } else {
      source += key;
    }
  } 
}

