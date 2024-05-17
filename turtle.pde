int w = 1000;
int h = 800;

int xCentre = 500;
int yCentre = 500;

float turtleLocX = xCentre;
float turtleLocY = yCentre;

float x;
float y;
float easing = 0.04;

float backX = 0; float backY = 0;
float frontX = 0; float frontY = 0;
float bodyX = 0; float bodyY = 0;
float headX = 0; float headY = 0;


void settings() {
  size( w, h );
}

void setup() {
  // fullscreen();
}

void turtle() {
  
  rect(turtleLocX-50 + backX,turtleLocY + backY,10,20); // back leg
  rect(turtleLocX+40 + frontX,turtleLocY + frontY,10,20); // front leg
  ellipse(turtleLocX + bodyX,turtleLocY + bodyY,100,35); // body
  ellipse(turtleLocX+60 + headX,turtleLocY + headY,20,10); // head
  
}

void reset() {
  backX = 0; backY = 0;
  frontX = 0; frontY = 0;
  bodyX = 0; bodyY = 0;
  headX = 0; headY = 0;
}

void draw() {
  background(0);
  text("normal",0.1*w,50);
  text("cold",0.3*w,50);
  text("lag",0.5*w,50);
  text("dismember",0.7*w,50);
  text("rainbow",0.9*w,50);
  
  //normal
  if ( mouseX < w/5 ) {
    turtleLocX = mouseX;
    turtle();
  }
  
  //cold
  if ( mouseX > w/5 & mouseX < 2*w/5 ) {
    turtleLocX = mouseX;
    turtleLocX -= random(5);
    turtleLocY = mouseY;
    turtleLocY -= random(5);
    turtle();
  }
  
  //lag
  if ( mouseX > 2*w/5 & mouseX < 3*w/5 ) {

    float targetX = mouseX;
    float dx = targetX - turtleLocX;
    turtleLocX += dx * easing;
    
    float targetY = mouseY;
    float dy = targetY - turtleLocY;
    turtleLocY += dy * easing;
    turtle();
  }
    
  //dismember
  if ( mouseX > 3* w/5 & mouseX < 4*w/5 ) {
    turtleLocX = mouseX;
    turtleLocY = mouseY;
    turtle();
    
    if ( turtleLocX > 0 ) {
      backX += 20;
      backX *= -1;
    }
    
    //for ( int i = 40; i < 80; i = i + 1 ) {
    //  backY = i; }
    
  }
  
  //rainbow
  if ( mouseX > 4*w/5 ) {
    turtleLocX = mouseX;
    turtleLocY = h/2;
    reset();
    turtle();
  }
  
}
