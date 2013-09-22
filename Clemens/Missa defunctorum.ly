% Copyright ©2013 Peter Hilton - https://github.com/hilton

\version "2.16.2"
revision = "1"

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
		\override TupletNumber #'stencil = ##f 
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


global= { 
	\key f \major
	\tempo 2 = 44
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t }


% INTROITUS

soprano = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature #'stencil = ##f
		\set Score.barNumberVisibility = #all-bar-numbers-visible
		\cadenzaOn s1 s4 \cadenzaOff \showBarLine \bar "|" \time 2/2
		f2. g4 a bes c4. bes8 a4 c bes a2
		g8 f e4 d g2 f4. e8 \break d4 c d e f a4. g8 f4 e8 d f2 e4 f2 r4 f2
		f4 e2 e4 f8 g a bes a4 ~ \break a g4 f g4. f8 f2 e8 d e2 f4 c'4. bes8 a2 g8 f
		
		e4 c'4. bes8 a4 g f2 e4 \break f a a c bes a a g8 f g2. f4 a g f2.
		g4. f8 f2 e4 f2 \fermata \showBarLine \bar "|."
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
		f1 bes a g f2. a4 g f4. e16 d e4 f1 \showBarLine \bar "|."
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