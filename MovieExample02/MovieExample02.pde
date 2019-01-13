MovieSpriteKeystone clip1, clip2;

void setup() {
  size(800, 600, P3D);

  setupKeystone();
  
  clip1 = new MovieSpriteKeystone(this, "cat.mp4");
  clip2 = new MovieSpriteKeystone(this, "peach.mp4");  
}

void draw() { 
  updateKeystone();
  background(0);
  clip1.run();
  clip2.run();
}
