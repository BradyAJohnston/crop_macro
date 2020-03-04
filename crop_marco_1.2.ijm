// Quick cropping of images for my friend Yee-seng 
//////////////////////////////////////////////////////////////////////////////////////////

// Choosing the directory to work on

dir=getDirectory("Select the directory"); 

setBatchMode(false)

//gets list of files to operate on

list=getFileList(dir);

//what is going to be done on this list of files
//////////////////////////////////////////////////////////////////////////////////////////
for (i = 0; i < list.length; i++) {
	
f1= dir + list[i];

print(f1);

//imports as composite image
run("Bio-Formats Importer", "open=" + f1 + " autoscale color_mode=Composite view=Hyperstack stack_order=XYCZT");

//turns off third channel
Stack.setActiveChannels("110");

// Dimensions of the box

px = 600;

// makes the box to choose where you crop

makeRectangle(0, 0, px, px);

//wait for input saying box is drawn

waitForUser("Move box to your selection and press OK to crop.");

//crops at the box
run("Crop");

//sets directory and gets file name for saving new .jpg file
dir = File.directory;
name = getTitle();

//adds scale bar to image with width = 5 um and height = 5 px. Font=0 means no text is present. 
// "overlay" ensures the scale bar is white and on-top of all layers rather than coloured to 
// a channels assigned colour

run("Scale Bar...", "width=5 height=5 font=0 color=White background=None location=[Lower Left] overlay");

//saves the composite image and closes what is open.
save(dir + name + "_cropped" + ".jpg");


close();

//////////////////////////////////////////////////////////////////////////////////////////