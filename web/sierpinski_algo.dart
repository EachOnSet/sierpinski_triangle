part of sierpinski_triangle;

class Sierpinski {
  
  CanvasRenderingContext2D context;
  int maxDepth;
  Point p1, p2, p3;
  CanvasElement canvas;
  
  Sierpinski(CanvasElement inCanvas, int inDepth) {
    // Make sure the canvas is set
    canvas = inCanvas;
    context = inCanvas.getContext("2d");
    
    // Set triangles settings
    maxDepth = inDepth;
    calculateStartingPoints();
    
    // Draw sierpinski recursively
    doSierpinski(p1,p2,p3, inDepth);
  }
  
  // Calculate the 3 firsts starting points
  void calculateStartingPoints(){
    //p1 = new Point(0, canvas.clientHeight);
    //p2 = new Point(canvas.clientWidth/2, 0);
    //p3 = new Point(canvas.clientWidth, canvas.clientHeight);
    p1 = new Point(75, 150);
    p2 = new Point(150, 0);
    p3 = new Point(225, 150);
  }
  
  // Take 3 points and draw a triangle between the 3
  void drawTriangle(Point x1, Point x2, Point x3, int inDepth){
    context.lineWidth = 1;
    context.fillStyle = 'red';
    context.strokeStyle = 'black';
    context.beginPath();
    context.moveTo(x1.x, x1.y);
    context.lineTo(x2.x, x2.y);
    context.lineTo(x3.x, x3.y);
    context.closePath();
    context.fill();
  }
  
  // Calculate the halfway point between two endpoints
  Point getMid(Point inP1, Point inP2){ 
    if (inP1 != null) {
      Point newPoint = new Point((inP1.x + inP2.x) / 2, (inP1.y + inP2.y) / 2);
      return newPoint;
    }
  }
  
  // Recursive sierpinski
  void doSierpinski(Point inP1, Point inP2, Point inP3, int inDepth) {
    // Recursivity rule #1, base case 
    if (inDepth == 1) {
      drawTriangle(inP1, inP2, inP3, inDepth);
    } else {
      // Calculate 3 new points
      Point p12 = getMid(inP1, inP2);
      Point p23 = getMid(inP2, inP3);
      Point p13 = getMid(inP1, inP3);
  
      // Fill with 3 little triangles
      doSierpinski(inP1, p12, p13, inDepth - 1);
      doSierpinski(p12, inP2, p23, inDepth - 1);
      doSierpinski(p13, p23, inP3, inDepth - 1);
    }
  }
  
}