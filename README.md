# Alpha-Matting-for-Retinal-Blood-Vessel-Extraction
This repository extracts retinal blood vessels using Alpha Matting. 

Description
===========
A technique called alpha matting is used to extract a softly bordered foreground object from a background image. With the use of an input image and a grayscale trimap image that includes details about the foreground, background, and unknown pixels, this module calculates the alpha matte of objects in images. It is assumed that the unknown pixels are a mix of background and foreground pixels. The observed image I(x, y) is modeled as a combination of foreground F(x,y) and background B(x,y):
```
I(x, y) = alpha(x,y)F(x,y) + (1 - alpha(x,y)) B(x,y))
```
 
Where F is foreground, B is Background, and alpha ranges from 0 to 1. If alpha = 1 (or 0), it means that I(x, y) is in the foreground (or background). While alpha is a fractional value between (0, 1), these pixels are mixed. The trimap may be manually specified by the user, or produced by other binary segmentation approaches. In this work, to create trimap we used Hessian Matrix (Frangi, et al) for foreground and CLHAE for mixed pixels.


The source code for Alpha Matting in this repository is extracted from the following paper: 
```
author = {Yuanjie Zheng and Chandra Kambhamettu},
title = {Learning Based Digital Matting},
booktitle = {The 20th IEEE International Conference on Computer Vision},
year = {2009},
month = {September--October}
```


Basic Usage
===========

1. Run the 'demo.m' script.
2. Select image '01_test.tif'

