cp = require 'child_process'

exec = (filein, fileout, args, callback) ->
	args.push filein
	if fileout then args.push fileout
	
	process = cp.spawn('flvmeta', args);
	error = null
	output = null
	
	process.stdout.on 'data', (data) ->
		#console.log "data: #{data}"
		try
			output = JSON.parse(data)
		catch ex
			error = ex
	
	process.stderr.on 'data', (data) ->
		#console.log "error: #{data}"
		error = new Error data.toString().split('\n')[0]
	
	process.on 'close', (code) =>
		if code is 0
			callback null, output
		
		else
			if code is 10 and args[0] is '-C'
				# check mode returns code 10 if the file is not valid
				callback null, output
				
			else
				callback error, output

exports.update = (file, options, callback) ->
	args = ['-U', '-m', '-j']

	if options?.resetTimestamps is true then args.push '-t'
	if options?.allKeyframes is true then args.push '-k'
	if options?.ignore is true then args.push '-i'
	if options?.fix is true then args.push '-f'
	if options?.preserve is true then args.push '-p'
	if options?.noLastsecond is true then args.push '-s'
	if options?.add
		for key, value of options.add
			args.push "-a=#{key}=#{value}"

	exec file, options?.outputFile ? null, args, callback

exports.dump = (file, options, callback) ->
	args = ['-D', '-j']
	
	if options?.event then args.push "-e=#{options.event}"

	exec file, null, args, callback

exports.fullDump = (file, options, callback) ->
	args = ['-F', '-j']

	exec file, null, args, callback

exports.check = (file, options, callback) ->
	args = ['-C', '-j']
	
	if options?.level then args.push "-l=#{options.level}"
	if options?.quiet is true then args.push '-q'
	
	exec file, null, args, callback