" Vim syntax file
" Language:     Graphviz
" Filenames:    *.dot *.gv
" Maintainer:   pi-rho <pi-rho@tyr.cx>
" OriginalMaintainer:   Markus Mottl  <markus.mottl@gmail.com>
" Last Change:  2011 May 17 - improved identifier matching + two new keywords
"               2001 May 04 - initial version

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Settings
syn sync    minlines=50
syn sync    maxlines=500
syn case    ignore

" Errors
syn match   dotParErr     ")"
syn match   dotBrackErr   "]"
syn match   dotBraceErr   "}"

" Enclosing delimiters
syn region  dotEncl transparent matchgroup=dotParEncl start="(" matchgroup=dotParEncl end=")" contains=ALLBUT,dotParErr
syn region  dotEncl transparent matchgroup=dotBrackEncl start="\[" matchgroup=dotBrackEncl end="\]" contains=ALLBUT,dotBrackErr
syn region  dotEncl transparent matchgroup=dotBraceEncl start="{" matchgroup=dotBraceEncl end="}" contains=ALLBUT,dotBraceErr

" Comments
syn region  dotComment start="//" end="$" contains=dotComment,dotTodo
syn region  dotComment start="/\*" end="\*/" contains=dotComment,dotTodo
syn keyword dotTodo contained TODO FIXME XXX

" Data Types
syn keyword dotBoolean true false
syn match   dotFloat   /\v<\d+[.]\d+>/
syn match   dotNumber  /\v<\d+>/
syn region  dotString  start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=dotStyle

" Escape strings
syn match   dotEscString /\v\\(N|G|E|T|H|L)/ containedin=dotString
syn match   dotEscString /\v\\(n|l|r)/       containedin=dotString

" Special chars
syn match  dotKeyChar  "="
syn match  dotKeyChar  ";"
syn match  dotKeyChar  "->"
syn match  dotKeyChar  "--"

" General keywords
syn keyword dotKeyword graph digraph subgraph node edge strict

" Cluster name
syn match   dotCluster /\vsubgraph\s*\zscluster\S+/

" attributes
syn keyword dotAttr bgcolor class color colorscheme comment fillcolor fontcolor fontname fontsize gradientangle href id
syn keyword dotAttr label labeljust labelloc layer lheight lp lwidth margin nojustify ordering orientation penwidth peripheries
syn keyword dotAttr pos rank root showboxes sortv style target tooltip url xlabel xlp

" attributes: Cluster
syn keyword dotAttr pencolor

" attributres: Edge
syn keyword dotAttr arrowhead arrowsize arrowtail constraint decorate dir edgeURL edgehref edgetarget edgetooltip headURL head_lp
syn keyword dotAttr headclip headhref headlabel headport headtarget headtooltip
syn keyword dotAttr labelURL labelangle labeldistance labelfloat labelfontcolor labelfontname labelfontsize labelhref labeltarget labeltooltip
syn keyword dotAttr len lhead ltail minlen samehead sametail tailURL tail_lp tailclip tailhref taillabel tailport tailtarget tailtooltip
syn keyword dotAttr weight

" attributes: Graph
syn keyword dotAttr Damping _background bb center charset clusterrank compound concentrate defaultdist dim dimen diredgeconstraints
syn keyword dotAttr dpi epsilon esep fontnames fontpath forcelabels imagepath inputscale label_scheme landscape layerlistsep
syn keyword dotAttr layers layerselect layersep layout levels levelsgap maxiter mclimit mindist mode model mosek newrank nodesep normalize
syn keyword dotAttr notranslate nslimit nslimit1 outputorder overlap overlap_scaling overlap_shrink pack packmode pad
syn keyword dotAttr page pagedir quadtree quantum rankdir ranksep ratio remincross repulsiveforce resolution rotate rotation scale
syn keyword dotAttr searchsize sep size smoothing splines start stylesheet truecolor viewport voro_margin xdotversion

" attributes: Nodes
syn keyword dotAttr distortion fixedsize group height image imagepos imagescale pin rects regular samplepoints shape shapefile
syn keyword dotAttr sides skew vertices width z

" RankType values
syn keyword dotRank min max source sink same

" node shapes (ShapeType)
syn keyword dotShape box polygon ellipse oval circle point egg triangle plaintext plain diamond trapezium
syn keyword dotShape parallelogram house pentagon hexagon septagon octagon doublecircle doubleoctagon
syn keyword dotShape tripleoctagon invtriangle invtrapezium invhouse Mdiamond Msquare Mcircle rect rectangle
syn keyword dotShape square star none underline cylinder note tab folder box3d component promoter cds
syn keyword dotShape terminator utr primersite restrictionsite fivepoverhang threepoverhang noverhang
syn keyword dotShape assembly signature insulator ribosite rnastab proteasesite proteinstab rpromoter
syn keyword dotShape rarrow larrow lpromoter

" For nodes and edges (StyleType)
syn keyword dotStyle dashed dotted solid invis bold

" For edges only (StyleType)
syn keyword dotStyle tapered

" For nodes only (StyleType)
syn keyword dotStyle filled striped wedged diagonals rounded

" Named colors {{{
syn keyword dotColorX11 AliceBlue BlanchedAlmond BlueViolet
syn keyword dotColorX11 AntiqueWhite AntiqueWhite1 AntiqueWhite2 AntiqueWhite3 AntiqueWhite4
syn keyword dotColorX11 CadetBlue CadetBlue1 CadetBlue2 CadetBlue3 CadetBlue4
syn keyword dotColorX11 CornflowerBlue DarkBlue DarkCyan
syn keyword dotColorX11 DarkGoldenrod DarkGoldenrod1 DarkGoldenrod2 DarkGoldenrod3 DarkGoldenrod4
syn keyword dotColorX11 DarkGray DarkGreen DarkGrey DarkKhaki DarkMagenta
syn keyword dotColorX11 DarkOliveGreen DarkOliveGreen1 DarkOliveGreen2 DarkOliveGreen3 DarkOliveGreen4
syn keyword dotColorX11 DarkOrange DarkOrange1 DarkOrange2 DarkOrange3 DarkOrange4
syn keyword dotColorX11 DarkOrchid DarkOrchid1 DarkOrchid2 DarkOrchid3 DarkOrchid4
syn keyword dotColorX11 DarkRed DarkSalmon DarkSlateBlue
syn keyword dotColorX11 DarkSeaGreen DarkSeaGreen1 DarkSeaGreen2 DarkSeaGreen3 DarkSeaGreen4
syn keyword dotColorX11 DarkSlateGray DarkSlateGray1 DarkSlateGray2 DarkSlateGray3 DarkSlateGray4
syn keyword dotColorX11 DarkSlateGrey DarkTurquoise DarkViolet
syn keyword dotColorX11 DeepPink DeepPink1 DeepPink2 DeepPink3 DeepPink4
syn keyword dotColorX11 DeepSkyBlue DeepSkyBlue1 DeepSkyBlue2 DeepSkyBlue3 DeepSkyBlue4
syn keyword dotColorX11 DimGray DimGrey
syn keyword dotColorX11 DodgerBlue DodgerBlue1 DodgerBlue2 DodgerBlue3 DodgerBlue4
syn keyword dotColorX11 FloralWhite ForestGreen GhostWhite GreenYellow
syn keyword dotColorX11 HotPink HotPink1 HotPink2 HotPink3 HotPink4
syn keyword dotColorX11 IndianRed IndianRed1 IndianRed2 IndianRed3 IndianRed4
syn keyword dotColorX11 LavenderBlush LavenderBlush1 LavenderBlush2 LavenderBlush3 LavenderBlush4
syn keyword dotColorX11 LemonChiffon LemonChiffon1 LemonChiffon2 LemonChiffon3 LemonChiffon4
syn keyword dotColorX11 LightBlue LightBlue1 LightBlue2 LightBlue3 LightBlue4
syn keyword dotColorX11 LawnGreen LightCoral
syn keyword dotColorX11 LightCyan LightCyan1 LightCyan2 LightCyan3 LightCyan4
syn keyword dotColorX11 LightGoldenrod LightGoldenrod1 LightGoldenrod2 LightGoldenrod3 LightGoldenrod4
syn keyword dotColorX11 LightGoldenrodYellow LightGray LightGreen LightGrey
syn keyword dotColorX11 LightPink LightPink1 LightPink2 LightPink3 LightPink4
syn keyword dotColorX11 LightSalmon LightSalmon1 LightSalmon2 LightSalmon3 LightSalmon4
syn keyword dotColorX11 LightSkyBlue LightSkyBlue1 LightSkyBlue2 LightSkyBlue3 LightSkyBlue4
syn keyword dotColorX11 LightSeaGreen LightSlateBlue LightSlateGray LightSlateGrey
syn keyword dotColorX11 LightSteelBlue LightSteelBlue1 LightSteelBlue2 LightSteelBlue3 LightSteelBlue4
syn keyword dotColorX11 LightYellow LightYellow1 LightYellow2 LightYellow3 LightYellow4
syn keyword dotColorX11 LimeGreen MediumAquamarine MediumBlue
syn keyword dotColorX11 MediumOrchid MediumOrchid1 MediumOrchid2 MediumOrchid3 MediumOrchid4
syn keyword dotColorX11 MediumPurple MediumPurple1 MediumPurple2 MediumPurple3 MediumPurple4
syn keyword dotColorX11 MediumSeaGreen MediumSlateBlue MediumSpringGreen MediumTurquoise MediumVioletRed
syn keyword dotColorX11 MistyRose MistyRose1 MistyRose2 MistyRose3 MistyRose4
syn keyword dotColorX11 NavajoWhite NavajoWhite1 NavajoWhite2 NavajoWhite3 NavajoWhite4
syn keyword dotColorX11 MidnightBlue MintCream NavyBlue OldLace
syn keyword dotColorX11 OliveDrab OliveDrab1 OliveDrab2 OliveDrab3 OliveDrab4
syn keyword dotColorX11 OrangeRed OrangeRed1 OrangeRed2 OrangeRed3 OrangeRed4
syn keyword dotColorX11 PaleGreen PaleGreen1 PaleGreen2 PaleGreen3 PaleGreen4
syn keyword dotColorX11 PaleTurquoise PaleTurquoise1 PaleTurquoise2 PaleTurquoise3 PaleTurquoise4
syn keyword dotColorX11 PaleVioletRed PaleVioletRed1 PaleVioletRed2 PaleVioletRed3 PaleVioletRed4
syn keyword dotColorX11 PeachPuff PeachPuff1 PeachPuff2 PeachPuff3 PeachPuff4
syn keyword dotColorX11 PaleGoldenrod PapayaWhip PowderBlue RebeccaPurple
syn keyword dotColorX11 RosyBrown RosyBrown1 RosyBrown2 RosyBrown3 RosyBrown4
syn keyword dotColorX11 RoyalBlue RoyalBlue1 RoyalBlue2 RoyalBlue3 RoyalBlue4
syn keyword dotColorX11 SaddleBrown SandyBrown
syn keyword dotColorX11 SeaGreen SeaGreen1 SeaGreen2 SeaGreen3 SeaGreen4
syn keyword dotColorX11 SkyBlue SkyBlue1 SkyBlue2 SkyBlue3 SkyBlue4
syn keyword dotColorX11 SlateBlue SlateBlue1 SlateBlue2 SlateBlue3 SlateBlue4
syn keyword dotColorX11 SlateGray SlateGray1 SlateGray2 SlateGray3 SlateGray4 SlateGrey
syn keyword dotColorX11 SpringGreen SpringGreen1 SpringGreen2 SpringGreen3 SpringGreen4
syn keyword dotColorX11 SteelBlue SteelBlue1 SteelBlue2 SteelBlue3 SteelBlue4
syn keyword dotColorX11 VioletRed VioletRed1 VioletRed2 VioletRed3 VioletRed4
syn keyword dotColorX11 WebGray WebGreen WebGrey WebMaroon WebPurple
syn keyword dotColorX11 X11Gray X11Green X11Grey X11Maroon X11Purple
syn keyword dotColorX11 WhiteSmoke YellowGreen
syn keyword dotColorX11 aqua aquamarine aquamarine1 aquamarine2 aquamarine3 aquamarine4
syn keyword dotColorX11 azure azure1 azure2 azure3 azure4
syn keyword dotColorX11 bisque bisque1 bisque2 bisque3 bisque4
syn keyword dotColorX11 beige black
syn keyword dotColorX11 blue blue1 blue2 blue3 blue4
syn keyword dotColorX11 brown brown1 brown2 brown3 brown4
syn keyword dotColorX11 burlywood burlywood1 burlywood2 burlywood3 burlywood4
syn keyword dotColorX11 chartreuse chartreuse1 chartreuse2 chartreuse3 chartreuse4
syn keyword dotColorX11 chocolate chocolate1 chocolate2 chocolate3 chocolate4
syn keyword dotColorX11 coral coral1 coral2 coral3 coral4
syn keyword dotColorX11 cornsilk cornsilk1 cornsilk2 cornsilk3 cornsilk4
syn keyword dotColorX11 cyan cyan1 cyan2 cyan3 cyan4
syn keyword dotColorX11 firebrick firebrick1 firebrick2 firebrick3 firebrick4
syn keyword dotColorX11 crimson fuchsia gainsboro
syn keyword dotColorX11 gold gold1 gold2 gold3 gold4
syn keyword dotColorX11 goldenrod goldenrod1 goldenrod2 goldenrod3 goldenrod4
syn keyword dotColorX11 gray gray0 gray100
syn keyword dotColorX11 gray1 gray10 gray11 gray12 gray13 gray14 gray15 gray16 gray17 gray18 gray19
syn keyword dotColorX11 gray2 gray20 gray21 gray22 gray23 gray24 gray25 gray26 gray27 gray28 gray29
syn keyword dotColorX11 gray3 gray30 gray31 gray32 gray33 gray34 gray35 gray36 gray37 gray38 gray39
syn keyword dotColorX11 gray4 gray40 gray41 gray42 gray43 gray44 gray45 gray46 gray47 gray48 gray49
syn keyword dotColorX11 gray5 gray50 gray51 gray52 gray53 gray54 gray55 gray56 gray57 gray58 gray59
syn keyword dotColorX11 gray6 gray60 gray61 gray62 gray63 gray64 gray65 gray66 gray67 gray68 gray69
syn keyword dotColorX11 gray7 gray70 gray71 gray72 gray73 gray74 gray75 gray76 gray77 gray78 gray79
syn keyword dotColorX11 gray8 gray80 gray81 gray82 gray83 gray84 gray85 gray86 gray87 gray88 gray89
syn keyword dotColorX11 gray9 gray90 gray91 gray92 gray93 gray94 gray95 gray96 gray97 gray98 gray99
syn keyword dotColorX11 grey grey0 grey100
syn keyword dotColorX11 grey1 grey10 grey11 grey12 grey13 grey14 grey15 grey16 grey17 grey18 grey19
syn keyword dotColorX11 grey2 grey20 grey21 grey22 grey23 grey24 grey25 grey26 grey27 grey28 grey29
syn keyword dotColorX11 grey3 grey30 grey31 grey32 grey33 grey34 grey35 grey36 grey37 grey38 grey39
syn keyword dotColorX11 grey4 grey40 grey41 grey42 grey43 grey44 grey45 grey46 grey47 grey48 grey49
syn keyword dotColorX11 grey5 grey50 grey51 grey52 grey53 grey54 grey55 grey56 grey57 grey58 grey59
syn keyword dotColorX11 grey6 grey60 grey61 grey62 grey63 grey64 grey65 grey66 grey67 grey68 grey69
syn keyword dotColorX11 grey7 grey70 grey71 grey72 grey73 grey74 grey75 grey76 grey77 grey78 grey79
syn keyword dotColorX11 grey8 grey80 grey81 grey82 grey83 grey84 grey85 grey86 grey87 grey88 grey89
syn keyword dotColorX11 grey9 grey90 grey91 grey92 grey93 grey94 grey95 grey96 grey97 grey98 grey99
syn keyword dotColorX11 green green1 green2 green3 green4
syn keyword dotColorX11 honeydew honeydew1 honeydew2 honeydew3 honeydew4
syn keyword dotColorX11 ivory ivory1 ivory2 ivory3 ivory4
syn keyword dotColorX11 khaki khaki1 khaki2 khaki3 khaki4
syn keyword dotColorX11 indigo lavender lime linen
syn keyword dotColorX11 magenta magenta1 magenta2 magenta3 magenta4
syn keyword dotColorX11 maroon maroon1 maroon2 maroon3 maroon4
syn keyword dotColorX11 moccasin navy olive
syn keyword dotColorX11 orange orange1 orange2 orange3 orange4
syn keyword dotColorX11 orchid orchid1 orchid2 orchid3 orchid4
syn keyword dotColorX11 pink pink1 pink2 pink3 pink4
syn keyword dotColorX11 plum plum1 plum2 plum3 plum4
syn keyword dotColorX11 purple purple1 purple2 purple3 purple4
syn keyword dotColorX11 red red1 red2 red3 red4
syn keyword dotColorX11 salmon salmon1 salmon2 salmon3 salmon4
syn keyword dotColorX11 seashell seashell1 seashell2 seashell3 seashell4
syn keyword dotColorX11 sienna sienna1 sienna2 sienna3 sienna4
syn keyword dotColorX11 snow snow1 snow2 snow3 snow4
syn keyword dotColorX11 tan tan1 tan2 tan3 tan4
syn keyword dotColorX11 thistle thistle1 thistle2 thistle3 thistle4
syn keyword dotColorX11 tomato tomato1 tomato2 tomato3 tomato4
syn keyword dotColorX11 turquoise turquoise1 turquoise2 turquoise3 turquoise4
syn keyword dotColorX11 wheat wheat1 wheat2 wheat3 wheat4
syn keyword dotColorX11 peru silver teal violet white
syn keyword dotColorX11 yellow yellow1 yellow2 yellow3 yellow4
" }}}

" Define the default highlighting.
" Only when an item doesn't have highlighting yet

hi def link dotBoolean   Boolean
hi def link dotNumber    Number
hi def link dotFloat     Float
hi def link dotString    String
hi def link dotEscString Type
hi def link dotKeyChar   Label

hi def link dotBraceEncl Label
hi def link dotBraceErr  Error

hi def link dotBrackEncl Label
hi def link dotBrackErr  Error

hi def link dotParEncl   Keyword
hi def link dotParErr    Error

hi def link dotComment   Comment
hi def link dotTodo      Todo
hi def link dotKeyword   Statement
hi def link dotCluster   Function

hi def link dotAttr      Type

hi def link dotRank      Include
hi def link dotShape     Constant
hi def link dotStyle     Include
hi def link dotColorX11  Include

let b:current_syntax = "dot"

" vim: ts=8
