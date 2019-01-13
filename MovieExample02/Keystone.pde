import deadpixel.keystone.*;

Keystone ks;
boolean firstRunKs = true;

void setupKeystone() {
  ks = new Keystone(this); 
}

void updateKeystone() {
  if (firstRunKs) {
    try {
      ks.load();
      firstRunKs = false;
    } catch (Exception e) { }
  }
}
