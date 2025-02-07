# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

TEXLIVE_MODULE_CONTENTS="
	collection-luatex.r72049
	addliga.r50912
	addtoluatexpath.r70655
	auto-pst-pdf-lua.r66637
	barracuda.r63708
	bezierplot.r72750
	blopentype.r69080
	checkcites.r70397
	chickenize.r57325
	chinese-jfm.r57758
	cloze.r55763
	combofont.r51348
	cstypo.r41986
	ctablestack.r38514
	ekdosis.r69568
	emoji.r59961
	emojicite.r55131
	enigma.r29802
	gitinfo-lua.r72284
	ideavault.r71622
	innerscript.r72066
	interpreter.r27232
	kanaparser.r48052
	ligtype.r67601
	linebreaker.r66639
	longmath.r71709
	lparse.r65693
	lt3luabridge.r71704
	lua-placeholders.r70850
	lua-tinyyaml.r66776
	lua-typo.r70978
	lua-uca.r71218
	lua-ul.r70203
	lua-uni-algos.r62204
	lua-visual-debug.r65464
	lua-widow-control.r70601
	luaaddplot.r72350
	luacas.r67247
	luacensor.r71922
	luacode.r25193
	luacolor.r67987
	luacomplex.r68883
	luagcd.r68893
	luahttp.r67348
	luahyphenrules.r56200
	luaimageembed.r50788
	luaindex.r25882
	luainputenc.r20491
	luakeys.r72484
	lualatex-math.r61464
	lualatex-truncate.r67201
	lualibs.r67994
	lualinalg.r68918
	luamathalign.r63226
	luamaths.r68883
	luamml.r72714
	luamodulartables.r68893
	luamplib.r72835
	luaoptions.r64870
	luaotfload.r70232
	luapackageloader.r54779
	luaplot.r68918
	luaprogtable.r56113
	luaquotes.r65652
	luarandom.r68847
	luaset.r68883
	luatex85.r41456
	luatexbase.r52663
	luatexko.r68243
	luatextra.r20747
	luatruthtable.r68893
	luavlna.r71156
	luaxml.r72858
	lutabulartools.r67714
	minim.r70885
	minim-math.r70885
	minim-mp.r70885
	minim-pdf.r70885
	minim-xmp.r70885
	newpax.r68762
	nodetree.r72318
	odsfile.r72514
	optex.r71642
	pdfarticle.r51127
	pdfextra.r65184
	penlight.r72301
	penlightplus.r72426
	piton.r72889
	placeat.r45145
	plantuml.r72315
	pyluatex.r69372
	scikgtex.r66764
	selnolig.r68747
	semesterplannerlua.r71322
	showhyphenation.r67602
	showkerning.r67603
	spacekern.r67604
	spelling.r30715
	stricttex.r56320
	sympycalc.r67087
	tango.r71825
	texfindpkg.r67027
	truthtable.r68300
	tsvtemplate.r65333
	typewriter.r46641
	uninormalize.r57257
	yamlvars.r72052
"
TEXLIVE_MODULE_DOC_CONTENTS="
	addliga.doc.r50912
	addtoluatexpath.doc.r70655
	auto-pst-pdf-lua.doc.r66637
	barracuda.doc.r63708
	bezierplot.doc.r72750
	blopentype.doc.r69080
	checkcites.doc.r70397
	chickenize.doc.r57325
	chinese-jfm.doc.r57758
	cloze.doc.r55763
	combofont.doc.r51348
	cstypo.doc.r41986
	ctablestack.doc.r38514
	ekdosis.doc.r69568
	emoji.doc.r59961
	emojicite.doc.r55131
	enigma.doc.r29802
	gitinfo-lua.doc.r72284
	ideavault.doc.r71622
	innerscript.doc.r72066
	interpreter.doc.r27232
	kanaparser.doc.r48052
	ligtype.doc.r67601
	linebreaker.doc.r66639
	longmath.doc.r71709
	lparse.doc.r65693
	lt3luabridge.doc.r71704
	lua-placeholders.doc.r70850
	lua-tinyyaml.doc.r66776
	lua-typo.doc.r70978
	lua-uca.doc.r71218
	lua-ul.doc.r70203
	lua-uni-algos.doc.r62204
	lua-visual-debug.doc.r65464
	lua-widow-control.doc.r70601
	luaaddplot.doc.r72350
	luacas.doc.r67247
	luacensor.doc.r71922
	luacode.doc.r25193
	luacolor.doc.r67987
	luacomplex.doc.r68883
	luagcd.doc.r68893
	luahttp.doc.r67348
	luahyphenrules.doc.r56200
	luaimageembed.doc.r50788
	luaindex.doc.r25882
	luainputenc.doc.r20491
	luakeys.doc.r72484
	lualatex-math.doc.r61464
	lualatex-truncate.doc.r67201
	lualibs.doc.r67994
	lualinalg.doc.r68918
	luamathalign.doc.r63226
	luamaths.doc.r68883
	luamml.doc.r72714
	luamodulartables.doc.r68893
	luamplib.doc.r72835
	luaoptions.doc.r64870
	luaotfload.doc.r70232
	luapackageloader.doc.r54779
	luaplot.doc.r68918
	luaprogtable.doc.r56113
	luaquotes.doc.r65652
	luarandom.doc.r68847
	luaset.doc.r68883
	luatex85.doc.r41456
	luatexbase.doc.r52663
	luatexko.doc.r68243
	luatextra.doc.r20747
	luatruthtable.doc.r68893
	luavlna.doc.r71156
	luaxml.doc.r72858
	lutabulartools.doc.r67714
	minim.doc.r70885
	minim-math.doc.r70885
	minim-mp.doc.r70885
	minim-pdf.doc.r70885
	minim-xmp.doc.r70885
	newpax.doc.r68762
	nodetree.doc.r72318
	odsfile.doc.r72514
	optex.doc.r71642
	pdfarticle.doc.r51127
	pdfextra.doc.r65184
	penlight.doc.r72301
	penlightplus.doc.r72426
	piton.doc.r72889
	placeat.doc.r45145
	plantuml.doc.r72315
	pyluatex.doc.r69372
	scikgtex.doc.r66764
	selnolig.doc.r68747
	semesterplannerlua.doc.r71322
	showhyphenation.doc.r67602
	showkerning.doc.r67603
	spacekern.doc.r67604
	spelling.doc.r30715
	stricttex.doc.r56320
	sympycalc.doc.r67087
	tango.doc.r71825
	texfindpkg.doc.r67027
	truthtable.doc.r68300
	tsvtemplate.doc.r65333
	typewriter.doc.r46641
	uninormalize.doc.r57257
	yamlvars.doc.r72052
"
TEXLIVE_MODULE_SRC_CONTENTS="
	chickenize.source.r57325
	cloze.source.r55763
	ctablestack.source.r38514
	ekdosis.source.r69568
	innerscript.source.r72066
	lt3luabridge.source.r71704
	lua-typo.source.r70978
	lua-uca.source.r71218
	lua-ul.source.r70203
	lua-widow-control.source.r70601
	luaaddplot.source.r72350
	luacode.source.r25193
	luacolor.source.r67987
	luaindex.source.r25882
	luainputenc.source.r20491
	lualatex-math.source.r61464
	lualatex-truncate.source.r67201
	lualibs.source.r67994
	luamathalign.source.r63226
	luamml.source.r72714
	luamplib.source.r72835
	luaotfload.source.r70232
	luatex85.source.r41456
	luatexbase.source.r52663
	luatextra.source.r20747
	newpax.source.r68762
	nodetree.source.r72318
	piton.source.r72889
	placeat.source.r45145
	semesterplannerlua.source.r71322
	texfindpkg.source.r67027
"

inherit prefix texlive-module

DESCRIPTION="TeXLive LuaTeX packages"

LICENSE="BSD CC-BY-SA-3.0 CC-BY-SA-4.0 EUPL-1.2 FDL-1.1+ GPL-2 GPL-3 GPL-3+ LPPL-1.3 LPPL-1.3c MIT OFL-1.1 TeX-other-free public-domain"
SLOT="0"
KEYWORDS="amd64 ~x86"
COMMON_DEPEND="
	>=dev-texlive/texlive-basic-2024
"
RDEPEND="
	${COMMON_DEPEND}
"
DEPEND="
	${COMMON_DEPEND}
	>=app-text/texlive-core-2024
"

TEXLIVE_MODULE_BINSCRIPTS="
	texmf-dist/scripts/checkcites/checkcites.lua
	texmf-dist/scripts/luaotfload/luaotfload-tool.lua
	texmf-dist/scripts/texfindpkg/texfindpkg.lua
"

src_prepare() {
	default
	# https://bugs.gentoo.org/865203
	hprefixify texmf-dist/tex/luatex/luaotfload/luaotfload-database.lua
}
