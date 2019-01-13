import processing.video.*;

class MovieClip {
  
  Movie movie;
  PVector p;

  MovieClip(PApplet sketch, String fileName) {
    movie = new Movie(sketch, fileName);
    movie.loop();
    p = new PVector(width/2, height/2);
  }

  void update() {
    if (movie.available()) {
      movie.read();
    }
  }
  
  void draw() {
    imageMode(CENTER);
    image(movie, p.x, p.y);
  }
  
  void run() { 
    update();
    draw();
  }

}
