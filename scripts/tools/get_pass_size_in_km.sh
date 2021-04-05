#!/bin/bash
#
# Purpose: Return the pass geometry after wxtoimg does automated cropping.
#
# Input parameters: pristine.png
#
# Output parameters: length in km
#                    width in km
# Note: the width is a constant 1440 km
#       the length is 4 km per row
# 
# Algorithm: use convert to measure the length and assume the width is 360 pixels as that is the sensor width.
#
# Usage get_pass_size_in_km.sh pristine.jpg output_width output_length
#

# change input params to sane names for readability
IN_FILE=$1
OUT_WIDTH=$2
OUT_LENGTH=$3

OUT_WIDTH=360 * 4
# Sample output from convert: "Size: 909x1436"
length_in_pixels=$(convert IN_FILE -print "Size: %wx%h\n" /dev/null | awk -F'x' '{print $2}') 
OUT_LENGTH=length_in_pixels * 4
