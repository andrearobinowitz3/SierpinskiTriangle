int lengthMin = 2;
int initialTriangleSize = 750;
int maxRecursionDepth = 0;

public void setup()
{
  size (800,800);
  background (0,0,0);
}

public void draw()
{
  clear(); 
  background(0,0,0);
  maxRecursionDepth = 0;
  sierpinski (20,760,initialTriangleSize, 0);
  fill(255,255,255);
  text ("Click on right side of screen to decrease recursion; click on left side of screen to increase it.",5,10);
  text("Max Recursion Depth: "+maxRecursionDepth+", Length Min: "+lengthMin+".",550,10);
}

public void mouseClicked ()//optional
{

  if (mouseX < 400) {
    lengthMin = lengthMin / 2;
  }
  else
    {
      lengthMin = lengthMin * 2;
    }
   if (lengthMin < 2) {
     lengthMin = 2;
   }
 if (lengthMin > initialTriangleSize+100) {
     lengthMin = initialTriangleSize+100;
  }
}


public void sierpinski(int x, int y, int len, int recursionDepth) 
{
  
  if (recursionDepth > maxRecursionDepth) {
    maxRecursionDepth = recursionDepth;
  }
  if (len < lengthMin) {
    triangle((float)(x), (float)(y), (float)(x+len), (float)(y), (float)(x+(len/2)),(float)(y-len));
  }
  else
  {
    fill (5,0,50);
    stroke(255,0,0);
    sierpinski(x,y,len/2,recursionDepth+1);
    stroke (0,255,0);
    sierpinski(x+(len/2),y,len/2,recursionDepth+1);
    stroke (0,0,255);
    sierpinski(x+(len/4),y-(len/2),len/2,recursionDepth+1);
  }
}
