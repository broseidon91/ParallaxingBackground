import java.util.*;

Camera camera;
float zoom = 10;
PVector cameraTarget;


boolean keyLeft = false;
boolean keyRight= false;
boolean keyUp= false;
boolean keyDown= false;
boolean keySpace = false;

PVector spread = new PVector();
Block block1;
Block block2;
Block block3;

ArrayList<Block> blocks = new ArrayList<Block>();


void setup()
{
  size(1024, 768, P2D);
  camera = new Camera();
  cameraTarget = new PVector(0,0);
  spread = new PVector(1000, 1000);
  

   
   
  for (int i = 0; i < 1000; i++)
 {
    Block b = new Block(new PVector((float)Math.random() * spread.x, (float)Math.random() * spread.y),
                        100f, 100f, (float)(Math.random() * 100));
    blocks.add(b);
   
  
 } 
 
 Collections.sort(blocks, new BlockSort());
  for (int i = 0; i < blocks.size(); i++)
  {
  println(blocks.get(i).scale);
  }
 
}



void draw()
{
  background(0);
  camera.target = cameraTarget;
  camera.update();
  
  if (keyUp) cameraTarget.y--;
  if (keyDown) cameraTarget.y++;
  if (keyLeft) cameraTarget.x--;
  if (keyRight) cameraTarget.x++;
  if (keySpace) zoom++;
  
  //Gamespace
  
  for (int i = blocks.size() - 1; i > 0; i--)
  {
   
    pushMatrix();
    applyMatrix(camera.GetMatrixForSpeed(blocks.get(i).scale));
    blocks.get(i).draw();
    popMatrix();
  }
  /*pushMatrix();
  applyMatrix(camera.GetMatrixForSpeed(1));
  block1.draw();
  block2.draw();
  block3.draw();
  
  popMatrix();*/

  
  
}



void keyPressed()
{

  if (keyCode == 38) keyUp = true;
  if (keyCode == 40) keyDown = true;
  if (keyCode == 37) keyLeft = true;
  if (keyCode == 39) keyRight = true;
  if (keyCode == 32) keySpace = true;
  
}

void keyReleased()
{
  if (keyCode == 38) keyUp = false;
  if (keyCode == 40) keyDown = false;
  if (keyCode == 37) keyLeft = false;
  if (keyCode == 39) keyRight = false;
  if (keyCode == 32) keySpace = false;
  
}
