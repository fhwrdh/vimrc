" Each theme is contained in its own file and declares variables scoped to the
" file.  These variables represent the possible "modes" that airline can
" detect.  The mode is the return value of mode(), which gets converted to a
" readable string.  The following is a list currently supported modes: normal,
" insert, replace, visual, and inactive.
"
" Each mode can also have overrides.  These are small changes to the mode that
" don't require a completely different look.  "modified" and "paste" are two
" such supported overrides.  These are simply suffixed to the major mode,
" separated by an underscore.  For example, "normal_modified" would be normal
" mode where the current buffer is modified.
"
" The theming algorithm is a 2-pass system where the mode will draw over all
" parts of the statusline, and then the override is applied after.  This means
" it is possible to specify a subset of the theme in overrides, as it will
" simply overwrite the previous colors.  If you want simultaneous overrides,
" then they will need to change different parts of the statusline so they do
" not conflict with each other.
"
" First, let's define an empty dictionary and assign it to the "palette"
" variable. The # is a separator that maps with the directory structure. If
" you get this wrong, Vim will complain loudly.
let g:airline#themes#fhwrdh#palette = {}

" First let's define some arrays. The s: is just a VimL thing for scoping the
" variables to the current script. Without this, these variables would be
" declared globally. Now let's declare some colors for normal mode and add it
" to the dictionary.  The array is in the format:
" See "help attr-list" for valid values for the "opt" value.

""" NORMAL [     guifg,     guibg, ctermfg, ctermbg, opts ]
let s:N1 = [ '#00005f', '#dfff00',     250,     233       ]
let s:N2 = [ '#ffffff', '#444444',     244,     234       ]
let s:N3 = [ '#9cffd3', '#202020',     248,     235       ]
let g:airline#themes#fhwrdh#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

" Here we define overrides for when the buffer is modified.  This will be
" applied after g:airline#themes#fhwrdh#palette.normal, hence why only certain keys are
" declared.
let g:airline#themes#fhwrdh#palette.normal_modified = {
       \ 'airline_c': [ '#ffffff' , '#5f005f' , 33     , 235      , ''     ] ,
       \ }

""" INSERT [     guifg,    guibg, ctermfg, ctermbg, opts ]
let s:I1 = [ '#00005f', '#00dfff',    252,      24       ]
let s:I2 = [ '#ffffff', '#005fff',    244,      234      ]
let s:I3 = [ '#ffffff', '#000080',    248,      235      ]
let g:airline#themes#fhwrdh#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#fhwrdh#palette.insert_modified = {
      \ 'airline_c': [ '#ffffff' , '#5f005f' , 33     , 235      , ''     ] ,
      \ }
let g:airline#themes#fhwrdh#palette.insert_paste = {
      \ 'airline_a': [ s:I1[0]   , '#d78700' , 2 , 234     , ''     ] ,
      \ }

""" REPLACE
let g:airline#themes#fhwrdh#palette.replace = copy(g:airline#themes#fhwrdh#palette.insert)
let g:airline#themes#fhwrdh#palette.replace.airline_a = [ s:I2[0]   , '#af0000' , 255 , 124     , ''     ]
"let g:airline#themes#fhwrdh#palette.replace_modified = g:airline#themes#fhwrdh#palette.insert_modified

""" VISUAL
let s:V1 = [ '#000000' , '#ffaf00' , 232 ,  64 ]
let s:V2 = [ '#000000' , '#ff5f00' , 244 , 234 ]
let s:V3 = [ '#ffffff' , '#5f0000' , 248 , 235 ]
let g:airline#themes#fhwrdh#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#fhwrdh#palette.visual_modified = {
      \ 'airline_c': [ '#ffffff' , '#5f005f' , 33     , 235      , ''     ] ,
      \ }

""" INACTIVE
let s:IA1 = [ '#4e4e4e' , '#1c1c1c' , 244 , 225 , '' ]
let s:IA2 = [ '#4e4e4e' , '#262626' , 244 , 235 , '' ]
let s:IA3 = [ '#4e4e4e' , '#303030' , 244 , 235 , '' ]
let g:airline#themes#fhwrdh#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
" let g:airline#themes#fhwrdh#palette.inactive_modified = {
"       \ 'airline_c': [ '#875faf' , '' , 33 , 235 , '' ] ,
"       \ }

" Accents are used to give parts within a section a slightly different look or
" color. Here we are defining a "red" accent, which is used by the 'readonly'
" part by default. Only the foreground colors are specified, so the background
" colors are automatically extracted from the underlying section colors. What
" this means is that regardless of which section the part is defined in, it
" will be red instead of the section's foreground color. You can also have
" multiple parts with accents within a section.
" let g:airline#themes#fhwrdh#palette.accents = {
"       \ 'red': [ '#ff0000' , '' , 160 , ''  ]
"       \ }

