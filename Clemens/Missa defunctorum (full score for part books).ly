% http://www.cpdl.org/wiki/index.php/Missa_pro_defunctis_(Jacobus_Clemens_non_Papa)
% Copyright ©2024 Peter Hilton - https://github.com/hilton

\version "2.24.2"
revision = "19"
\pointAndClickOff

#(set-global-staff-size 15)

\paper {
%  	#(define fonts (set-global-fonts #:sans "Source Sans Pro"))
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	inner-margin = 15\mm
	outer-margin = 10\mm
	top-margin = 8\mm
	bottom-margin = 10\mm
	markup-system-spacing = #'( (padding . 4) )
	system-system-spacing = #'( (basic-distance . 15) (padding . 2) (stretchability . 100) )
	indent = 0
	ragged-bottom = ##f
	ragged-last-bottom = ##f
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #4 \override #'(font-name . "Source Sans Pro Light") {
		"Missa defunctorum"
	}
	composer = \markup \sans { Clemens non Papa }
	copyright = \markup \sans {
		\vspace #3
		\column \center-align {
			\line {
				Copyright \year Peter Hilton - 
				Lilypond source at \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - 
				revision \revision - This work is licensed under the
			}
			\line {
				Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License published at \with-url #"http://creativecommons.org/licenses/by-nc-sa/4.0/" "http://creativecommons.org/licenses/by-nc-sa/4.0/"
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
		\override SpanBar.transparent = ##t
		\override BarLine.transparent = ##t
% 		\remove "Bar_number_engraver"
		\override BarNumber.self-alignment-X = #CENTER
		\override BarNumber.break-visibility = #'#(#f #t #t)
		\remove "Metronome_mark_engraver"
		\override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/8)
		\override VerticalAxisGroup.staff-staff-spacing = #'((basic-distance . 10) (stretchability . 50))
	}
	\context { 
		\Voice 
		\override NoteHead.style = #'baroque
		\consists "Horizontal_bracket_engraver"
	}
}


global = { 
	\tempo 2 = 44
	\set Score.barNumberVisibility = #all-bar-numbers-visible
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
	\time 2/2
}

globalF = { 
	\key f \major
}


globalC = { 
	\key c \major
}

showBarLine = {
	\once \override Score.BarLine.transparent = ##f
	\once \override Score.SpanBar.transparent = ##f 
}
ficta = { \once \set suggestAccidentals = ##t }


% INTROITUS

soprano = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
% 		\cadenzaOn f4 g f f \fermata \cadenzaOff
		s1
		\override Stem.transparent = ##f
		\time 2/2
		\showBarLine\bar "|"
		
		f2. g4 a bes c4. bes8 a4 c bes a2
		g8 f e4 d g2 f4. e8  \break
		d4 c d e f a4. g8 f4 e8 d f2 e4 \mark \default f2 r4 f2
		f4 e2 e4 f8 g a bes a4 ~ a4 g4 f g4. f8 f2 e8 d e2 \mark \default f4 c'4. bes8 a2 g8 f
		
		e4 c'4. bes8 a4 g f2 e4 f a a c 		
		bes a a g8 f g2. f4 a g f2.
		g4. f8 f2 e4 \cadenzaOn f\breve \cadenzaOff s2 \showBarLine \bar "|"
		
		\cadenzaOn \skip 8*19 \cadenzaOff 
		\once \override Staff.TimeSignature.stencil = ##f
		\showBarLine \bar "|"
 		\time 2/2
		\once \override Staff.TimeSignature.stencil = ##f
		\set Score.currentBarNumber = #26
 
		f1 \[g2 a\] a4 a a a a2. a4
		bes2. bes4 a g a2 r4 f g a a2 a4 bes bes a g f g2 f
		r4 a a a a2. f4 \[g2 a\] g2. f4 f\breve \showBarLine \bar "||"
	}
	\addlyrics {
% 		Re -- _ qui -- em 
		Ae -- _ _ _ _ _ _ _ ter -- _
		_ _ _ _ nam, ae -- _ _ _ _ _ ter -- _ _ _ _ _ _ _ nam do --
		na e -- is Do -- _ _ _ _ _ _ _ _ _ _ _ mi -- ne, et __ _ lux __ _ _
		
		_ per -- _ _ pe -- _ tu -- a lu -- ce -- at e -- _ _ _ _ is, __ lu -- ce -- at e --
		_ _ _ _ is.
		
% 		Te de -- _ cet hym -- nus De -- us in Sy -- on, __ _

		Et ti -- _ bi red -- de -- tur vo -- tum
		in Je -- ru -- sa -- lem, ex -- au -- di De -- us o -- ra -- ti  -- o -- nem me -- am,
		ad te om -- nis ca -- ro __ _ ve -- ni -- et.

	}
}

alto = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
% 		\cadenzaOn f4 g f f \fermata \cadenzaOff
		s1
		\override Stem.transparent = ##f
		\time 2/2
		\showBarLine\bar "|"
		\set Score.currentBarNumber = #2
		
		r2 f,2. g4 a bes c c d4. c16 bes
		a4 bes c d2 c4 d2 r4 f2 e4 d c2 bes4 c d c2 \mark \default c1
		r4 c2 c4 c2 f,4 f'4 ~ f4 e4 d c4. a8 d4 c1 \mark \default r4 f \[f2 c2.\]
			
		e4 f c \[d2 c\] a \[c d\] c4 d e2. c4 f e d1
		c4 bes 
		c2 \cadenzaOn a\breve \cadenzaOff s2
		\showBarLine \bar "|"

		\cadenzaOn \skip 8*19 \cadenzaOff 
		\once \override Staff.TimeSignature.stencil = ##f
		\showBarLine\bar "|"

		c1 \[e2 f\] f4 f f f f2. f4
		f2. f4 f d f2 r4 c e f f2 f4 f f4. e8 d4 d bes c d2
		r4 c f f f4. e16 d c4 d \[e2 f2.\] e8 d e4 d d2. d4 c1
		\showBarLine \bar "||"
	}
	\addlyrics {
% 		Re -- _ qui -- em 
		Ae -- _ _ _ _ ter -- _  _ _ _ _ _ _ _ nam, ae -- _ ter -- _ _ _ _ _ nam
		do -- na e -- is Do -- _ _ _ _ mi -- ne, et lux __ _ 	
		per -- pe -- tu -- a __ _ _ lu -- _ _ _ _ ce -- at __ _ e -- _ _ _ is.

% 		Te de -- _ cet hym -- nus De -- us in Sy -- on, __ _
		
		Et ti -- _ bi red -- de -- tur vo -- tum
		in Je -- ru -- sa -- lem, ex -- au -- di De -- us o -- ra -- ti  -- o -- nem me -- _ am,
		ad te om -- nis __ _ _ _ ca -- ro __ _ _ _ _ _ ve -- ni -- et.
		
	}
}

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn f4 g f f \fermata \cadenzaOff
		\override Stem.transparent = ##f
		\time 2/2
		\showBarLine\bar "|"
		
		r1 r2 \[f\breve g1 a1\] a1 f2 g g \mark \default f a
		a g a a c4. bes8 a4 g a bes g1 \mark \default f2 a \[a
			 
		g\] a bes g f1 r2 \[a c\] c \[c a\]
		bes a4 g8 f g2 \cadenzaOn f\breve \cadenzaOff  s2
		\showBarLine\bar "|"
		
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t
		\cadenzaOn s8 f8 s g8 a a s a8 a s a8 a s a8 s g8 g a \fermata s \cadenzaOff
		\override Stem.transparent = ##f
		\once \override Staff.TimeSignature.stencil = ##f
		\showBarLine\bar "|"
		
		
		a1 c c4 c c c d2. d4
		d2. d4 c bes c2 r4 a c c c2 c4 d d c bes a g2 a
		r4 a c c c2 a c1 c2. a4 bes4. a8 f4 g a1
		\showBarLine\bar "||"
	}
	\addlyrics {
		Re -- _ qui -- em 
		Ae -- _ _  ter -- _ _ nam, __ _ do --
		na __ _ e -- is __ _ _ _ _ Do -- mi -- ne, __ _ 
		et lux __ _ per -- pe -- tu -- a lu -- _ ce -- at __ _ _
		e -- _ _ _ is.
		
		Te de -- _ cet hym -- nus De -- us in Sy -- on, __ _

		Et ti -- bi red -- de -- tur vo -- tum
		in Je -- ru -- sa -- lem, ex -- au -- di De -- us o -- ra -- ti  -- o -- nem me -- am,
		ad te om -- nis ca -- ro ve -- _ _ _ _ ni -- et.
	}
}

bass = \new Voice {
	\relative c {
		\clef "bass"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
% 		\cadenzaOn f4 g f f \fermata \cadenzaOff
		s1
		\override Stem.transparent = ##f
		\time 2/2
		\showBarLine\bar "|"
		
		r1 f2. g4 a2 d,1
		c4 bes \ficta es2 d f4. e8 d4 c d1 c4 bes c2 \mark \default f,4 f'2 f4
		f2 c r4 f2 f4 f c d e f bes, c1 \mark \default f,2 r4 f' \[f2
			
		c\] f bes, c d4 f f a g f2 e8 d c4. d8 e4 f4. e8 c4 \[d2 
		bes\] c4 d c2 \cadenzaOn f,\breve \cadenzaOff s2
		\showBarLine \bar "|"

		\cadenzaOn \skip 8*19 \cadenzaOff 
		\once \override Staff.TimeSignature.stencil = ##f
		\showBarLine\bar "|"

		f'1 \[c2 f\] f4 f f f d2. d4
		bes2. bes4 f' g f2 r4 f4 c f f2 f4 bes, bes f' g d \ficta es2 d
		r4 f f f f2. d4 \[c2 f\] c2. d4 \[bes1 f'\]
		\showBarLine \bar "||"
	}
	\addlyrics {
% 		Re -- _ qui -- em 
		Ae -- ter -- nam do -- na e -- is, ae -- ter -- _ _ _ _ _ _ _ nam do -- na e -- is,
		do -- na e -- is Do -- _ _ mi -- ne, __ _
		et lux __ _ per -- pe -- tu -- a lu -- ce -- at __ _ _ _ _ _ _ _ e -- _ _ _ _ _ _ _ is.

% 		Te de -- _ cet hym -- nus De -- us in Sy -- on, __ _
		
		Et ti -- _ bi red -- de -- tur vo -- tum
		in Je -- ru -- sa -- lem, ex -- au -- di De -- us o -- ra -- ti  -- o -- nem me -- am,
		ad te om -- nis ca -- ro __ _ ve -- ni -- et. __ _
	}
}

\score {
	\transpose f g {
		<<
		      \set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
		      \new Staff << \globalF \soprano >> 
				\new Staff << \globalF \alto >>
				\new Staff << \globalF \tenor >>
				\new Staff << \globalF \bass >>
		>>
	}
	\header {
		piece = \markup \larger \sans { Introitus }
	}
}



\markup {
	\column {
		\fill-line {
			\line { }
			\line { }
			\line \right-align { Repeat \italic " Requiem aeternam dona eis Domine, et lux perpetua luceat eis." }
		}
	}
}

% KYRIE 1

\score {
	\transpose f f {
	\new Staff <<
		\key f \major
		\new Voice = "tenor" {
			\relative c {
				\clef "treble_8"
				\cadenzaOn
				\override Stem.transparent = ##t f4 g a bes a a-- g-- s8 s2_"*" a4 g f e f g f f-- \showBarLine\bar ":|."
				\cadenzaOff
			}
		}
		\addlyrics {
			Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		}
	>>
	}
	\header {
		piece = \markup \larger \sans { Kyrie }
	}
	\layout {
		ragged-right = ##t
	}
}

soprano = \new Voice {
	\relative c' {
		\set Score.currentBarNumber = #2
		f1 \[g2 a\] \[a g\] \[a bes\] a2. bes4 a g f a
		g f2 e8 d e4 e \cadenzaOn f\breve \cadenzaOff \showBarLine \bar "|"
	}
	\addlyrics {
% 		Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		Ky -- ri -- _ e __ _ _ _ _ e -- le -- _ _ _ _ _ _ _ _ i -- son.
	}
}

alto = \new Voice {
	\relative c' {
		c1 \[e2 f\] \[f e\] f d4 e f2. d4 f e c2
		d c1 \cadenzaOn c\breve \cadenzaOff
		\showBarLine \bar "|"	
	}
	\addlyrics {
% 		Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		Ky -- ri -- _ e __ _ e -- _ _ lei -- _ _ _ _ _ _ son.
	}
}

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		f4. g8 a4 f c'1 c2. c4 c d bes2 c4 d c bes8 c d4 g, \[a2
		bes\] g1 \cadenzaOn f\breve \cadenzaOff
		\showBarLine\bar "|"
	}
	\addlyrics {
% 		Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		Ky -- _ _ ri -- e, [Ky -- ri -- e] e -- lei -- _ _ _ _ _ _ _ _ _ _ son.
	}
}

bass = \new Voice {
	\relative c {
		\clef "bass"
		f1 \[c2 f\] \[f c\] \[f g\] f4 d f g d e \[f2
		bes, c1\] \cadenzaOn f,\breve \cadenzaOff
		\showBarLine \bar "|"
	}
	\addlyrics {
% 		Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		Ky -- ri -- _ e __ _ e -- _ lei -- _ _ _ son e -- lei -- _ _ son.
	}
}

\score {
	\transpose f g {
	  	<< 
	      \set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
 			\new Staff << \globalF \soprano >> 
 			\new Staff << \globalF \alto >>
			\new Staff << \globalF \tenor >>
 			\new Staff << \globalF \bass >>
		>> 
	}
}

\pageBreak

% CHRISTE

\score {
	\transpose f f {
	\new Staff <<
		\key f \major
		\new Voice = "tenor" {
			\relative c {
				\clef "treble_8"
				\cadenzaOn
				\override Stem.transparent = ##t f4 g a bes a a-- g-- s8 s2_"*" a4 g f e f g f f-- \showBarLine \bar ":|."
				\cadenzaOff
			}
		}
		\addlyrics {
			Chri -- _ _ _ _ ste __ _ e -- _ _ _ _ le -- i -- son,
		}
	>>
	}
	\layout {
		ragged-right = ##t
	}
}

soprano = \new Voice {
	\relative c' {
		\set Score.currentBarNumber = #11
		bes'1 \[a2 g\] \[a bes\] bes1 a2 g4 f
		g2 f bes2. a4 g2 \cadenzaOn f\breve s1 \cadenzaOff
		\showBarLine\bar "|"
	}
	\addlyrics {
% 		Chri -- _ _ _ _ ste __ _ e -- _ _ _ _ le -- i -- son,
		Chri --  _ _ _ _ ste e -- _ _ lei -- son, e -- _ lei -- son.
	}
}

alto = \new Voice {
	\relative c' {	
		f1 \[f2 d\] f1 g4 f2 e4 f2 e4 d2 
		c4 d2 f1 d4 e \[d2 c\] \cadenzaOn d\breve \cadenzaOff
		\showBarLine \bar "|"
	}
	\addlyrics {
% 		Chri -- _ _ _ _ ste __ _ e -- _ _ _ _ le -- i -- son,
		Chri -- _ _ ste e -- lei -- _ son, e -- le -- i -- son, Chri -- ste e -- lei -- _ son.
	}
}

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		d'1 \[c2 bes\] \[c d\] g,4 c2 bes4 c2. f,4
		bes g a2 d2. c4 bes c4. bes8 bes2 a4 \cadenzaOn bes\breve \cadenzaOff
		\showBarLine\bar "|"
	}
	\addlyrics {
% 		Chri -- _ _ _ _ ste __ _ e -- _ _ _ _ le -- i -- son,
		Chri -- _ _ ste __ _ e -- lei -- _ son, e -- lei -- _ son, e -- _ lei -- _ _ _ _ son.
	}
}

bass = \new Voice {
	\relative c {
		\clef "bass"
		bes1 \[f'2 g\] f bes,4 bes'2 a4 g2 f4. e8 c4 d
		\ficta es2 d \[bes f'\] g4 c, d4. e8 f2 \cadenzaOn bes,\breve \cadenzaOff
		\showBarLine \bar "|"
	}
	\addlyrics {
% 		Chri -- _ _ _ _ ste __ _ e -- _ _ _ _ le -- i -- son,
		Chri -- _ _ ste __ _ e -- lei -- _ _ _ _ _ _ son, Chri -- _ ste e -- lei -- _ _ son.
	}
}

\score {
	\transpose f g {
	  	<< 
	      \set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
 			\new Staff << \globalF \soprano >> 
 			\new Staff << \globalF \alto >>
			\new Staff << \globalF \tenor >>
 			\new Staff << \globalF \bass >>
		>> 
	}
}


% KYRIE 2

\score {
	\transpose f f {
	\new Staff <<
		\key f \major
		\new Voice = "tenor" {
			\relative c {
				\clef "treble_8"
				\cadenzaOn
				\override Stem.transparent = ##t f4 g a bes a a-- g-- s8 s2_"*" a4 g f e f g f f-- \showBarLine\bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		}
	>>
	}
	\layout {
		ragged-right = ##t
	}
}

soprano = \new Voice {
	\relative c' {
		\set Score.currentBarNumber = #21
		f1 \[g2 a\] \[a g\] bes1. a1 g1 f2 \mark #3 f2. a4 g f2 e4
		f1 bes a g f2. a4 g f4. e16 d e4 f1 \showBarLine \bar "||"
	}
	\addlyrics {
% 		Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		Ky -- ri -- _ e, __ _ [Ky -- _ ri -- e] e -- _ le -- _ i -- son, 
		Ky -- _ ri -- e e -- le -- _ _ _ i -- son.
	}
}

alto = \new Voice {
	\relative c' {
		d1 \[bes2 f'\] \[f e\] f2. f4 g2 e f \[d es\] c4 c \mark #3 d2. c4 \[d2 c\]
		d d4. e8 f g f2 e4 f2 e4 f e d2 c4 d2 c \[d c\] c1
		\showBarLine \bar "||"
	}
	\addlyrics {
% 		Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		Ky -- ri -- _ e __ _ _ e -- lei -- _ _ _ _ son, 
		e -- lei -- _ _ _ son, e -- _ _ _ _ lei -- son e -- _ _ _ _ lei -- _ _ _ son.
	}
}

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		bes'1 \[g2 d'\] c1 d2. d4 \ficta es d2 c4 d2. bes4 c bes2 a4 \mark #3 bes2 r4 a bes2 g
		bes bes4. c8 d2. bes4 c2. d4 bes2. g4 a bes2 a4 \[bes2 g\] f1
		\showBarLine\bar "||"
	}
	\addlyrics {
% 		Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		Ky -- ri -- _ _ 	e [e -- lei -- _ _ son], e -- lei -- _ _ son, 
		e -- lei -- _ son [e -- _ lei -- _ son], e -- lei -- _ _ _ _ _ _ son.
	}
}

bass = \new Voice {
	\relative c {
		\clef "bass"
		bes1 es2 d4. \ficta es8 f2 c bes bes' g4 g a2 d, g es4 \ficta es f2 \mark #3 bes, f' bes,4 bes c2
		bes2 bes4 bes'4. a8 g f g2 f4. g8 a4 f \[g2 es\] d4. \ficta e!8 f2 \[bes, c\] f,1
		\showBarLine \bar "||"
	}
	\addlyrics {
% 		Ky -- _ _ _ ri -- e __ _ e -- _ _ _ _ le -- i -- son,
		Ky -- ri -- _ _ _ _ e, Ky -- rie e -- lei -- son, 
		Ky -- rie e -- lei -- son, Ky -- rie e -- lei -- 
		son, e -- _ _ _ _ _ lei -- _ _ son e -- _ lei -- _ _ _ _ son.
	}
}

\score {
	\transpose f g {
	  	<< 
	      \set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
 			\new Staff << \globalF \soprano >> 
 			\new Staff << \globalF \alto >>
			\new Staff << \globalF \tenor >>
 			\new Staff << \globalF \bass >>
		>> 
	}
}


% TRACTUS

soprano = \new Voice {
	\relative c'' {
		\once \override Staff.TimeSignature.stencil = ##f
		\cadenzaOn s8*10 \cadenzaOff
		\showBarLine \bar "|"
		\time 2/2
		
		r2 \[g2 c4.\] b8 a g a2 b4 c2 \[a d4.\] d8 |
		g,4 g2 g4 \break		
		g g4. g8 e2 g4 f2. f4 g2 | \mark #4 g e4 a4. g8 g4. f8 f4.

		e16 d e4 f2 |  \break
		\[f a\] c4. b8 a4 g \mark #5 a2. b4 | c g a8 b c a b4 a4. g8 g2
		fis4 \cadenzaOn g\breve \cadenzaOff \showBarLine \bar "|" 
		\mark #6 g2 \[g c2.\] b4 | a c4. b16 a b4 c2 r4 g a2. g4
		f2 e d f f4 a2 g4 | f2 \mark #7 e1. r2 e
		e4 g4 ~ \break 
		g4 a2 gis4 a4. a8 g4 g fis4. fis8 g4 g2 e4 | a2 d, \mark #8 r4 g4 f2

		e4 e g1 a2. c2 g2 b2 d4. d8 a2 c4. b8 a4. g8 g2 
		fis4 \cadenzaOn g\breve \cadenzaOff s2 \showBarLine \bar "||"

	}
	\addlyrics {
% 		Ab -- sol -- _ _ _ _ _ ve: __ _ 
		Do -- _ _ _ _ _ mi -- ne, Do -- _ mi -- 
		ne a -- ni -- mas om -- ni -- um fi -- de -- li -- um de -- fun -- cto -- _ _ _ _

		_ _ _ rum ab __ _ om -- _ _ ni vin -- cu -- lo de -- li -- _ _ _ _ cto -- _ _
		_ rum. Et gra -- _ ti -- a tu -- _ _ _ a, et gra -- ti -- 
		a tu -- a il -- lis suc -- cur -- ren -- te me -- 
		re -- an -- tur e -- va -- de -- re iu -- di -- ci -- um ul -- ci -- o -- nis, et lu -- 

		cis æ -- ter -- næ be -- a -- ti -- tu -- di -- ne per -- _ _ _ _
		fru -- i.
	}
}

alto = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		\cadenzaOn s8*10 \cadenzaOff
		\showBarLine \bar "|"
		
		r1 \[c2 f4.\] e8 d4 d e2 f f4 f4. 
		e16 d e4 e4. e8 e4 e2 g4. f8 e d c4 c d1 \mark #4 e4. f8 g4 f d2 d |

		\[g, a\] c c4. d8 e2 f4 d \mark #5 f1 g4 e f1 \cadenzaOn d1 ~ d\breve \cadenzaOff 
		\showBarLine \bar "|"
		\mark #6 r2 c \[c f2.\] e4 d2 e1 f4. e16 d c4 g |
		d'2 r4 g2 f8 e d4 d c4. c8 a b c2 b4 \mark #7 c2 | r4 c2 c4 e2 g4 g4.
		f8 e4 d4. d8 e4 e2 d c4 d d2 d4 c1 b2 \mark #8 r4 d \[d2 |

		g\] e4 e d2 f4 f c2 e g4. g8 d2 f4. f8 c2 f2. d4 |
		d2 r4 e2 e4 \cadenzaOn d1. \cadenzaOff
		\showBarLine \bar "||"
	}
	\addlyrics {
% 		Ab -- sol -- _ _ _ _ _ ve: __ _ 
		Do -- _ _ _ mi -- ne a -- ni -- mas __
		_ _ _ om -- ni -- um fi -- de -- _ _ _ _ li -- um de -- _ _ fun -- cto -- rum

		ab __ _ om -- ni __ _ _ vin -- cu -- lo de -- li -- cto -- rum. 
		Et gra -- _ ti -- a tu -- _ _ _ a il -- 
		lis suc -- _ _ _ cur -- ren -- _ _ _ _ _ te me -- re -- an -- tur e -- 
		_ _ va -- de -- re iu -- di -- ci -- um ul -- ci -- o -- nis, et lu -- 

		_ cis æ -- ter -- næ be -- a -- ti -- tu -- di -- ne per -- fru -- i, per -- fru -- 
		i, per -- fru -- i.
	}
}

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t \cadenzaOn
		g'8 g a b a g a a g s
		\cadenzaOff \override Stem.transparent = ##f
		\showBarLine \bar "|" \time 2/2
		
		\[g2 c4.\] b8 a4 a d2 r4 \[g,2 c4.\] b8 a g a4 b |
		c2 r4 c2 c4 c2 c4. c8 a2 a b4. b8 \mark #4 c2 c b a4. b8 |

		c2 f, r4 \[f2 a\] c b4 | \mark #5 \[c2 d4.\] d8 e4 c2 a4 d4. c8 b4 a8 g |
		a2 \cadenzaOn g\breve \cadenzaOff 
		\showBarLine \bar "|"
		\mark #6 r1 r r2 g \[g c2.\] b4 a c4.
		b16 a b4 c2 a4. g8 a4 bes a4. \ficta b!8 c4 g d'2 \mark #7 g,4 g2 g4 a2 c1 |
		b2 b4 a c b a fis g2 a g e4 g4. \ficta fis16 e \ficta fis!4 g2 \mark #8 r4 b a2 |

		c1 b2 d a c g b d4. d8 a2 c bes |
		a c c4 c2 b8 a \cadenzaOn b1 \cadenzaOff |
		\showBarLine\bar "||"
	}
	\addlyrics {
		Ab -- sol -- _ _ _ _ _ ve: __ _ 
		Do -- _ _ _ mi -- ne, Do -- _ _ _ _ _ mi -- 
		ne a -- ni -- mas om -- ni -- um fi -- de -- li -- um de -- fun -- cto -- _

		_ rum ab __ _ om -- ni vin -- _ cu -- lo de -- li -- cto -- _ _ _ _ 
		_ rum. Et gra -- _ ti -- a tu -- 
		_ _ _ a il -- _ _ lis suc -- _ _ cur -- ren -- te me -- re -- an -- tur 
		e -- va -- de -- re iu -- di -- ci -- um ul -- ci -- o -- _ _ _ _ nis, et lu -- 

		cis æ -- ter -- næ be -- a -- ti -- tu -- di -- ne per -- fru -- 
		i, per -- fru -- i. __ _ _ _
	}
}

bass = \new Voice {
	\relative c {
		\clef "bass"
		\once \override Staff.TimeSignature.stencil = ##f
		\cadenzaOn s8*10 \cadenzaOff
		\showBarLine \bar "|"
		
		r1 r r2 \[c f4.\] e8 d4 d |
		c1 r4 c2 c4 c2 f4. f8 d4 d g4. g8 \mark #4 c,4 c2 a4 b4. c8 d2 |

		c2 r4 \[f2 a2\] c4. b8 a g f4 g \mark #5 f4. e8 d4 d c2 f d d1
		\cadenzaOn g,\breve \cadenzaOff \showBarLine \bar "|"
		\mark #6 r1 r r c2 \[c f2.\] e4 |
		d2 c d4 d2 bes4 f'2. e4 d2 \mark #7 c1 r2 r4 c2 c4 |
		e2 g4 f e4. e8 cis4 d e4. e8 d2 b c a g \mark #8 r4 g' d2 |

		c2. c4 g'2 d f c e g4. g8 d2 f2. f4 d1
		c2. c4 \cadenzaOn g1. \cadenzaOff
		\showBarLine \bar "||"
	}
	\addlyrics {
% 		Ab -- sol -- _ _ _ _ _ ve: __ _ 
		Do -- _ _ _ mi -- 
		ne a -- ni -- mas om -- ni -- um fi -- de -- li -- um de -- fun -- cto -- _ _

		rum ab __ _ om -- _ _ _ _ ni vin -- _ _ cu -- lo de -- li -- cto --
		rum. Et gra -- _ ti -- 
		a tu -- a il -- lis suc -- cur -- ren -- te me -- re -- 
		an -- tur e -- va -- de -- re iu -- di -- ci -- um ul -- ci -- o -- nis, et lu -- 

		cis æ -- ter -- næ be -- a -- ti -- tu -- di -- ne per -- fru -- i, 
		per -- fru -- i.
	}
}

\score {
	\transpose f g {
	  	<< 
	      \set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\new Staff << \globalC \soprano >> 
			\new Staff << \globalC \alto >>
			\new Staff << \globalC \tenor >>
			\new Staff << \globalC \bass >>
		>> 
	}
	\header {
		piece = \markup \larger \sans { Tractus }
	}
}

% OFFERTORIUM

soprano = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		\cadenzaOn \skip 8*16 \cadenzaOff 
		\set Score.currentBarNumber = #2
		\showBarLine \bar "|" \time 2/2
		
		\[f2 g a1\] bes2. a4 g a4. g8 g4. \ficta fis16 e \ficta fis4 g2 |
		r2 g \[f g\] g a2. a4 a2 bes2. bes4 bes bes a g | a2 r4 g2

		f4 g2. f8 e f2 r g \break
		\[f g\] g g2. bes4 a2 f4 bes2 a4 |
		g1 a2 r4 g f g a a a2 a \break
		bes2. bes4 a2 g |
		a2 c2. bes4 a bes4. a8 a2 g4 a2 r4 f g2 bes2. bes4 bes2 |\break
		bes2 a4 g a2 g1. r2 g1 g2 f2. f4 f2 g |

		bes a2. a4 g f \break
		a2 f r4 g a2. a4 a2 bes2. a4 |
		g2 g f bes2. a4 g a4. g8 g4 f2 \break
		r4 f g a bes2 a4 g2
		\ficta f!8 e \ficta fis2 \cadenzaOn g\breve \cadenzaOff | \showBarLine \bar "|" 
		r2 g1 g2 \[f d\] f2. f4 f2 bes2.
		a4 g a4. g8 g2 \ficta fis8 e \ficta fis2 r a c2. bes4 a g f a4. g8 g2 \ficta fis4
		\cadenzaOn g\breve \cadenzaOff \showBarLine \bar "|" |
	}
	\addlyrics {
% 		Do -- mi -- _ ne Je -- su __ _ Chri -- _ _ _ ste __ _
		Rex __ _ _ glo -- _ _ _ _ _ _ _ ri -- æ,
		li -- be -- _ ra a -- ni -- mas om -- ni -- um fi -- de -- li -- um de -- 
		
		fun -- cto -- _ _ rum, de pœ -- _ nis in -- _ fer -- _ _ _
		_ ni et de pro -- fun -- do la -- cu, li -- be -- ra e -- 
		as de o -- re le -- _ o -- _ nis, ne ab -- sor -- be -- at
		e -- as tar -- ta -- rus, ne ca -- dant in ob -- scu -- 

		ra te -- ne -- bra -- rum lo -- ca,  sed sig -- ni -- fer san -- ctus
		Mi -- cha -- el re -- præ -- sen -- tet __ _ e -- as in lu -- cem san -- _ _
		_ _ _ ctam. Quam o -- lim __ _ A -- bra -- hæ pro -- 
		mi -- si -- _ _ _ _ _ sti et se -- mi -- ni e -- ius, e -- _ _ _ ius.
	}
}

alto = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		\cadenzaOn \skip 8*16 \cadenzaOff 
		\set Score.currentBarNumber = #2
		
		\[d1 f\breve\] d4 f \[es2 d\] d
		r d d1 e2 f2. f4 f2 | f2. f4 g g f d f2 r4 d2

		d4 bes c d1 r2 e \[d e\] e d d4 \[e2 f4.\] e8 d c bes4 c |
		e2 d4 e f2 r4 d d d f f | e2 f r4 f2 f4 f2 d |
		f g2. g4 e g f4. e8 d2 d r4 d e2 f2. f4 f2 |
		f2. d4 e f4. e4 d16 c d2 e r d1 e2 d2. d4 d2 e |

		f f2. f4 d d e2 d r4 d f2. f4 f2 f2. f4 |
		d2 e d f2. f4 d4 f d2 d r4 d d f \[f2 e\] |
		d1 \cadenzaOn d\breve \cadenzaOff \showBarLine \bar "|" d1 es d2 f2. d4 c2 ~ c2 f2. 
		f4 d f | \ficta es8 d4 c8 d1 r2 f2 g2. f4 f d4. c8 a4 bes c d2 \cadenzaOn d\breve \cadenzaOff 
		\showBarLine \bar "|"
	}
	\addlyrics {
% 		Do -- mi -- _ ne Je -- su __ _ Chri -- _ _ _ ste __ _
		Rex __ _ glo -- _ ri -- _ æ,
		li -- be -- ra a -- ni -- mas om -- ni -- um fi -- de -- li -- um de -- 
		
		fun -- cto -- _ rum, de pœ -- _ nis in -- fer -- _ _ _ _ _ _ _
		_ _ _ ni et de pro -- fun -- do la -- cu, li -- be -- ra e -- 
		as de o -- re le -- o -- _ _ nis, ne ab -- sor -- be -- at
		e -- as tar -- ta -- _ _ _ _ rus, ne ca -- dant in ob -- scu -- 

		ra te -- ne -- bra -- rum lo -- ca,  sed sig -- ni -- fer san -- ctus
		Mi -- cha -- el re -- præ -- sen -- tet e -- as in lu -- cem san -- _
		_ ctam. Quam o -- lim A -- bra -- hæ pro -- 
		mi -- si -- _ _ _ _ sti et se -- mi -- ni e -- _ _ _ _ _ ius.
	}
}

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t \cadenzaOn
		g'8 f g g s g8 f g s g8 a bes g g f s
		\cadenzaOff \override Stem.transparent = ##f
		\showBarLine \bar "|" \time 2/2
		
		\[a2 bes c1\] d2. c4 bes d bes c a2 g |
		r bes \[a bes\] c c2. c4 c2 d2. d4 \ficta es4. d8 c4 bes c2 r4 bes2

		a4 g2 | a1 r2 c \[a c\] c bes \[bes c\] d4 g,2 a4 |
		bes c2 bes4 c2 r4 bes a bes c d2 c4 d2 r4 d d d2 c bes4 |
		c2 es2. d4 c d c4. a8 bes2 a r4 a c2 d2. d4 d2 |
		d2 c4 bes c d4. c8 c2 \ficta b4 c2 | r \ficta b1 c2 a2. a4 a2 c |

		d c2. a4 bes d4. c16 bes c4 a2 r4 bes c2. c4 c2 d2. c4 |
		bes2 c a d2. c4 bes c bes2 a r4 a bes c d2 c4. bes8 |
		a g bes4 a2 \cadenzaOn g\breve \cadenzaOff 
		\showBarLine \bar "|"
		
		bes1 \[g2 c\] a r4 bes bes2 bes4 a8 g a2 d2.
		c4 bes c bes g a1 r2 d2 e2. d4 c bes a f \[g2 a\] \cadenzaOn g\breve \cadenzaOff 
		\showBarLine \bar "|"
	}
	\addlyrics {
		Do -- mi -- _ ne Je -- su __ _ Chri -- _ _ _ ste __ _
		Rex __ _ _ glo -- _ _ _ _ _ ri -- æ,
		li -- be -- _ ra a -- ni -- mas om -- ni -- um fi -- de -- li -- um de -- 
		
		fun -- cto -- rum, de pœ -- _ nis in -- fer -- _ ni, in -- _
		fer -- _ _ ni et de pro -- fun -- do la -- cu, li -- be -- ra e -- _
		as de o -- re le -- o -- _ _ nis, ne ab -- sor -- be -- at
		e -- as tar -- ta -- _ _ _ _ rus, ne ca -- dant in ob -- scu -- 

		ra te -- ne -- bra -- rum __ _ _ lo -- ca,  sed sig -- ni -- fer san -- ctus
		Mi -- cha -- el re -- præ -- sen -- tet e -- as in lu -- cem san -- _ _
		_ _ _ _ ctam. Quam o -- _ lim A -- bra -- hæ __ _ _ _ pro -- 
		mi -- si -- _ _ _ sti et se -- mi -- ni e -- _ _ _ _ ius.
	}
}

bass = \new Voice {
	\relative c {
		\clef "bass"
		\once \override Staff.TimeSignature.stencil = ##f
		\cadenzaOn \skip 8*16 \cadenzaOff 
		\set Score.currentBarNumber = #2
		
		\[d2 g f1\] bes,2. f'4 g d \ficta es c d2 g, |
		r g' \[d g\] c, f2. f4 f2 bes2. bes4 es, \ficta es f g f2 g2.

		d4 \ficta es2 d1 r2 c \[d c\] c g' \[g a\] bes4. a8 g4 f |
		g c, g'2 f r4 g d g f d a'2 d, bes2. bes4 f'2 g |
		f c2. g'4 a g a f g2 d r4 d c2 bes2. bes4 bes2 |
		bes' f4 g2 f4 g1 c,2 r g'1 c,2 d2. d4 d2 c |

		bes f'2. f4 g bes a2 d, r4 g4 f2. f4 f2 bes2. f4 |
		g2 c, d bes2. f'4 g f g2 d r4 d g f \[bes,2 c |
		d1\] \cadenzaOn g,\breve \cadenzaOff \showBarLine \bar "|"
		g'2. g4 \[es2 c\] d2. bes4 bes2 f'2 ~ f4 f4 \[bes,2 |
		f'\] g4 f g \ficta es d1 r2 d c2. d4 f g d f \ficta \[es2 d\] \cadenzaOn g,\breve \cadenzaOff 
		\showBarLine \bar "|"
	}
	\addlyrics {
% 		Do -- mi -- _ ne Je -- su __ _ Chri -- _ _ _ ste __ _
		Rex __ _ _ glo -- ri -- æ, rex glo -- _ ri -- æ
		li -- be -- _ ra a -- ni -- mas om -- ni -- um fi -- de -- li -- um de -- 
		
		fun -- cto -- rum, de pœ -- _ nis in -- fer -- _ _ _ _ _ 
		_ _ _ ni et de pro -- fun -- do la -- cu, li -- be -- ra e --
		as de o -- re le -- o -- _ _ nis, ne ab -- sor -- be -- at
		e -- as tar -- ta -- rus, __ _ ne ca -- dant in ob -- scu -- 

		ra te -- ne -- bra -- rum lo -- ca,  sed sig -- ni -- fer san -- ctus
		Mi -- cha -- el re -- præ -- sen -- tet e -- as in lu -- cem san -- _
		_ ctam. Quam o -- lim __ _ A -- bra -- hæ pro -- mi -- si -- 
		_ _ _ _ _ sti et se -- mi -- ni e -- _ _ _ _ ius.
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalF \soprano >> 
			\new Staff << \globalF \alto >>
			\new Staff << \globalF \tenor >>
			\new Staff << \globalF \bass >>
		>> 
	}
	\header {
		piece = \markup \larger \sans { Offertorium }
	}
}

\score {
	\transpose f g {
	\new Staff <<
		\key f \major
		\new Voice = "tenor" {
			\relative c {
				\clef "treble_8"
				\once \omit Staff.TimeSignature
				\cadenzaOn
				\override Stem.transparent = ##t 
				f4 g bes bes bes a s  g f s  g bes bes bes a s  f g bes s  bes g a g f f s  a g a bes s  a g f f g g-- s \showBarLine\bar "|"
				\cadenzaOff
			}
		}
		\addlyrics {
			Ho -- sti -- _ as __ _ _ et __ _ pre -- _ ces __ _ _ ti -- bi __ _ 
			Do -- mi -- _ _ _ ne lau -- _ dis __ _ of -- _ fe -- ri -- _ mus.
		}
	>>
	}
}


soprano = \new Voice {
	\relative c'' {
		\set Score.rehearsalMarkFormatter = #format-mark-alphabet
		\set Score.currentBarNumber = #67
		\[g1 a2.\] bes4 |
		c2 bes2. a4 g a4. g8 g2 f4 | \mark #9 g2 r4 g g f g bes2 a4 g f | \break
		g a bes g4. a8 bes4 c2 f,4 g4. f8 f2 e4 \mark #10 f a2 g4 a bes a2 r4 a4. 
		f8 bes2 a4 | bes1 \break
		r4 bes bes bes bes2 a2. a4 a2 r g1

		g2 f2. f4 \break
		g2 bes2. bes4 bes2 a4 a g2 \mark #11 g r g1
		g2 \[f d\] f2. f4 f2 bes2. a4 g a4. g8 g2 \ficta fis8 e \ficta fis2
		r a c2. bes4 a g f a4. g8 g4. \ficta fis16 e \ficta fis4 g1 \showBarLine \bar "||" |
	}
	\addlyrics {
		Tu __ _ _
		_ su -- _ sci -- _ _ _ _ pe pro a -- ni -- ma -- bus il -- lis, pro
		a -- ni -- ma -- bus __ _ _ il -- _ _ _ _ _ lis qua -- rum ho -- di -- e, qua -- 
		rum ho -- di -- e me -- mo -- ri -- am fa -- ci -- mus, fac

		e -- as de mor -- te trans -- i -- re ad vi -- tam. Quam
		o -- lim __ _ A -- bra -- hæ pro -- mi -- si -- _ _ _ _ _ sti
		et se -- mi -- ni __ _ _ e -- _ _ _ _ _ ius.
	}
}

alto = \new Voice {
	\relative c' {
		\set Score.rehearsalMarkFormatter = #format-mark-alphabet
		\set Score.currentBarNumber = #67
		d1 f |
		g f4. e8 d4 f \ficta es c d2 \mark #9 r4 d d c d4. f8 e4 d d2 r4 d |
		d c d2 es4 f \ficta es2 d2. bes4 c2 \mark #10 c1 r2 r4 f2 e4 |
		f g f1 r4 f f g g1 e2. f4 f2 r d4. c16 d |

		\ficta es4 d2 c4 d2. d4 e2 f2. f4 g2 f4 f d2 \mark #11 e d1 es1
		d2 | f2. d4 c1 f2. f4 d f d \ficta es d1 |
		r2 f g2. f4 f d4. c8 a4 bes c d2 d1
		\showBarLine \bar "||"
	}
	\addlyrics {
		Tu __ _
		_ su -- _ _ _ _ sci -- pe pro a -- ni -- ma -- bus il -- _ lis, pro
		a -- ni -- ma -- bus __ _ il -- _ _ _ lis qua -- rum 
		ho -- di -- e me -- mo -- ri -- am fa -- ci -- mus, 
		fac __ _ _ 	_ e -- _ as de mor -- te trans -- i -- re ad vi -- tam. 
		Quam o -- lim A -- bra -- hæ pro -- mi -- si -- _ _ _ sti
		et se -- mi -- ni e -- _ _ _ _ _ ius.
	}
}

tenor = \new Voice {
	\relative c'' {
		\set Score.rehearsalMarkFormatter = #format-mark-alphabet
		\[bes1 c2.\] d4 |
		e2 d2. c4 bes c4. bes8 g4 a2 \mark #9 g4 bes a g a2 g4. f8 d2 r |
		r r4 g g f g2 bes4 bes4. a8 f4 g2 \mark #10 f r4 c'2 bes4 c d c2 |
		d4 \ficta es c2 bes r4 d d d d2 es4 d2 c8 bes c4 d c2 r bes1 

		g2 a2. a4 c2 d2. d4 \ficta es2 c4 c4. bes16 a bes4 \mark #11 c2 bes1 \[g2 |
		c\] a r4 bes bes bes2 a8 g a2 d2. c4 bes8 g c4 bes c a1 |
		r2 d e2. d4 c bes a f \[g2 a\] g1
		\showBarLine\bar "||"
	}
	\addlyrics {
		Tu __ _ _ 	_ su -- _ _ _ _ _ _ _ _ _ _ _ sci -- _ pe 
		pro a -- ni -- ma -- bus il -- _ _ _ lis qua -- rum ho -- _ _ _ _ di -- e me -- mo -- ri -- am fa -- _ _ _ _ ci -- mus, fac

		e -- as de mor -- te trans -- i -- re ad __ _ _ vi -- tam.
		Quam o -- _ lim A -- bra -- hæ __ _ _ _ pro -- mi -- si -- _ _ _ _ sti
		et se -- mi -- ni e -- _ _ _ _ ius.
	}
}

bass = \new Voice {
	\relative c {
		\clef "bass"
		\set Score.rehearsalMarkFormatter = #format-mark-alphabet
		g'1 f2. e8 d |
		c2 g'4. a8 bes4 f g f c \ficta es d2 \mark #9 g,4 g' f \ficta e! d2 g,4 g' g f g bes2
		a4 g4. f8 | es4 d c2 bes4 g \[d'2 c\] \mark #10 r4 f2 e4 f g f2 a4. g8 |
		f4 es f2 bes, bes' bes4 g g1 a2. d,4 f2 r g1
		
		\ficta es2 | d2. d4 c2 bes2. bes'4 es,2 f4 f g2 \mark #11 c, g'2. g4 \[es2 |
		c\] d2. bes4 bes2 f'2. f4 \[bes,2 f'\] g4 f g c, d1 |
		r2 d c2. d4 f g d f \[es2 d\] g,1
		\showBarLine \bar "||"
	}
	\addlyrics {
		Tu su -- _ _ sci -- pe pro a -- ni -- ma -- bus il -- _ _ lis, pro a -- ni -- ma -- bus, pro a -- ni -- ma -- bus 
		il -- lis, pro a -- ni -- ma -- bus il -- lis __ _ qua -- rum ho -- di -- e, qua -- rum ho -- di -- e __ _
		me -- mo -- ri -- am fa -- ci -- mus, fac

		e -- as de mor -- te trans -- i -- re ad vi -- tam. Quam o -- lim __ _
		A -- bra -- hæ pro -- mi -- si -- _ _ _ _ _ sti
		et se -- mi -- ni e -- _ _ _ _ ius.
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalF \soprano >> 
			\new Staff << \globalF \alto >>
			\new Staff << \globalF \tenor >>
			\new Staff << \globalF \bass >>
		>> 
	}
}

% SANCTUS 

soprano = \new Voice {
	\relative c'' {
		\once \override Staff.TimeSignature.stencil = ##f
		\cadenzaOn s2 \cadenzaOff \showBarLine \bar "|" \time 2/2
		
		\[a2 c2.\] b8 a b4 a2 g4 a1 r4 a2 a4 f f
		bes2 a2. a4 a2 a a r4 a a d2 c8 b c2 \showBarLine \bar "|"
		f,1 \[g2 a\] a2. a4 a a g2 \break
		e f2. f4 a2 g a1 \fermata
		a1 bes2 g f2. f4 e1 \cadenzaOn e\breve \cadenzaOff \showBarLine \bar "|"
	}
	\addlyrics {
% 		San -- ctus
		San -- _ _ _ _ _ _ ctus San -- ctus Do -- mi -- 
		nus De -- us Sa -- ba -- oth Sa -- ba -- oth __ _ _ _
		Ple -- ni __ _ sunt coe -- li et ter -- ra glo -- ri -- a tu -- a
		O -- san -- na in ex -- cel -- sis
	}
}

alto = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		\cadenzaOn s2 \cadenzaOff
		
		r2 e1 \[f2 e\] c4 e2 e4 e e f2 r4 f2 
		e4 f2 e d4 f4 ~ f4 f4 e e f f2 e8 d e4 f e2
		\showBarLine \bar "|"
		d1 \[d2 f\] f2. f4 f f e2 c d2. d4 e2 e f1 \fermata
		f1 f2 e d2. d4 b1 \cadenzaOn c\breve \cadenzaOff 
		\showBarLine \bar "|"
	}
	\addlyrics {
% 		San -- ctus
		San -- _ _ ctus Do -- mi -- nus De -- us Do -- _ _ _ _ _ mi -- nus De -- us Sa -- _ _ _ ba -- oth
		Ple -- ni __ _ sunt coe -- li et ter -- ra glo -- ri -- a tu -- a
		O -- san -- na in ex -- cel -- sis
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t a4 a \override Stem.transparent = ##f
		\showBarLine\bar "|"
		\time 2/2
		
		a1 \[c2 d\] b a c2. c4 c c d2. 
		\ficta bes4 c d2 c4 d2 r4 d2 c4 d4. c8 a1.
		\showBarLine\bar "|"
		a1 \[b2 c\] c2. c4 d d b2 a a2. a4 c2 b d1 \fermata
		c1 d2 c a2. f4 g a2 g4 \cadenzaOn a\breve \cadenzaOff \showBarLine\bar "|"
	}
	\addlyrics {
		San -- ctus
		San -- _ _ _ ctus Do -- mi -- nus De -- us __ _
		Sa -- _ ba -- oth Sa -- ba -- oth __ _ _
		Ple -- ni __ _ sunt coe -- li et ter -- ra glo -- ri -- a tu -- a
		O -- san -- na in ex -- cel -- _ _ sis
	}
}

bass = \new Voice {
	\relative c' {
		\clef "bass"
		\once \override Staff.TimeSignature.stencil = ##f
		\cadenzaOn s2 \cadenzaOff
		
		r2 a1 \[d,2 e\] a, a'2. a4 f f \ficta bes2
		g2 f4. g8 a4 a d,4. e8 f4 d a'2 d,1 a 
		d \[g2 f\] f2. f4 d d e2 a, d2. d4 a2 e' d1 \fermata 
		f1 bes,2 c d2. d4 e1 \cadenzaOn a,\breve \cadenzaOff 
		\showBarLine \bar "|"
	}
	\addlyrics {
% 		San -- ctus
		San -- _ _ ctus Do -- mi -- nus De -- us 
		Do -- mi -- _ nus De -- us __ _ _ Sa -- _ ba -- oth
		Ple -- ni __ _ sunt coe -- li et ter -- ra glo -- ri -- a tu -- a
		O -- san -- na in ex -- cel -- sis
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalC \soprano >> 
			\new Staff << \globalC \alto >>
			\new Staff << \globalC \tenor >>
			\new Staff << \globalC \bass >>
		>> 
	}
	\header {
		piece = \markup \larger \sans { Sanctus }
	}
}

% BENEDICTUS

soprano = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		\skip 8*10 \showBarLine \bar "|" \time 2/2
		a'2 a4 a a1 a2. g4 f1 \fermata \break
		g g2. g4
		f2 f e1 e\breve \showBarLine \bar "||"
	}
	\addlyrics {
% 		Be -- ne -- di -- ctus qui ve -- nit.
		In no -- mi -- ne Do -- mi -- ni, O -- san -- na
		in ex -- cel -- sis. __
	}
}

alto = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		\skip 8*10
		
		d2 f4 f e1 f2. d4 d1\fermata e2. d8 c d2 e
		c d b1 c\breve
		\showBarLine \bar "||"
	}
	\addlyrics {
% 		Be -- ne -- di -- ctus qui ve -- nit.
		In no -- mi -- ne Do -- mi -- ni, O -- _ _ san -- na
		in ex -- cel -- sis. __
	}
}

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		\once \override Staff.TimeSignature.stencil = ##f
		\cadenzaOn
		\override Stem.transparent = ##t 
		f8 g a a s a s a a s \override Stem.transparent = ##f 
		\cadenzaOff \showBarLine \bar "|"
		
		a2 d4 d2 c8 b c2 c2. b4 a1 \fermata c2. b8 a b2 c2.
		 a4 bes a a g8 f g2 a\breve \showBarLine\bar "||"
	}
	\addlyrics {
		Be -- ne -- di -- ctus qui ve -- nit.
		In no -- mi -- _ _ ne Do -- mi -- ni, O -- _ _ san -- na
		in __ _ ex -- cel -- _ _ _ sis. __
	}
}

bass = \new Voice {
	\relative c {
		\clef "bass"
		\once \override Staff.TimeSignature.stencil = ##f
		\skip 8*10
		
		d2 d4 d a'1 f2. g4 d1 \fermata c2 g'1 c,2
		f d e1 a,\breve
		\showBarLine \bar "||"
	}
	\addlyrics {
% 		Be -- ne -- di -- ctus qui ve -- nit.
		In no -- mi -- ne Do -- mi -- ni, O -- san -- na
		in ex -- cel -- sis. __
	}
}

\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalC \soprano >> 
			\new Staff << \globalC \alto >>
			\new Staff << \globalC \tenor >>
			\new Staff << \globalC \bass >>
		>> 
	}
}


% AGNUS DEI

soprano = \new Voice {
	\relative c'' {
		\once \override Staff.TimeSignature.stencil = ##f
		s1 \showBarLine\bar "|"
		g2 g4 g a1 g4 f g2 g1\fermata g a2 a2. a4 g2. g4 \cadenzaOn g\longa \cadenzaOff \showBarLine \bar "|" \break

		s1 \showBarLine\bar "|"
		a2 a4 a g1 g4 e f2 g1\fermata g a2 a2. a4 a1 g \cadenzaOn a\longa \cadenzaOff \showBarLine \bar "|" \break
		
		\override Stem.transparent = ##t a4 a a a \override Stem.transparent = ##f \showBarLine\bar "|"
		a2 a4 a a1 g4 f a2 a1\fermata g a b g2 g2. g4 a2 a2. a4 g1 \cadenzaOn g\longa \cadenzaOff \showBarLine \bar "||"
	}
	\addlyrics {
% 		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em.
% 		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em.
% 		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em sem -- pi -- ter -- nam.
	}
}

alto = \new Voice {
	\relative c'' {
		\once \override Staff.TimeSignature.stencil = ##f
		s1 e,2 e4 e f1 d4 d e2 e1\fermata d f2 f2. f4 d2. e4 \cadenzaOn e\longa \cadenzaOff \showBarLine \bar "|" \break
		s1 f2 f4 f e1 e4 c d2 e1\fermata e e2 f2. e8 d \[e2 f\] d2. d4 \cadenzaOn f\longa \cadenzaOff \showBarLine \bar "|" \break
		s1 e2 e4 e f1 d4 d f2 e1\fermata e e g e2 e2. e4 f2 f2. f4 d1 \cadenzaOn e\longa \cadenzaOff \showBarLine \bar "||"
	}
	\addlyrics {
% 		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em.
%		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e is __ _ re -- _ _ qui -- em.
%		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em sem -- pi -- ter -- nam.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t a4 a a a \override Stem.transparent = ##f \showBarLine\bar "|"
		c2 c4 c c1 b4 a c2 c1\fermata b c2 d2. c4 c b8 a b4 c4 \cadenzaOn c\longa \cadenzaOff \showBarLine\bar "|" \break
		
		\override Stem.transparent = ##t a4 a a a \override Stem.transparent = ##f \showBarLine\bar "|"
		c2 c4 c c1 b4 a a2 c1\fermata b c2 d2. c4 c2. b8 a b4 c2 b4 \cadenzaOn c\longa \cadenzaOff \showBarLine\bar "|" \break
		
		\override Stem.transparent = ##t a4 a a a \override Stem.transparent = ##f \showBarLine\bar "|"
		c2 c4 c c1 b4 a d2 c1\fermata b c d c2 c2. c4 c2 c2. c4 c b8 a b2 \cadenzaOn b\longa \cadenzaOff  \showBarLine\bar "||"
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
	\relative c' {
		\clef "bass"
		\once \override Staff.TimeSignature.stencil = ##f
		s1 c,2 c4 c f1 g4 d c2 c1\fermata g' f2 d2. f4 g2. c,4 \cadenzaOn c\longa \cadenzaOff \showBarLine \bar "|" \break
		s1 f2 f4 f c1 e4 a, d2 c1\fermata e a,2 d2. a4 \[a'2 f g2.\] g4 \cadenzaOn f\longa \cadenzaOff \showBarLine \bar "|" \break
		s1 a2 a4 a f1 g4 d d2 a1\fermata e' a g c,2 c2. c4 f2 f2. f4 g1 \cadenzaOn e\longa \cadenzaOff \showBarLine \bar "||"
	}
	\addlyrics {
%		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em.
%		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re __ _ _ qui -- em.
%		A -- gnus De -- i
		Qui tol -- lis pec -- ca -- ta mun -- di, do -- na e -- is re -- qui -- em sem -- pi -- ter -- nam.
	}
}


\score {
	\transpose f g {
	  	<< 
			\new Staff << \globalC \soprano >> 
			\new Staff << \globalC \alto >>
			\new Staff << \globalC \tenor >>
			\new Staff << \globalC \bass >>
		>> 
	}
	\header {
		piece = \markup \larger \sans { Agnus Dei }
	}
}

% COMMUNIO

soprano = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		s1
		\showBarLine\bar "|"
		\time 2/2
		\set Score.currentBarNumber = #2
		
		a'1 a4 g2 a4 f a4. g8 g2 f4 g2 ~ \break
		g2 e4 f2
		e8 d c4 a' | c2 b4 c a g4. f8 g4 a \mark #11 b2 a4 ~ a g4 a1 r4 a2
		a4 g2 | g1 r4 e f g a g2 f4 \break
		g2 r8 e f4 g a2 g
		
		\ficta fis4 g \mark #12 d | e f g2 f8 e f g a4 g2 \ficta fis4 
		\cadenzaOn g\breve \cadenzaOff s2 | \showBarLine \bar "|" | \break

		\once \override Staff.TimeSignature.stencil = ##f
		\cadenzaOn s8*18 \cadenzaOff \showBarLine \bar "|"
		\set Score.currentBarNumber = #24
		
		c2 c4 c c2. c4 c2 c |
		b4. a8 b4 c a g2 \ficta fis4 \cadenzaOn g\breve \cadenzaOff | \showBarLine \bar "|"
		\set Score.currentBarNumber = #30		
		
		r2 a c b4 c a g4. f8 g4 | a b2 a4 ~ \break a4 g4
		a1 r4 a2
		
		a4 g2 g1 \mark #13 r4 e f g a g2 f4 g2 r8 e f4 g a2 g
		\ficta fis4 g d e \ficta f! g2 f4 \ficta bes a g2 \ficta fis4 \cadenzaOn g\longa \cadenzaOff
		\showBarLine\bar "||"
	}
	\addlyrics {
% 		Lux æ -- _ ter -- _ na __ _ 
		Lu -- ce -- at e -- is Do -- _ _ mi -- ne, [Do -- _
		mi -- _ ne] cum san -- ctis tu -- is in __ _ _ æ -- ter -- _ _ num, in
		æ -- ter -- num,
		qui -- a pi -- us __ _ _ es, qui -- a pi -- us __ _ _ es, 
		qui -- a pi -- us __ _ _ _ _ _ _ _ es.

% 		Re -- qui -- em æ -- ter -- nam do -- na e -- is Do -- mi -- ne 
		Et lux per -- pe -- tu -- a lu -- 
		ce -- _ _ at e -- _ _ is.
		Cum san -- ctis tu -- _ _ _ _ _ _ _ _ is, in

		æ -- ter -- num, 
		qui -- a pi -- us __ _ _ es, qui -- a pi -- us __ _ _ es, qui -- a pi -- us __ _ _ _ _ _ es.

		Re -- qui -- és -- cant in pá -- _ ce. A -- men. _
	}
}

alto = \new Voice {
	\relative c' {
		\once \override Staff.TimeSignature.stencil = ##f
		s1
		
		e1 e2 e d4 e2 c4 d d b4. c8 d4 e a,2 |
		r4 d f e2 f4 d e4. c8 d4 e2. \mark #11 f4. e8 c4 f e4. d8 c b a4 d f2 |
		e4 f d e2 e4 d2 e \times 2/3 { c4 d e } a, e'2 d8 c b4 b c d e2 d1
		r4 \mark #12 b c d e2 d1. r4 b c d e2 d1 | \showBarLine \bar "|"
		
		\once \override Staff.TimeSignature.stencil = ##f
		\cadenzaOn s8*18 \cadenzaOff
		
		g2 g4 g f2. f4 g2 g2.
		g4 g2 f4 d d2 ~ \cadenzaOn d\breve \cadenzaOff |
		d2 f e4 f d e4. c8 d4 e2. f4. e8 c4 f e4 ~ e8 d8 c b a4 d f2 |

		e4 f d e2 e4 d2 \mark #13 e \times 2/3 { c4 d e } a, e'2 d8 c b4 b c d e2 d1
		r4 b | c d e2 d1. r4 b c d e2 \cadenzaOn d\breve s2 \cadenzaOff |
	}
	\addlyrics {
% 		Lux æ -- _ ter -- _ na __ _ 
		Lu -- ce -- at e -- _ _ is Do -- _ _ _ mi -- ne
		cum san -- ctis tu -- is in __ _ _ æ -- ter -- _ _ _ _ _ _ _ num, cum san -- 
		ctis tu -- is in æ -- ter -- _ _ _ _ _ _ _ _ num,
		qui -- a pi -- us es, qui -- a pi -- us es, qui -- a pi -- us es.
		
% 		Re -- qui -- em æ -- ter -- nam do -- na e -- is Do -- mi -- ne 
		
		Et lux per -- pe -- tu -- a lu -- 
		ce -- at e -- _ is.
		Cum san -- ctis tu -- _ _ _ is, cum san -- _ ctis tu -- _ _ _ _ is
		in æ -- _ _ _ _ ter -- _ _ _ _ _ _ _ _ _ num, 
		qui -- a pi -- us es, qui -- a pi -- us es, qui -- a pi -- us es.
		
		Re -- qui -- és -- cant in pá -- _ ce. A -- men. _
	}
}

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t
		\cadenzaOn a'8 s g f g a a g \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"
		\time 2/2
		
		a1 c2 b4 c a c4. b8 g4 a2 g4. a8 b4 c4. b16 a a2
		g4 a2 r2 r4 a | c b c2 a4 \mark #11 d4. c8 a4 | b2 a r4 a d c2
		d4 b c | g c2 b4 c4. b8 a4 g r b c4. d8 e4 d g,8 c4 b8 c4 e, f g |

		a a g \mark #12 g2 a4 b c a r8 d, f4 g a2 \cadenzaOn g\breve s2 \cadenzaOff
		\showBarLine\bar "|"
		
		\once \override Staff.TimeSignature.stencil = ##f
		\override Stem.transparent = ##t 
		\cadenzaOn g8 a c s  c c c s  c c s  c c s  d c c \fermata s \cadenzaOff
		\override Stem.transparent = ##f
		\showBarLine\bar "|"
		
		e2 e4 e a,2. a4 e'2 e2. 
		d8 c d4 c ~ c b4 a2 \cadenzaOn g\breve \cadenzaOff |
		r1 r2 r4 a c b c2 a4 d4. c8 a4 b2 a | r4 a d c2

		d4 b c g c2 b4 \mark #13 c4. b8 a4 g r b c4. d8 e4 d g,8 c4 b8 c4 e, f g |
		a a g g2 a4 b c a d, f g a2 \cadenzaOn g\longa \cadenzaOff
	}
	\addlyrics {
		Lux æ -- _ ter -- _ na __ _ 
		Lu -- ce -- at e -- is Do -- _ _ _ _ _ _ _ _ _ _ 
		mi -- ne cum san -- ctis tu -- is in __ _ æ -- ter -- num, cum san -- ctis 
		tu -- is in æ -- ter -- _ _ _ _ num,
		qui -- a pi -- us es, __ _ _ _ _ qui -- _ _ _ a pi -- us __ _ _ _ es, qui -- a pi -- us es.
		
		Re -- qui -- em æ -- ter -- nam do -- na e -- is Do -- mi -- ne 
		
		Et lux per -- pe -- tu -- a lu -- 
		_ _ _ ce -- at e -- is.
		Cum san -- ctis tu -- is in __ _ æ -- ter -- num, cum san -- ctis 

		tu -- is in æ -- ter -- _ _ _ _ num,
		qui -- a pi -- us es, __ _ _ _ _ qui -- _ _ _ a pi -- us __ _ _ _ es, qui -- a pi -- us es.
		
		Re -- qui -- és -- cant in pá -- _ ce. A -- men. _
	}
}

bass = \new Voice {
	\relative c {
		\clef "bass"
		\once \override Staff.TimeSignature.stencil = ##f
		s1
		
		a1 a8 b c d e4 c d a e'2 d e4 g4 ~ g8 f8 e d c4 d |
		b2 a r1 r1 r4 \mark #11 d f2 d4 e c f2 d4. e8 f g |
		a4 f g c, e4. f8 g2 c, r4 e | f g a2 g4. f8 e4 d c2 d4 g, |

		d'2 r4 \mark #12 g e d g c, d d2 g,4 d'2 r4 g, c b c2 g1 |
		\showBarLine \bar "|"
		
		\once \override Staff.TimeSignature.stencil = ##f
		\cadenzaOn s8*18 \cadenzaOff
		
		c2 c4 c f2. f4 c2 \[c 
		g'2.\] e4 f g d2 \cadenzaOn g,\breve \cadenzaOff |
		\showBarLine \bar "|"
		r1 r r r4 d' f2 d4 e c f2 d4. e8 f g |

		a4 f g c, e4. f8 g2 \mark #13 c, r4 e f g a2 g4. f8 e4 d c c d g, |
		d'2 r4 g e d g c, d2. g,4 d'2 r4 g, c b c2 \cadenzaOn g\breve s2 \cadenzaOff
	}
	\addlyrics {
% 		Lux æ -- _ ter -- _ na __ _ 
		Lu -- ce -- _ _ _ _ _ at e -- is Do -- mi -- ne, __ _ _ _ _ _ _ _
		cum san -- ctis __ _ _ tu -- _ _ _ _ _ is in æ -- ter -- _ _ num,
		qui -- a pi -- us es, __ _ _ _ _ _ _ _ qui -- a pi -- us __ _ _ es, __ _ _ qui -- a pi -- us es.
		
% 		Re -- qui -- em æ -- ter -- nam do -- na e -- is Do -- mi -- ne 

		Et lux per -- pe -- tu -- a lu -- 
		_ ce -- at e -- is. __ _ 
		Cum san -- ctis tu -- is in æ -- _ _ _ _ _ _ _ ter -- _ _ num,
		qui -- a pi -- us es, __ _ _ qui -- a pi -- us __ _ es, qui -- a pi -- us __ _ es, __ _ _ qui -- a pi -- us es.
		
		Re -- qui -- és -- cant in pá -- _ ce. A -- men. _
	}
}

\score {
	\transpose f g {
	  	<< 
 			\new Staff << \globalC \soprano >> 
  			\new Staff << \globalC \alto >>
 			\new Staff << \globalC \tenor >>
 			\new Staff << \globalC \bass >>
		>> 
	}
	\header {
		piece = \markup \larger \sans { Communio }
	}
}

\score {
	\transpose f f {
	\new Staff <<
		\key c \major
		\new Voice {
			\relative c'' {
				\cadenzaOn \override Stem.transparent = ##t
				g8 a a g s  a s  a g g-- s \showBarLine \bar "|"
				s8 g g-- a-- s8 \showBarLine \bar "|."
				\cadenzaOff
			}
		}
		\addlyrics {
			Re -- qui -- és -- cant in pá -- _ ce. A -- men. _
		}
	>>
	}
	\layout {
		ragged-right = ##t
		\context { 
			\Voice 
			\remove "Ambitus_engraver"
		}
	}
}
