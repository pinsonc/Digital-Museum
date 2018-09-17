//Digital Museum
//This project was creating during employment on a personal machine at Exploration Summer Schools. The concept
//was given to me by IT director Sam Osborn but this implementation was built by Conner Pinson for use
//by his second session EXPLO at Yale Computer Programming and Processing Students

//I was able to create a user interface in a programming language that is known to need a plug-in for that to
//be reasonable. The reason I did not use this plug-in was to make the code more understandable for the level of
//my students. I wanted to be able to explain the software that was displaying their projects

//I tried to cut down redunancy as much as possible. For uploading to GitHub, I have anonymized the student name data

//Museum Directory
//the first is the student name and the second is the location of the corresponding batch file to run to run the student's code
//an example batch file is available in the second tab
//If you use a Mac machine. God help you (jk, just figure out how to write a .command file that does a similar thing)
String [][] directory = {
  {"Name1", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name1.bat"}, 
  {"Name2", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name2.bat"}, 
  {"Name3", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name3.bat"}, 
  {"Name4", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name4.bat"}, 
  {"Name5", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name5.bat"}, 
  {"Name6", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name6.bat"}, 
  {"Name7", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name7.bat"}, 
  {"Name8", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name8.bat"}, 
  {"Name9", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name9.bat"}, 
  {"Name10", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name10.bat"}, 
  {"Name11", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name11.bat"}, 
  {"Name12", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name12.bat"}, 
  {"Name13", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name13.bat"}, 
  {"Name14", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name14.bat"}, 
  {"Name15", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name15.bat"}, 
  {"Name16", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name16.bat"}, 
  {"Name17", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name17.bat"}, 
  {"Name18", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name18.bat"}, 
  {"Name19", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name19.bat"}, 
  {"Name20", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name20.bat"}, 
  {"Name21", "/Users/pinso/OneDrive/Documents/Processing/digital_museum/Name21.bat"}
};
int total = 20; //num of participants
int curPos = 0;

PImage rightArrow;
PImage leftArrow;
PImage curImage; //current preview image being displayed

void setup() {
  fullScreen();

  textSize(32);
  rightArrow = loadImage("right.png");
  leftArrow = loadImage("left.png");
  textAlign(CENTER);
}

void draw() {
  background(242,139,32);
  textSize(32);
  fill(0);
  //text(mouseX + ", " + mouseY, 100, 100); //mouse pos for debug
  
  //static text
  text("Click the photo to open the code. Press the play button to play. Exit back to this screen when done.", 950, 50);
  text("Computer Programming + Processing | EXPLO 2018", 950, 950);
  text("Instructor: Conner Pinson", 950, 1000);
  
  //navigation arrows (clickable on screen)
  imageMode(CORNER);
  image(leftArrow, 50, height/2 - 24.5, 49, 42);
  image(rightArrow, width-99, height/2 - 24.5, 49, 42);
  
  //ensure that the preview image is named EXACTLY the same as the student's name. And is also a .JPG file (case sensitive)
  curImage = loadImage(directory[curPos][0] + ".JPG");
  
  //This takes some config. I had to pick and choose the dimensions for those with odd (way too big) resolutions
  imageMode(CENTER);
  if (curPos == 1 || curPos == 5 || curPos == 7 || curPos == 8 || curPos == 13 || curPos == 14 || curPos == 17 || curPos == 20) {
    image(curImage, 960, 450, 1280, 720);
  } else if (curPos == 0 || curPos == 10 || curPos == 16 || curPos == 4 || curPos == 15) {
    image(curImage, 960, 450, 700, 700);
  } else {
    image(curImage, 960, 450);
  }

  //student name display
  text(directory[curPos][0], 950, 900);
}

//also allow the curPos to be manipulated with the arrow keys
void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      if (curPos != 0) {
        curPos--;
      } else {
        curPos = total;
      }
    }
    if (keyCode == RIGHT) {
      if (curPos != total) {
        curPos++;
      } else {
        curPos = 0;
      }
    }
  }
}

void mousePressed() {
  //if you click the preview window, it launches the batch file
  if (mouseX > 320 && mouseY > 75 && mouseX < 1600 && mouseY < 795) {
    launch(directory[curPos][1]);
  }
  
  //hit detection for the on screen arrows
  if (mouseX > 50 && mouseY > height/2 - 24.5 && mouseY < height/2 + 24.5 && mouseX < 92) {
    if (curPos != 0) {
      curPos--;
    } else {
      curPos = total;
    }
  }
  if (mouseX > width - 99 && mouseY > height/2 - 24.5 && mouseY < height/2 + 24.5 && mouseX < width - 57) {
    if (curPos != total) {
      curPos++;
    } else {
      curPos = 0;
    }
  }
}
