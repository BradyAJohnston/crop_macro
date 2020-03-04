# Quick crop and scale bar in FIJI
Needing to process large amounts of .nd2 images, I created this macro to save a lot of time. 

1. Open the image with channels 1 & 2 activated (3 disabled)
1. Create box 600 px w/h
1. Allow user to move box to desired location
1. Crop image
1. Add 5 µm scale bar
1. Save as .jpg in same folder with `_cropped` appended to file name
1. Close image and open the next image in the folder

It’s a simple one, but it now saves a lot of time to batch-process a large number of images with different crop location requirements, but the same-formatted result.

```java
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
```
