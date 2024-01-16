# Alpha-Matting-for-Retinal-Blood-Vessel-Extraction
This repository extracts retinal blood vessels using Alpha Matting. 

Description
===========
A technique called alpha matting is used to extract a softly bordered foreground object from a background image. With the use of an input image and a grayscale trimap image that includes details about the foreground, background, and unknown pixels, this module calculates the alpha matte of objects in images. It is assumed that the unknown pixels are a mix of background and foreground pixels. To estimate the opacity of the foreground pixels in the unkown region, the algorithm uses a mix of multiple carefully defined pixel affinities.

The used source code for Alpha Matting is extracted from the following paper: 
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

