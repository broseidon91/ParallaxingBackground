class Block  
{
  
  PVector position = new PVector(0,0);
  float scale = 1;
  float z = 0;
  float w = 1;
  float h = 1;
  float halfW;
  float halfH;
  float fillColor;
  float counter = 0;
  float counterInc = 0;
  Block(PVector position, float w, float h, float z)
  {
    this.position = position;
    this.w = w;
    this.h = h;
    this.z = z;
    halfW = w/2;
    halfH = h/2;
    fillColor = (float)Math.random() * 360;
    scale = (float)Math.pow(2, -z/zoom);
    //scale =  (float)2 * -z + 10;
    counter = (float)Math.random() * 10;
    counterInc = (float)(Math.random() * .06) - .03;
  }
  
  void draw()
  {
    counter+= counterInc;
    colorMode(HSB);
    stroke(360, 0, 255);
    //noFill();
    fill(fillColor, 255, 255);
    
    translate(position.x,position.y);
    
    float theta = counter;
    rotate(theta);
    rectMode(CENTER);
    rect(0, 0, w * scale, h * scale);
    
    resetMatrix();
    
    
  }
  
 
  
  
}
