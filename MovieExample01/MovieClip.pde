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

// ~ ~ ~ ~ ~ ~ ~   SPRITE   ~ ~ ~ ~ ~ ~ ~

class MovieSprite extends MovieClip {
  
  PVector t;
  float ease = 2.0;
  int alpha = 0;
  float vol = 1;
  int fadeDelta = 5;
  boolean alive = true;

  MovieSprite(PApplet sketch, String fileName) {
    super(sketch, fileName);
    setPos(new PVector(width/2, height/2));
  }

  void update() {
    super.update();
    mover();
    fader();
  }
 
  void draw() {
    tint(255, alpha);
    super.draw();
    noTint();
  }
  
  void mover() {
    if (PVector.dist(t, p) > 0.1) {
      p.x = lerp(p.x, t.x, ease/100.0);
      p.y = lerp(p.y, t.y, ease/100.0);
    }
  }
    
  void fader() {
    if (alive && alpha < 255) {
      alpha += fadeDelta;
      if (alpha > 255) alpha = 255;
    } else if (!alive && alpha > 0) {
      alpha -= fadeDelta;
      if (alpha < 0) alpha = 0;
    }
    movie.volume((alpha/255.0) * vol);
  }
  
  void setPos(PVector _p) { 
    p = new PVector(_p.x, _p.y);
    t = new PVector(_p.x, _p.y);
  }

}
