#node-flvmeta

NodeJS module for [FLVmeta](https://github.com/noirotm/flvmeta).

##Installation

    npm install flvmeta

##Getting started

```javascript
var flvmeta = require('flvmeta'); 
```

##Dump

Dump onMetaData tag of FLV file.

```javascript
flvmeta.dump('./video.flv', {}, function(err, metadata) {
	console.dir(metadata);
});
```

###Options

* `event` Specify the event to be dumped instead of `onMetadata`.

###Output example

```
{
	hasMetadata: true,
	hasVideo: true,
	hasAudio: true,
	duration: 16.96,
	lasttimestamp: 16.92,
	lastkeyframetimestamp: 16.92,
	width: 360,
	height: 288,
	videodatarate: 261.092275943,
	framerate: 25,
	audiodatarate: 39.0472987913,
	audiosamplerate: 22050,
	audiosamplesize: 16,
	stereo: true,
	filesize: 669599,
	videosize: 571888,
	audiosize: 92555,
	datasize: 843,
	metadatacreator: 'flvmeta 1.2.0-dev+g',
	metadatadate: '2013-07-31T19:32:14',
	audiocodecid: 2,
	videocodecid: 4,
	audiodelay: 0,
	canSeekToEnd: true,
	hasCuePoints: false,
	cuePoints: [],
	hasKeyframes: true,
	keyframes: {
		times: [0, 2.4, 4.8, 6.52, 8.28, 10.24, 12.64, 14.72, 16.84, 16.92],
		filepositions: [972, 79657, 172569, 236626, 295396, 403896, 496815, 587839, 667774, 669388]
	}
}
```

##Check

Check the validity of FLV file.

```javascript
flvmeta.check('./video.flv', {level: 'warning'}, function(err, result) {
	console.dir(result); // <- {errors: 0, warnings: 0}
});
```

###Options

* `level` Print only messages where level is at least `level`. `level` is `info`, `warning` (default), `error`, or `fatal`.
* `quiet` Do not print messages, only return the status code

##Update

Update computed onMetaData tag of FLV file.

```javascript
flvmeta.update('./video.flv', {allKeyframes: true}, function(err, metadata) {
	console.dir(metadata); // <- contains updated metadata
});
```

###Options

* `add` Add a metadata string value to the output file. Example: `add: {key: value}`
* `allKeyframes` Index all keyframe tags, including duplicate timestamps. Boolean, default `false`.
* `fix` Fix invalid tags from the input file. Boolean, default `false`.
* `ignore` Ignore invalid tags from the input file (the default is to stop with an error). Boolean, default `false`.
* `noLastsecond` Do not create the onLastSecond tag. Boolean, default `false`.
* `outputFile` Specifies path to output file (the default is to overwrite source file).
* `preserve` Preserve input file existing onMetadata tags. Boolean, default `false`.
* `resetTimestamps` Reset timestamps so output file starts at zero. Boolean, default `false`.

##TODO

- [ ] find out how check report errors and warnings

##License

Copyright (c) 2013 Patrik Simek

The MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
