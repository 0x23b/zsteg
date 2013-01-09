zsteg
======


Description
-----------
detect stegano-hidden data in PNG & BMP


Installation
------------
    gem install zsteg


Detects:
--------
 * LSB steganography in PNG & BMP
 * zlib-compressed data
 * [OpenStego](http://openstego.sourceforge.net/)
 * [Camouflage 1.2.1](http://camouflage.unfiction.com/)


Usage
-----

% zsteg -h

Examples
--------

### Simple LSB

% zsteg flower_rgb3.png

### Multi-result file

% zsteg cats.png

### wbStego simple

% zsteg wbsteg_noenc.bmp 1b,lsb,bY -v

### wbStego even distributed

% zsteg wbsteg_noenc_even.bmp 1b,lsb,bY -v

License
-------
Released under the MIT License.  See the [LICENSE](https://github.com/zed-0xff/zsteg/blob/master/LICENSE.txt) file for further details.
