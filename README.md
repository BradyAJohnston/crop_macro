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
