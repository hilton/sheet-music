% Copyright ©2013 Peter Hilton - https://github.com/hilton

\version "2.16.2"
\pointAndClickOff
revision = "2"

#(set-global-staff-size 15)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	inner-margin = 15\mm
	outer-margin = 15\mm
	markup-system-spacing = #'( (padding . 4) )
	indent = 0
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #6 \override #'(font-name . "Source Sans Pro Light") {
		"Missa defunctorum"
	}
	composer = \markup \sans { Clemens non Papa }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				This edition copyright \year Peter Hilton - 
				Lilypond source at \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - 
				revision \revision 
			}
		}
	}
	tagline = ##f
}

\layout {
  	ragged-right = ##f
  	ragged-last = ##f
	\context {
		\Score
		\override BarNumber #'self-alignment-X = #CENTER
		\override BarNumber #'break-visibility = #'#(#f #t #t)
		\override BarLine #'transparent = ##t
		\remove "Metronome_mark_engraver"
		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 10) (stretchability . 100))
	}
	\context { 
		\StaffGroup
		\remove "Span_bar_engraver"	
	}
	\context { 
		\Voice 
		\override NoteHead #'style = #'baroque
		\consists "Horizontal_bracket_engraver"
	}
}


global = { 
	\key f \major
	\tempo 2 = 44
	\set Score.barNumberVisibility = #all-bar-numbers-visible
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t }


% INTROITUS

soprano = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature #'stencil = ##f
		\cadenzaOn s1 s4 \cadenzaOff \showBarLine \bar "|" \time 2/2
		f2. g4 a bes c4. bes8 a4 c bes a2
		g8 f e4 d g2 f4. e8 \break d4 c d e f a4. g8 f4 e8 d f2 e4 f2 r4 f2
		f4 e2 e4 f8 g a bes a4 ~ \break a g4 f g4. f8 f2 e8 d e2 f4 c'4. bes8 a2 g8 f
		
		e4 c'4. bes8 a4 g f2 e4 \break f a a c bes a a g8 f g2. f4 a g f2.
		g4. f8 f2 e4 f2 \fermata \showBarLine \bar "||"
	}
	\addlyrics {
		Ae -- _ _ _ _ _ _ _ ter -- _
		_ _ _ _ _ nam, __ _ _ _ _ _ _ ae -- _ _ _ _ _ ter -- nam do --
		na e -- is Do -- _ _ _ _ _ _ _ _ _ _ _ mi -- ne, et __ _ lux __ _ _
		
		_ per -- _ _ pe -- _ tu -- a lu -- ce -- at e -- _ is, __ _ _ _ lu -- ce -- at e --
		_ _ _ _ is.
	}
}

alto = {
	\new Voice = "altus" {
		\relative c {
			\once \override Staff.TimeSignature #'stencil = ##f
			s1 s4 r2 f2. g4 a bes c c d4. c16 bes
			a4 bes c d2 c4 d2 r4 f2 e4 d c2 bes4 c d c2 c1
			r4 c2 c4 c2 f,4 f' ~ f e d c4. a8 d4 c1 r4 f f2 c2.
			
			e4 f c \[ d2 c \] a \[ c d \] c4 d e2. c4 f e d1
			c4 bes c2 a \fermata
		}
	}
	\addlyrics {
		Ae -- _ _ _ _ ter -- nam, __  _ _
		_ ae -- ter -- _ _ nam, ae -- _ ter -- _ _ _ _ _ nam
		do -- na e -- is Do -- _ _ _ _ mi -- ne, et lux __ _ 
		
		per -- pe -- _ tu -- _ a lu -- _ ce -- at e -- _ _ _ _ _ _ _ is.
	}
}

tenor = {
	\new Voice = "tenor" {
		\relative c {
			\clef "treble_8"
			\once \override Staff.TimeSignature #'stencil = ##f
			\override Stem #'transparent = ##t f4 g f f2 \override Stem #'transparent = ##f 
			R1 r2 \[ f\breve g1 a2 ~ a \] a1 \[ f2 g \] \[ g f \] a
			\[ a g \] a a \[ c4. bes8 \] a4 g a bes g1 f2 a \[ a
			 
			 g \] a bes g f1 r2 \[ a c \] c \[ c a \]
			 bes a4 g8 f g2 f \fermata
		}
	}
	\addlyrics {
		Re -- _ qui -- em Ae -- _ _  ter -- _ _ nam __ _ do --
		na __ _ e -- is __ _ _ _ _ Do -- _ mi -- ne, et lux __
		
		_ per -- pe -- tu -- a lu -- _ ce -- at __ _
		e -- _ _ _ _ is.
	}
}

bass = {
	\new Voice = "bassus" {
		\relative c {
			\clef "bass"
			\once \override Staff.TimeSignature #'stencil = ##f
			s1 s4 R1 f2. g4 a2 d,1
			c4 bes \ficta es2 d f4. e8 d4 c d1 c4 bes c2 f,4 f'2 f4
			f2 c r4 f2 f4 f c d e f bes, c1 f,2 r4 f' \[ f2
			
			c \] f bes, c d4 f f a g f2 e8 d c4. d8 e4 f4. e8 c4 \[ d2 
			bes \] c4 d c2 f, \fermata
		}
	}
	\addlyrics {
		Ae -- _ ter -- nam
		do -- na e -- is, do -- _ _ _ na e -- _ _ is, do -- na
		e -- is, do -- na e -- _ _ is Do -- _ mi -- ne, et lux __
		
		_ per -- pe -- tu -- a lu -- ce -- at e -- _ _ _ _ _ _ _ _ _ _ 
		_ _ _ _ is.
	}
}


\score {
	<<
		\new StaffGroup
	  	<< 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\new Staff << \global \soprano >> 
			\new Staff << \global \alto >>
			\new Staff << \global \tenor >>
			\new Staff << \global \bass >>
		>> 
	>>
	\header {
		piece = \markup \sans { Introitus }
	}
	\layout { }
%	\midi { }
}



sopranoB = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature #'stencil = ##f
		\cadenzaOn s1 s s s2 \cadenzaOff 
		\set Score.currentBarNumber = #25
		\showBarLine \bar "|" \time 2/2
		f1 \[ g2 a \] a4 a a a a2. a4 \break
		bes2. bes4 a g a2 r4 f g a a2 a4 bes bes a g f g2 f \break
		r4 a a a a2. f4 \[ g2 a \] g2. f4 f\breve \showBarLine \bar ":|"
	}
	\addlyrics {
		Et ti -- _ bi red -- de -- tur vo -- tum
		in Je -- ru -- sa -- lem, ex -- au -- di De -- us o -- ra -- ti  -- o -- nem me -- am,
		ad te om -- nis ca -- ro __ _ ve -- ni -- et.
	}
}

altoB = {
	\new Voice = "altus" {
		\relative c' {
			\once \override Staff.TimeSignature #'stencil = ##f
			s1 s s s2 c1 \[ e2 f \] f4 f f f f2. f4
			f2. f4 f d f2 r4 c e f f2 f4 f f4. e8 d4 d bes c d2
			r4 c f f f4. e16 d c4 d \[ e2 f2. \] e8 d e4 d d2. d4 c1
		}
	}
	\addlyrics {
		Et ti -- _ bi red -- de -- tur vo -- tum
		in Je -- ru -- sa -- lem, ex -- au -- di De -- us o -- ra -- ti  -- o -- nem me -- _ am,
		ad te om -- nis __ _ _ _ _ ca -- _ _ _ _ ro ve -- ni -- et.
	}
}

tenorB = {
	\new Voice = "tenor" {
		\relative c {
			\clef "treble_8"
			\once \override Staff.TimeSignature #'stencil = ##f
			\override Stem #'transparent = ##t f4 g a a a a a a a g g2 a \override Stem #'transparent = ##f
			a1 c c4 c c c d2. d4
			d2. d4 c bes c2 r4 a c c c2 c4 d d c bes a g2 a
			r4 a c c c2 a c1 c2. a4 bes4. a8 f4 g a1
		}
	}
	\addlyrics {
		Te de -- _ cet hym -- nus De -- us in Si -- on __ _
		Et ti -- bi red -- de -- tur vo -- tum
		in Je -- ru -- sa -- lem, ex -- au -- di De -- us o -- ra -- ti  -- o -- nem me -- am,
		ad te om -- nis ca -- ro ve -- _ _ _ _ ni -- et.
	}
}

bassB = {
	\new Voice = "bassus" {
		\relative c {
			\clef "bass"
			\once \override Staff.TimeSignature #'stencil = ##f
			s1 s s s2 f1 \[ c2 f \] f4 f f f d2. d4
			bes2. bes4 f' g f2 r4 f4 c f f2 f4 bes, bes f' g d \ficta es2 d
			r4 f f f f2. d4 \[ c2 f \] c2. d4 \[ bes1 f \]
		}
	}
	\addlyrics {
		Et ti -- _ bi red -- de -- tur vo -- tum
		in Je -- ru -- sa -- lem, ex -- au -- di De -- us o -- ra -- ti  -- o -- nem me -- am,
		ad te om -- nis ca -- ro __ _ ve -- ni -- et. __ _
	}
}


\score {
	<<
		\new StaffGroup
	  	<< 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\new Staff << \global \sopranoB >> 
			\new Staff << \global \altoB >>
			\new Staff << \global \tenorB >>
			\new Staff << \global \bassB >>
		>> 
	>>
	\layout { }
%	\midi { }
}

\markup { Repeat \italic { Requiem aeternam dona eis Domine, et lux perpetua luceat eis. }}

\pageBreak


% KYRIE 1

\score {
	\new Staff <<
		\key f \major
		\new Voice = "tenor" {
			\relative c {
				\clef "treble_8"
				\cadenzaOn
				\override Stem #'transparent = ##t f4 g a bes a a2 g s_"*" a4 g f e f g f f2 \showBarLine\bar ":|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		}
	>>
	\header {
		piece = \markup \sans { Kyrie }
	}
	\layout {
		ragged-right = ##t
	}
}

sopranoC = \new Voice {
	\relative c' {
		f1 \[ g2 a \] \[ a g \] \[ a bes \] a2. bes4 a g f a
		g f2 e8 d e4 e f2 \fermata \showBarLine \bar "|"
	}
	\addlyrics {
		Ky -- ri -- _ e __ _ _ _ _ e -- _ _ _ _ _ _ _ _ _ lei -- son.
	}
}

altoC = {
	\new Voice = "altus" {
		\relative c' {
			c1 \[ e2 f \] \[ f e \] f d4 e f2. d4 f e c2
			d c1 c2 \fermata
		}
	}
	\addlyrics {
		Ky -- ri -- _ e __ _ e -- _ _ lei -- _ _ _ _ _ _ son.
	}
}

tenorC = {
	\new Voice = "tenor" {
		\relative c {
			\clef "treble_8"
			f4. g8 a4 f c'1 c2. c4 c d bes2 c4 d c bes8 c d4 g, a2
			bes g1 f2 \fermata
		}
	}
	\addlyrics {
		Ky -- _ _ ri -- e, Ky -- ri -- e e -- lei -- _ _ _ _ _ _ _ _ _ _ son.
	}
}

bassC = {
	\new Voice = "bassus" {
		\relative c {
			\clef "bass"
			f1 \[ c2 f \] \[ f c \] \[ f g \] f4 d f g d e \[ f2
			bes, c1 \] f,2 \fermata
		}
	}
	\addlyrics {
		Ky -- ri -- _ e __ _ e -- _ _ _ _ _ _ _ lei -- _ _ son.
	}
}


\score {
	<<
		\new StaffGroup
	  	<< 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\new Staff << \global \sopranoC >> 
			\new Staff << \global \altoC >>
			\new Staff << \global \tenorC >>
			\new Staff << \global \bassC >>
		>> 
	>>
	\layout { }
%	\midi { }
}


% CHRISTE

\score {
	\new Staff <<
		\key f \major
		\new Voice = "tenor" {
			\relative c {
				\clef "treble_8"
				\cadenzaOn
				\override Stem #'transparent = ##t f4 g a bes a a2 g s2_\markup "*" a4 g f e f g f f2 \showBarLine\bar ":|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Chri -- _ _ _ _ -- ste __ _ e -- _ _ _ _ le -- i -- son,
		}
	>>
	\layout {
		ragged-right = ##t
	}
}


sopranoD = \new Voice {
	\relative c' {
		\set Score.currentBarNumber = #9
		bes'1 \[ a2 g \] \[ a bes \] bes1 a2 g4 f
		g2 f bes2. a4 g2 f1. \fermata
	}
	\addlyrics {
		Chri -- ste __ _ _ _ e -- _ _ _ _ _ _ _ lei -- son.
	}
}

altoD = {
	\new Voice = "altus" {
		\relative c' {
			f1 \[ f2 d \] f1 g4 f2 e4 f2 e4 d2 
			c4 d2 f1 d4 e \[ d2 c \] d2 \fermata
		}
	}
	\addlyrics {
		Chri -- ste __ _ e -- lei -- _ _ son, Chri -- _ _ ste e -- lei -- _ _ _ son.
	}
}

tenorD = {
	\new Voice = "tenor" {
		\relative c {
			\clef "treble_8"
			d'1 \[ c2 bes \] \[ c d \] g,4 c2 bes4 c2. f,4
			bes g a2 d2. c4 bes c4. bes8 bes2 a4 bes \fermata
		}
	}
	\addlyrics {
		Chri -- ste __ _ _ _ e -- lei -- _ son, Chri -- ste __ _ _ e -- _ lei -- _ _ _ _ son.
	}
}

bassD = {
	\new Voice = "bassus" {
		\relative c {
			\clef "bass"
			bes1 \[ f'2 g \] f bes,4 bes'2 a4 g2 f4. e8 c4 d
			\ficta es2 d \[ bes f' \] g4 c, d4. e8 f2 bes, \fermata
		}
	}
	\addlyrics {
		Chri -- ste __ _ _ _ e -- _ _ lei -- _ _ _ son, __ _ Chri -- _ ste e -- lei -- _ _ son.
	}
}


\score {
	<<
		\new StaffGroup
	  	<< 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\new Staff << \global \sopranoD >>
			\new Staff << \global \altoD >>
			\new Staff << \global \tenorD >>
			\new Staff << \global \bassD >>
		>> 
	>>
	\layout { }
%	\midi { }
}


% KYRIE 2

\score {
	\new Staff <<
		\key f \major
		\new Voice = "tenor" {
			\relative c {
				\clef "treble_8"
				\cadenzaOn
				\override Stem #'transparent = ##t f4 g a bes a a2 g s_"*" a4 g f e f g f f2 \showBarLine\bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		}
	>>
	\layout {
		ragged-right = ##t
	}
}


sopranoE = \new Voice {
	\relative c' {
		\set Score.currentBarNumber = #18
		f1 g2 a a g bes1. a1 g f2 f2. a4 g f2 e4
		f1 bes a g f2. a4 g f4. e16 d e4 f1 \showBarLine \bar "||"
	}
	\addlyrics {
		Ky -- ri -- _ e, __ _ Ky -- _ ri -- e e -- _ _ _ lei -- 
		son, Ky -- _ ri -- e e -- lei -- _ _ _ _ son.
	}
}

altoE = {
	\new Voice = "altus" {
		\relative c' {
			d1 bes2 f' f e f2. f4 g2 e f \[ d es \] c4 c d2. c4 \[ d2 c \]
			d d4. e8 f g f2 e4 f2 e4 f e d2 c4 d2 c \[ d c \] c1
		}
	}
	\addlyrics {
		Ky -- ri -- _ e __ _
		_ e -- lei -- _ son, e -- _ _ lei -- son, Ky -- ri -- _ e e -- _ _ _ _ lei -- son e -- _ _ _ _ _ _ lei -- _ son.
	}
}

tenorE = {
	\new Voice = "tenor" {
		\relative c {
			\clef "treble_8"
			bes'1 g2 d' c1 d2. d4 \ficta es d2 c4 d2. bes4 c bes2 a4 bes2 r4 a bes2 g
			bes bes4. c8 d2. bes4 c2. d4 bes2. g4 a bes2 a4 \[ bes2 g \] f1
		}
	}
	\addlyrics {
		Ky -- ri -- _ _ 
		e e -- lei -- _ _ son, e -- lei -- _ _ son, Ky -- _ ri -- 
		e e -- _ lei -- _ son, e -- lei -- _ _ _ _ _ _ son.
	}
}

bassE = {
	\new Voice = "bassus" {
		\relative c {
			\clef "bass"
			bes1 es2 d4. \ficta es8 f2 c bes bes' g4 g a2 d, g es4 \ficta es f2 bes, f' bes,4 bes c2
			bes2 bes4 bes'4. a8 g f g2 f4. g8 a4 f \[ g2 es \] d4. \ficta e!8 f2 \[ bes, c \] f,1
		}
	}
	\addlyrics {
		Ky -- ri -- _ _ _ _ 
		e, Ky -- rie e -- lei -- son, Ky -- rie e -- lei -- son, Ky -- rie e -- lei -- 
		son, Ky -- _ _ _ _ _ ri -- _ _ e e -- _ lei -- _ _ _ _ son.
	}
}


\score {
	<<
		\new StaffGroup
	  	<< 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\new Staff << \global \sopranoE >>
			\new Staff << \global \altoE >>
			\new Staff << \global \tenorE >>
			\new Staff << \global \bassE >>
		>> 
	>>
	\layout { }
%	\midi { }
}


\pageBreak


% SANCTUS 

global = { 
	\key c \major
	\tempo 2 = 44
	\set Score.barNumberVisibility = #all-bar-numbers-visible
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

soprano = \new Voice {
	\relative c'' {
		\cadenzaOn s2 \cadenzaOff \showBarLine \bar "|" \time 2/2
		\[ a2 c2. \] b8 a b4 a2 g4 a1 r4 a2 a4 f f \break
		bes2 a2. a4 a2 a a r4 a a d2 c8 b c2 \showBarLine \bar "||" \break
		f,1 \[ g2 a \] a2. a4 a a g2 e f2. f4 a2 g a1 \fermata \showBarLine \bar "||" \break
		a1 bes2 g f2. f4 e1 e2 \showBarLine \bar "||"
	}
	\addlyrics {
		San -- _ _ _ _ _ _ ctus San -- ctus Do -- mi -- 
		nus De -- us Sa -- ba -- oth Sa -- ba -- oth __ _ _ _
		Ple -- ni __ _ sunt coe -- li et ter -- ra glo -- ri -- a tu -- a
		O -- san -- na in ex -- cel -- sis
	}
}

alto = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature #'stencil = ##f
		s2 r2 e1 \[ f2 e \] c4 e2 e4 e e f2 r4 f4 ~ 
		f e f2 e d4 f2 f4 e e f f2 e8 d e4 f e2
		d1 \[ d2 f \] f2. f4 f f e2 c d2. d4 e2 e f1 \fermata
		f1 f2 e d2. d4 b1 c2
	}
	\addlyrics {
		San -- ctus __ _ _  Do -- mi -- nus De -- us Do -- 
		mi -- nus De -- _ us Sa -- _ ba -- oth Sa -- _ _ _ ba -- oth __
		Ple -- ni __ _ sunt coe -- li et ter -- ra glo -- ri -- a tu -- a
		O -- san -- na in ex -- cel -- sis
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		\once \override Staff.TimeSignature #'stencil = ##f
		\override Stem #'transparent = ##t a4 a \override Stem #'transparent = ##f
		a1 \[ c2 d \] b a c2. c4 c c d2 ~
		d4 \ficta bes c d2 c4 d2 r4 d2 c4 d4. c8 a1.
		a1 \[ b2 c \] c2. c4 d d b2 a a2. a4 c2 b d1 \fermata
		c1 d2 c a2. f4 g a2 g4 a2 
	}
	\addlyrics {
		San -- ctus
		San -- _ _ ctus __ _ Do -- mi -- nus De -- us 
		Sa -- _ _ ba -- oth Sa -- ba -- oth __ _ _
		Ple -- ni __ _ sunt coe -- li et ter -- ra glo -- ri -- a tu -- a
		O -- san -- na in ex -- cel -- _ _ sis
	}
}

bass = \new Voice {
	\relative c' {
		\clef "bass"
		\once \override Staff.TimeSignature #'stencil = ##f
		s2 r2 a1 \[ d,2 e \] a, a'2. a4 f f \ficta bes2
		g2 f4. g8 a4 a d,4. e8 f4 d a'2 d,1 a 
		d \[ g2 f \] f2. f4 d d e2 a, d2. d4 a2 e' d1 \fermata 
		f1 bes,2 c d2. d4 e1 a,2
	}
	\addlyrics {
		San -- ctus __ _ _ Do -- mi -- nus De -- us 
		Do -- mi -- _ _ nus De -- _ _ us  Sa -- ba -- oth
		Ple -- ni __ _ sunt coe -- li et ter -- ra glo -- ri -- a tu -- a
		O -- san -- na in ex -- cel -- sis
	}
}

\score {
	\new StaffGroup << 
		\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
		\new Staff << \global \soprano >> 
		\new Staff << \global \alto >> 
		\new Staff << \global \tenor >> 
		\new Staff << \global \bass >> 
	>> 
	\header {
		piece = \markup \sans { Sanctus }
	}
	\layout { }
%	\midi { }
}


% BENEDICTUS

soprano = \new Voice {
	\relative c'' {
		\once \override Staff.TimeSignature #'stencil = ##f
		\skip 4*7 \showBarLine \bar "|" \time 2/2
		a2 a4 a a1 a2. g4 f1 \fermata \break g g2. g4
		f2 f e1 e\breve \showBarLine \bar "||"
	}
	\addlyrics {
		In no -- mi -- ne Do -- mi -- ni, O -- san -- na
		in ex -- cel -- sis. __
	}
}

alto = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature #'stencil = ##f
		\skip 4*7 
		d2 f4 f e1 f2. d4 d1\fermata e2. d8 c d2 e
		c d b1 c\breve 
	}
	\addlyrics {
		In no -- mi -- ne Do -- mi -- ni, O -- _ _ san -- na
		in ex -- cel -- sis. __
	}
}

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		\once \override Staff.TimeSignature #'stencil = ##f
		\cadenzaOn
		\override Stem #'transparent = ##t f4 g a a a a a  \override Stem #'transparent = ##f 
		\cadenzaOff
		a2 d4 d d c8 b c2 c2. b4 a1 \fermata c2. b8 a b2 c2 ~
		c4 a bes a a g8 f g2 a\breve 
	}
	\addlyrics {
		Be -- ne -- di -- ctus qui ve -- nit
		In no -- mi -- ne __ _ _ _ Do -- mi -- ni, O -- _ _ san -- na
		in __ _ ex -- cel -- _ _ _ sis. __
	}
}

bass = \new Voice {
	\relative c {
		\clef "bass"
		\once \override Staff.TimeSignature #'stencil = ##f
		\skip 4*7 
		d2 d4 d a'1 f2. g4 d1 \fermata c2 g'1 c,2
		f d e1 a,\breve 
	}
	\addlyrics {
		In no -- mi -- ne Do -- mi -- ni, O -- san -- na
		in ex -- cel -- sis. __
	}
}

\score {
	\new StaffGroup << 
		\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
		\new Staff << \global \soprano >> 
		\new Staff << \global \alto >> 
		\new Staff << \global \tenor >> 
		\new Staff << \global \bass >> 
	>> 
	\header {
		piece = \markup \sans { Benedictus }
	}
	\layout { }
%	\midi { }
}


% AGNUS DEI

soprano = \new Voice {
	\relative c'' {
		\once \override Staff.TimeSignature #'stencil = ##f
		\skip 1 \showBarLine \bar "|" \time 2/2
		g2 g4 g a1 g4 f g2 g1\fermata g a2 a2. a4 g2. g4 g2 \showBarLine \bar "||" \break
		\skip 1 \showBarLine \bar "|" \time 2/2
		a2 a4 a g1 g4 e f2 g1\fermata g a2 a2. a4 a1 g a2 \showBarLine \bar "||" \break
		\skip 1 \showBarLine \bar "|" \time 2/2
		a2 a4 a a1 g4 f a2 a1\fermata g a b g2 g2. g4 a2 a2. a4 g1 g \showBarLine \bar "||"
	}
	\addlyrics {
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em.
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em.
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em sem -- pi -- ter -- nam.
	}
}

alto = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature #'stencil = ##f
		s1 e2 e4 e f1 d4 d e2 e1\fermata d f2 f2. f4 d2. e4 e2
		s1 f2 f4 f e1 e4 c d2 e1\fermata e e2 f2. e8 d \[ e2 f \] d2. d4 f2
		s1 e2 e4 e f1 d4 d f2 e1\fermata e e g e2 e2. e4 f2 f2. f4 d1 e
	}
	\addlyrics {
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em.
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e __ _ _ is __ _ re -- qui -- em.
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em sem -- pi -- ter -- nam.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		\once \override Staff.TimeSignature #'stencil = ##f
		\override Stem #'transparent = ##t a4 a a a\fermata \override Stem #'transparent = ##f
		c2 c4 c c1 b4 a c2 c1\fermata b c2 d2. c4 c b8 a b4 c4 c2
		\override Stem #'transparent = ##t a4 a a a\fermata \override Stem #'transparent = ##f
		c2 c4 c c1 b4 a a2 c1\fermata b c2 d2. c4 c2. b8 a b4 c2 b4 c2
		\override Stem #'transparent = ##t a4 a a a\fermata \override Stem #'transparent = ##f
		c2 c4 c c1 b4 a d2 c1\fermata b c d c2 c2. c4 c2 c2. c4 c b8 a b2 b1 
	}
	\addlyrics {
		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re __ _ _ _ qui -- em.
		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is  re __ _ _ _ _ qui -- em.
		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em sem -- pi -- ter __ _ _ _ nam.
	}
}

bass = \new Voice {
	\relative c {
		\clef "bass"
		\once \override Staff.TimeSignature #'stencil = ##f
		s1 c2 c4 c f1 g4 d c2 c1\fermata g' f2 d2. f4 g2. c,4 c2
		s1 f2 f4 f c1 e4 a, d2 c1\fermata e a,2 d2. a4 \[ a'2 f g2. \] g4 f2
		s1 a2 a4 a f1 g4 d d2 a1\fermata e' a g c,2 c2. c4 f2 f2. f4 g1 e
	}
	\addlyrics {
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em.
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re __ _ _ qui -- em.
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em sem -- pi -- ter -- nam.
	}
}

\score {
	\new StaffGroup << 
		\set Score.proportionalNotationDuration = #(ly:make-moment 1 2)
		\new Staff << \global \soprano >> 
		\new Staff << \global \alto >> 
		\new Staff << \global \tenor >> 
		\new Staff << \global \bass >> 
	>> 
	\header {
		piece = \markup \sans { Agnus Dei }
	}
	\layout { }
%	\midi { }
}


% COMMUNIO

soprano = \new Voice {
	\relative c'' {
		\once \override Staff.TimeSignature #'stencil = ##f
		\skip 4*7 \showBarLine \bar "|" \time 2/2
		a1 a4 g2 a4 f a4. g8 g2 f4 g1 e4 f ~ \break
		f e8 d c4 a' c2 b4 c a g4. f8 g4 a b2 a g4 a1 r4 a ~ \break
		a a4 g2 g1 r4 e f g a g2 f4 g2 r8 e f4 g a2 g4 ~ \break
		g \ficta f! g d e f g2 f8 e f g a4 g2 \ficta f!4 g2 ~ g\breve \showBarLine \bar "||"
		
		\once \override Staff.TimeSignature #'stencil = ##f
		\skip 4*13 \showBarLine \bar "|" \time 2/2
		c2 c4 c c2. c4 c2 c b4. a8 b4 c a g2 \ficta fis4 g1 \showBarLine \bar "||"
		
		r2 a c b4 c a g4. \ficta f!8 g4 a \ficta bes2 a g4 a1 r4 a ~
		a a g2 g1 r4 e f g a g2 f4 g2 r8 e f4 g a2 g4 ~
		g \ficta f! g d e f g2 f4 \ficta bes a g2 \ficta f!4 g2 ~ g\breve \showBarLine \bar "|."
	}
	\addlyrics {
		Lu -- ce -- at e -- is Do -- _ _ mi -- ne, Do -- _ 
		mi -- _ ne, cum san -- ctis tu -- is in __ _ _ ae -- ter -- _ _ num, in
		ae -- ter -- num, qui -- a pi -- _ _ us es, qui -- _ a pi -- _ 
		us es, qui -- a pi -- _ _ _ _ _ _ _ us es. __
		
		Et lux per -- pe -- tu -- a lu -- ce -- _ _ at e -- _ _ is.
		
		Cum san -- ctis tu -- is in __ _ _ ae -- ter -- _ _ num, in 
		ae -- ter -- num, qui -- a pi -- _ _ us es, qui -- a pi -- _ _ 
		us es, qui -- a pi -- _ _ _ _ _ us es.
	}
}

alto = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature #'stencil = ##f
		\skip 4*7 
		e1 e2 e d4 e2 c4 d d b4. c8 d4 e a,2
		r4 d f e2 f4 d e4. c8 d4 e2. f4. e8 c4 f e4. d8 c b a4 d f2
		e4 f d e2 e4 d2 e \times 2/3 { c4 d e} a, e'2 d8 c b4 b c d e e d2 ~
		d r4 b c d e2 d1. r4 b c d e2 d1
		
		\skip 4*13
		g2 g4 g f2. f4 g2 g2. g4 g2 f4 d d1.
		
		d2 f e4 f d e4. c8 d4 e2. f4. e8 c4 f e4. d8 c b a4 d f2
		e4 f d e2 e4 d2 e \times 2/3 { c4 d e } a, e'2 d8 c b4 b c d e2 d ~
		d r4 b c d e2 d1. r4 b4 c d e2 d1
	}
	\addlyrics {
		Lu -- ce -- at e -- _ _ is Do -- _ _ _ mi -- ne
		cum san -- ctis tu -- is in __ _ _ ae -- ter -- _ _ _ _ _ _ _ num,
		cum san -- ctis tu -- is in ae -- ter -- _ _ _ _ _ _ _ _ num,
		qui -- _ a pi -- us es, qui -- a pi -- us es, qui -- a pi -- us es.
		
		Et lux per -- pe -- tu -- a lu -- ce -- at e -- _ is.
		
		Cum san -- ctis tu -- is in __ _ _ ae -- ter -- _ _ _ _ _ _ _ num, cum 
		san -- ctis tu -- is in ae -- ter -- _ _ _ _ _ _ _ _ num, qui -- a pi -- us es, 
		qui -- a pi -- us es, qui -- a pi -- us es.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		\once \override Staff.TimeSignature #'stencil = ##f
		\cadenzaOn
		\override Stem #'transparent = ##t a4 g f g a a g \override Stem #'transparent = ##f 
		\cadenzaOff
		a1 c2 b4 c a c4. b8 g4 a2 g4. a8 b4 c4. b16 a a4 ~
		a g a2 r r4 a c b c2 a4 d4. c8 a4 b2 a r4 a d c ~
		c d b c g c2 b4 c4. b8 a4 g r b c4. d8 e4 d g,8 c4 b8 c4 e, f g
		a a g g2 a4 b c a r8 d, f4 g a a g2 ~ g\breve
		
		\once \override Staff.TimeSignature #'stencil = ##f
		\cadenzaOn
		\override Stem #'transparent = ##t g4 a c c c c c c c c d c c \override Stem #'transparent = ##f 
		\cadenzaOff
		e2 e4 e a,2. a4 e'2 e2. d8 c d4 c2 b4 a2 g1
		
		R1 r2 r4 a c b c2 a4 d4. c8 a4 b2 a r4 a d c ~
		c d b c g c2 b4 c4. b8 a4 g r b c4. d8 e4 d g,8 c4 b8 c4 e, f g
		a a g g2 a4 b c a d, f g a a g2 ~ g\breve
	}
	\addlyrics {
		Lux ae -- _ ter -- _ na __ _
		Lu -- ce -- at e -- is Do -- _ _ _ _ _ _ _ _ _ _ 
		mi -- ne cum san -- ctis tu -- is in __ _ ae -- ter -- num, cum san -- ctis 
		tu -- is in ae -- ter -- _ _ _ _ num, qui -- _ a pi -- _ _ _ us es, qui -- _ a 
		pi -- us es, qui -- a pi -- us es, qui -- _ a pi -- us es.

		Re -- qui -- em ae -- ter -- nam do -- na e -- is Do -- mi -- ne		
		Et lux per -- pe -- tu -- a lu -- _ _ _ ce -- at e -- is.
		
		Cum san -- ctis tu -- is in __ _ ae -- ter -- num, cum san -- ctis 
		tu -- is in ae -- ter -- _ _ _ _ num, qui -- _ a pi -- _ _ _ us es, qui -- a pi -- 
		_ us es, qui -- a pi -- us es, qui -- _ a pi -- us es.
	}
}

bass = \new Voice {
	\relative c {
		\clef "bass"
		\once \override Staff.TimeSignature #'stencil = ##f
		\skip 4*7
		a1 a8 b c d e4 c d a e'2 d e4 g4. f8 e d c4 d
		b2 a R1 R r4 d f2 d4 e c f2 d4. e8 f g
		a4 f g c, e4. f8 g2 c, r4 e f g a a g4. f8 e4 d c c d g,
		d'2 r4 g e d g c, d d2 g,4 d'2 r4 g, c b c c g1
		
		\skip 4*13
		c2 c4 c f2. f4 c2 \[ c g'2. \] e4 f g d2 g,1
		
		R1 R R r4 d' f2 d4 e c f2 d4. e8 f g
		a4 f g c, e4. f8 g2 c, r4 e f g a a g4. f8 e4 d c c d g,
		d'2 r4 g e d g c, d2. g,4 d'2 r4 g, c b c c g1
	}
	\addlyrics {
		Lu -- ce -- _ _ _ _ at e -- is Do -- mi -- ne, Do -- _ _ _ _ _ 
		mi -- ne, cum san -- ctis __ _ _ tu -- is __ _ _ _ 
		_ in ae -- _ ter -- _ _ num, qui -- _ a pi -- us es, __ _ _ qui -- _ a pi -- us 
		es, qui -- _ a pi -- _ _ us __ _ es, qui -- _ a pi -- us es.
		
		Et lux per -- pe -- tu -- a lu -- _ ce -- at __ _ e -- is.
		
		Cum san -- ctis __ _ _ tu -- is __ _ _ _ 
		_ in ae -- _ ter -- _ _ num qui -- _ a pi -- us es, __ _ _ qui -- _ a pi -- us 
		es, qui -- _ a pi -- _ _ us es, qui -- _ a pi -- us es.
	}
}

\score {
	\new StaffGroup << 
		\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
		\new Staff << \global \soprano >> 
		\new Staff << \global \alto >> 
		\new Staff << \global \tenor >> 
		\new Staff << \global \bass >> 
	>> 
	\header {
		piece = \markup \sans { Communio }
	}
	\layout { }
	\midi { }
}
