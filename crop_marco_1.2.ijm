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

// gets metadata from the current image for sizing

getPixelSize(unit, pixelWidth, pixelHeight);

//calculates the length of the line (to equal 5 um)
len = 5/pixelWidth;

dir = File.directory;
name = getTitle();

//saves the composite image and closes what is open.
run("Scale Bar...", "width=5 height=5 font=0 color=White background=None location=[Lower Left] overlay");
save(dir + name + "_cropped" + ".jpg");
close();
//ff
//opens the new jpg to add on the scale bar.
//open(dir + name + "_cropped.jpg");

//sets colour and dimension for the scale bar
//setColor("white");
//setLineWidth(5);

//run("Scale Bar...", "width=10 height=4 font=12 color=white background=None location=[Lower Left] overlay");


//draws the scale bar
//drawLine(20, 580, 20+len, 580);
//drawRect(20, 580, len, 5);

//saves and closes the final image, overwriting the previous jpg
//save(dir + name + "_cropped" + ".jpg");

//close();

}
//////////////////////////////////////////////////////////////////////////////////////////