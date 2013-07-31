flvmeta = require '../'
assert = require "assert"

describe 'flvmeta test suite', ->
	it 'dump', (done) ->
		flvmeta.dump "#{__dirname}/video.flv", {}, (err, metadata) ->
			assert.equal metadata.duration, 16.96
			assert.equal metadata.keyframes.times.length, 10
			assert.equal metadata.keyframes.filepositions.length, 10

			done err
			
	it 'check', (done) ->
		flvmeta.check "#{__dirname}/video.flv", {}, (err, result) ->
			assert.equal result.errors, 0
			assert.equal result.warnings, 0

			done err
			
	it 'update', (done) ->
		flvmeta.update "#{__dirname}/video.flv", {allKeyframes: true}, (err, metadata) ->
			assert.equal metadata.duration, 16.96

			done err