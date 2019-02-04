# Digital-Museum

*Note: .pde files must be placed within files with the exact same name in order to be run. So every file and folder in this directory should be placed in a file called **digital_museum_v2***

This project was developed on a 1920x1080 display and I did not have access to a machine or display with a different display for debugging

## Reasoning

This project was created to assist my course taught at Exploration Summer Schools. The concept was given to me by IT director Sam Osborn but this implementation was built by me for use by my second session EXPLO at Yale Computer Programming and Processing Students.

I chose to build this application to allow my students to present their hard work at the Art Show that takes place on the last week of the session. I created it in my free time in order to give my computer programming students an opportunity to present their work like the rest of the program was able to.

The project was created using Processing Java which is NOT the best to design a Graphical User Interface. This is so I could explain the code to my students in an effort to let them understand the code that would be displaying their own projects. It was an attempt at a learning opportunity but I think it just normalized hack-y code for them.

## Implementation

The program uses a String[][] structure to hold student names and a directory to a .bat file that will open the corresponding student project. An example batch file is included in the file batch_example.pde

Lines **74-82** requires some configuration based on the studenet projects you are implementing. For example, image 1 had a resolution of 1920x1080, so it was scaled down to 1280x720 to fit within the click window given by the application. Other square-shaped applications were scaled down to 700x700

The variable curPos keeps track of which project window the viewer is currently on. It can be navigated using arrow keys (implemented in lines 88-106) and by clicking on the onscreen arrows (lines 114-129)

Clicking on the preview image will cause the program to launch in a new window (109-112). The clickable area does not change according to the scale of the actual image. It stays at 1280x720.

## Demo

A demo in the form of a gif is available [here](https://imgur.com/a/9ajAA3G) since getting the program to run will take some config. I figured you would at least like to see what it looks like first.

## TODO
- Change file names to xxName convention so they are more neatly ordered
- Known issue: the first Processing window that is opened by the program will be opened underneath the museum. After the first one is alt-tabbed to and given focus, all the rest will appear on top
