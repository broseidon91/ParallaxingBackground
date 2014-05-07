class Camera
{
  PVector screen = new PVector();
  PVector target;
  PMatrix2D matrix = new PMatrix2D();
  PMatrix2D tmatrix = new PMatrix2D();
  
  
  Camera()
  {
     screen = new PVector(width/2, height/2); 
  }
  void update()
  {
    
    matrix.reset();
    //matrix.translate(screen.x, screen.y);
    //matrix.scale(zoom);
    //matrix.translate(-target.x * zoom, -target.y * zoom);

    tmatrix.reset();
    tmatrix.translate(target.x, target.y);
    tmatrix.scale(1/zoom);
    tmatrix.translate(-screen.x, -screen.y);
  }
  
   PMatrix2D GetMatrixForSpeed(float speed)
  {
    matrix = new PMatrix2D();
    matrix.translate(screen.x, screen.y);
    float offset = speed * zoom;
    matrix.translate(-target.x * offset, -target.y * offset);
    return matrix;
  }
  
  
}
