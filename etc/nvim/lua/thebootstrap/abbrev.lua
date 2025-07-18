vim.cmd [[
iabbr teh the
iabbr Teh The
iabbr seperate separate
iabbr isnt isn't
iabbr arent aren't
iabbr cant can't
iabbr dont don't
iabbr lenght length
iabbr widht width
iabbr pritn print
iabbr todox [_]

iabbr ---- --------------------------------------------------------------------------------

iabbrev <expr> ,d strftime('%Y-%m-%d')
iabbrev <expr> ,t strftime('%Y-%m-%dT%TZ')
inoreabbrev <expr> ,u system('uuidgen')->trim()->tolower()
]]
