% CPDL #31402
% Copyright ©2016 Peter Hilton - https://github.com/hilton

\version "2.18.0"
revision = "6"
\pointAndClickOff

#(set-global-staff-size 15.5)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15.5 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 5\mm
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 8) )
	markup-system-spacing = #'( (padding . 4) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		"Sicut cervus"
	}
	composer = \markup \sans \column \right-align { "Giovanni Pierluigi da Palestrina (1525-1594)" }
	poet = \markup \medium \sans {
		"PRIMA PARS"
	}
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
	indent = #0
  	ragged-right = ##f
  	ragged-last = ##t
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
		\consists "Ambitus_engraver"
	}
}

global= { 
	\key f \major
	\time 2/2
	\tempo 2 = 55
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##t }
fictaParenthesized = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##t }

cantus = \new Voice	{
	\relative c' {
		R1 R R r2 f1 f2 | \break
		g f4 c f4. g8 a4 a bes2 a4 g a c4. bes8 a2 g4 a2 | \break c4. bes8 a g a4.
		 g8 f2 e4 f2 r R1 r2 f ~ | \break f f2 g f4 c
		f4. g8 a4 a bes2 a4 f8 g a bes c a bes2 | \break a4 g4. f8 f2 e8 d e2
		f1 R R | \break r2 f1 e2 d4. e8 f4 g4. f8 f2 e4 d c d d | \break c1 r r r2 g'1
		 f2 e4. f8 g4 a2 g4 a2. g8 f g2( f4.) e8 d2 r bes' ~ | \break
		bes4 a a2 g1 f r4 f g bes2 a4 g2 ~ | \break g f4. g8
		a4 g8 f g2 r1 bes2. a4 a2 g2 ~ | \break g2 f2 r4 f g bes2
		 a4 g4. f8 d e f2 e4 f1 ~ | \break f\breve ~ f | \showBarLine \bar "|."
	}
	\addlyrics {
		Sic -- ut
		cer -- vus de -- sí -- de -- rat ad fon -- tes a -- quá -- _ _ _ _ rum, a -- _ _ _ _
		_ _ quá -- rum, sic -- ut cer -- vus de -- 
		sí -- de -- rat ad fon -- tes a -- _ _ _ _ _ _ _ quá -- _ _ _ _ _ rum: i -- ta de -- _ _ sí -- 
		_ _ _ _ _ _ de -- rat, i -- 
		ta de -- _ _ sí -- de -- rat __ _ _ _ _ _ á -- 
		ni -- ma me -- a ad te, De -- _ _ us, __
		_ _ _ _ _ á -- ni -- ma me -- a ad te, De -- 
		_ _ _ _ _ _ _ us __
	}
}

altus = \new Voice {
	\relative c {
		R1 R c' c2 d c4 a d4. c8
		d4 e f2 c c4 d4. c8 d e f4 e f2 e r1 f
		f2 g f4 f, a4. bes8 c4 d4. c8 bes4. a8 a4 d2 c4 c f,2 c'2. a4
		a4. bes8 c4 c d2 c f f2 ~ f4 e4 d2 c1
		a4. g8 a bes a2 g8 f g2 f1 r r bes
		a2 g4. a8 bes4 c4. bes8 bes4 ~ bes a8 g a2. a4 g2 d'1. c1
		 r2 c1 bes2 a4. bes8 c4 d2 \fictaParenthesized cis4 d2. c8 bes c2( bes)
		r f'2. e4 e2 d c1 bes4. c8 d4 c c2 c r4 f2
		 e4 e2 d c bes4. c8 d4 c2 f e4 d1. bes4. c8
		d2 bes4 d2 c4 c2 r4 c d f4 ~ f8 e8 d c bes4 c d1 \set Timing.timing = ##f c\breve
	}
	\addlyrics {
		Sic -- ut cer -- vus de -- sí -- de -- 
		rat at fon -- tes a -- quá -- _ _ _ _ _ _ rum, sic -- 
		ut cer -- vus de -- sí -- de -- rat ad __ _ _ _ _ fon -- tes a -- quá -- rum, de -- 
		sí -- de -- rat at fon -- tes a -- quá -- _ _ _ _ _ _ _ _ _ _ _ rum: i -- 
		ta de -- _ _ sí -- _ _ _ _ _ de -- rat, i -- ta, __
		i -- ta de -- _ _ sí -- de -- rat __ _ _ _
		á -- ni -- ma me -- a __ ad -- _ _ te, De -- us, á -- 
		ni -- ma me -- a ad __ _ _ te, __ De -- _ us, __ ad __ _
		_ te, De --  _ us, "[ad" te, De -- _ _ _ _ _ _ us.]
	}
}

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		f1 f2 g f4 c f4. g8 a4 a bes2 a4 f bes4. a8
		bes4 c a1 r c c2 d c4 f, a4. bes8 c4 c
		d2 c a4. bes8 c4 f, a2( bes4.) c8 d4 c4. bes8 bes4 ~ bes a8 g a4 f2 e4 f1
		 r2. f4 a4. bes8 c4 c d2 c4. bes8 a4 bes g1
		f2 r c'1 bes2 a4. bes8 c4 d4. c8 c2 \ficta b4 c2( f,) r
		r2. g4 g a bes bes f2 r c'1 bes2 a4 bes4. a8 a4 g g
		c, g' a a g2 r1 f e2 d4. e8 f4 g4. f8 f2 e4
		f4. g8 a4. bes8 c2 r2. bes2 a4 a2 g( f) c2 ~ c4 g'4 a bes
		c c,8 d e f g e f4 g4. f8 f2 e4 f2 r1 r4 bes2 a4 a2 g
		f4 f g bes2 a4 g2 f r4 a bes d2 c4 bes1 a\breve
	}
	\addlyrics {
		Sic -- ut cer -- vus de -- sí -- de -- rat ad fon -- tes a -- qua -- _
		_ _ rum, __ sic -- ut cer -- vus de -- sí -- de -- rat ad
		fon -- tes a -- _ _ _ quá -- _ _ _ _ _ _ _ _ _ _ rum, __
		de -- sí -- de -- rat ad fon -- tes __ _ _ a -- quá -- 
		rum: i -- ta de -- _ _ sí -- _ _ de -- rat, __
		"[i" -- ta de -- sí -- de -- rat,] i -- ta de -- sí -- _ _ _ de -- 
		rat, "[de" -- sí -- de -- rat,] i -- ta de -- _ _ sí -- _ _ de -- 
		rat__ _ _ _ _ á -- ni -- ma me -- a __ ad te, __ _
		_ De -- _ _ _ _ _ _ _ _ _ _ us, á -- ni -- ma me -- 
		a ad te, De -- _ _ us, ad te, De -- _ _ us.
		
	}
}

bassus = \new Voice {
	\relative c {
		\clef bass
		R1 R R R R
		r2 f1 f2 g f4 c f4. g8 a4 a bes2 a4 a f2 f
		r1 f f2 g f bes, f'4. e8 d4 d c2 f,
		r4 f' f f bes,8 c d e f2 f bes, c4 c d bes c1
		r2 f1 e2 d4. e8 f4 d e f4. e8 d c d2( c) bes4. c8 d4 e
		f2( c) r1 r2 f1 e2 d4. e8 f4 g4. f8 f2 e8 d
		e2 f c1 r r bes a2 g
		d'4. e8 f4 f c2. c4 d bes f'1 r2. f2 e4 e2 d
		c c d4 bes2 a4 g2 f f' c4 c g'2 d d g,4. a8 
		bes c d4 g,4. a8 bes4 f c' c d f4. e8 d c bes2. a4 bes1 f\breve
	}
	\addlyrics {	
		Sic -- ut cer -- vus de -- sí -- de -- rat ad fon -- tes a -- quá -- rum,
		sic -- ut cer -- vus de -- sí -- de -- rat ad fon -- tes 
		de -- sí -- de -- rat __ _ _ _ _ ad fon -- tes a -- quá -- _ rum:
		i -- ta de -- _ _ _ _ sí -- _ _ _ _ _ _ _ de -- 
		rat, "[i" -- ta de -- _ _ sí -- _ _ _ _ 
		_ de -- rat,] i -- ta de -- 
		sí -- _ _ de -- rat, de -- sí -- de -- rat á -- ni -- ma me -- 
		a ad te,  De -- _ _ us,	á -- ni -- ma me -- a ad te, __ _
		_ _ _ De -- _ _ _ us, ad te,  De -- _ _ _ _ _ _ us.
	}
}

\score {
	\transpose c d {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 9)
			\new Staff << \global \cantus >> 
			\new Staff << \global \altus >> 
			\new Staff << \global \tenor >> 
			\new Staff << \global \bassus >> 
		>> 
	}
	\header {
		piece = ""
	}
	\layout { }
%	\midi {	}
}

cantus = \new Voice	{
	\relative c' {
		r2 f a c4 c4. c8 c4 bes2 a2. g4 a bes c2 ~ | \break
		c4 a g2 g r4 f8 g a bes c4 a f g2 f2. e4 f g | \break a f g2
		a r2. g4 a bes c a g2 f4 g4. f8 f4 ~ | \break f e8 d e2 f r4 f2
		 g4 a4. bes8 c4 a2 bes4 c a4. g8 a f | \break g2 f4 d2 e4 f4. g8 a4 f g a
		f2 e4 g a c4. bes8 a4 g f8 e f e e d16 c d2 c4 e f a4. g8 f4 e8 f g e f2
		f1 ~ | \break f r4 f a a c2 g1 r2 R1 | \break
		d'2. c4 c4. bes8 a4 g f2 e a1 g4 g e f | \break g4. f16 e d2
		e4 g2 a4. a8 a4 bes2 a4 f g4. g8 a2 r2 | \break r4 d4. c8 bes4 a g f g4.
		 f8 f2 e4 f1 r r r4 g a4. a8 a2 bes
		a f g4 a d, d'4 ~ | \break d8 c8 bes4 a g f g4. f8 f2 e8 d e2 \set Timing.timing = ##f f\breve \showBarLine \bar "|."
	}
	\addlyrics {
		Si -- tí -- vit á -- ni -- ma me -- a ad De -- um fon -- 
		tem vi -- vum, á -- _ _ _ _ ni -- ma me -- a __ ad De -- um fon -- tem vi -- 
		vum, ad De -- um fon -- tem vi -- vum, vi -- _ _ _ _ _ vum: quan -- 
		do vé -- ni -- am et ap -- pa -- ré -- _ _ _ _ bo, quan -- do vé -- ni -- am et ap -- pa -- 
		ré -- bo an -- te fá -- ci -- em De -- _ _ _ _ _ _ _ _ i, an -- te fá -- ci -- em De -- _ _ _ _ 
		i? Fu -- é -- runt mi -- hi __
		lá -- cry -- mæ __ _ _ _ me -- æ pa -- nes di -- e ac no --  _ _ _
		cte, dum dí -- ci -- tur mi -- hi quo -- tí -- di -- e: U -- bi est De -- us tu -- _
		_ _ _ us dum dí -- ci -- tur mi -- 
		hi quo -- tí -- di -- e: U -- bi est De -- us tu -- _ _ _ _ _ _ us?
		
	}
}

altus = \new Voice {
	\relative c {
		c'2 d f4 f4. f8 f4 e2 d2. c4 d e f d c8 bes a g
		f4 f'2 e8 d e2 f4 d c a8 bes c a d4. c8 c4 d2 g, r c d 
		f4 f4. f8 f4 e2 d r4 c d e f e8 d c4 bes c1 a4 bes2 c4
		d4. e8 f4 d e f d2 c4. d8 e4 f4 ~ f e4 f4. e8 d4 c8 bes a4 d c d c c
		f,2 g r4 c e f e d4. c8 c2 bes4 a g f4. g8 a2 r4 c d f ~
		f8 e d4 c2 d4 bes d d f2 c1 es2. d4 d2. c4 bes a ~
		a g a2 r f1 g4 c c8 bes a g f4 f' e d4. c8 c4 ~ c \ficta b8 a b2
		c4 e2 f4. f8 f4 f2 f4 c d e f d c4. c8 d2 r4 f4. e8 d4 c bes
		c d2 c8 bes a4. g8 f2 r4 d'4. c8 bes4 a g a bes g2 f4 c' f4. f8 f2
		f c4 d c c f4. e8 d2 r4 d4. d8 c4 c d c1 c\breve
	}
	\addlyrics {
		Si -- tí -- vit á -- ni -- ma me -- a __ ad De -- um fon -- tem vi -- _ _ _
		_ _ _ _ _ vum, á -- ni -- ma __ _ _ _ _ _ _ me -- a, si -- tí -- 
		vit á -- ni -- ma me -- a, ad De -- um fon -- _ _ _ tem vi -- vum: quan -- do 
		vé -- ni -- am et ap -- pa -- ré -- bo, __ _ _ quan -- do vé -- _ _ _ _ _ ni -- am et ap -- pa -- 
		ré -- bo an -- te fá -- ci -- em __ _ _ _ De -- _ _ _ i, an -- te fá -- 
		ci -- em De -- i? Fu -- é -- runt mi -- hi __ lá -- cry -- mæ __ _ _ me -- 
		_ æ pa -- nes di -- e __ _ _ _ _ ac no -- _ _ _ _ _ _ 
		cte, dum dí -- ci -- tur mi -- hi quo -- tí -- di -- e, quo -- tí -- di -- e: U -- bi est De -- us 
		tu -- _ _ _ _ _ us, u -- bi est De -- us tu -- _ _ us, dum dí -- ci -- tur 
		mi -- hi quo -- tí -- di -- e: __ _ _ u -- bi est De -- us tu -- us?
	}
}

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		r1 r r r r2 f
		a c4 c4. c8 c4 bes2 a1 r4 g a bes c2 bes a8 bes c a bes c d4 ~
		d8 c c2 \ficta b4 c2 r4 g4 a4. a8 bes4 c a g a g8 f g1 f
		r r4 f2 g4 a4. bes8 c4 a bes c a bes2 a8 g f4 bes a2 g4 c ~
		c8 bes16 a \ficta b4 c1 r4 f, g bes4. c8 a4 g2 c r f, g bes4. bes8
		a4 bes4. a16 g a4 bes1 r2. f4 a a c2 bes4 bes2 a4 a4. g8 f4 e
		d2 e a1 \fictaParenthesized b2 c4. \fictaParenthesized bes?8 a g f g a bes c2 \ficta b4 c2 d g,
		r4 g c4. c8 c2 d c4 a bes c f, f g a bes2 r4 d4. c8 bes4 a g
		a bes g2 f r4 d'4. c8 bes4 a g f g4. f8 f2 e4 f a d4. d8 d2
		c a4 bes bes a bes2 r4 d4. c8 bes4 a g a bes g1 a\breve
	}
	\addlyrics {
		Si -- 
		tí -- vit á -- ni -- ma me -- a, ad De -- um fon -- tem vi -- _ _ _ _ _ _
		_ _ _ vum, ad De -- um fon -- tem vi -- _ _ _ _ _ vum:
		quan -- do vé -- ni -- am et ap -- pa -- ré -- bo, __ _ _ _ et ap -- pa -- ré -- 
		_ _ _ bo __ an -- te fá -- ci -- em De -- i, an -- te fá -- ci -- 
		em De -- _ _ _ i? Fu -- é -- runt mi -- hi lá -- cry -- mæ __ _ _ _
		me -- æ pa -- nes di -- _ _ _ _ _ _ _ _ e ac no -- cte,
		dum dí -- ci -- tur mi -- hi quo -- tí -- di -- e, quo -- tí -- di -- e: U -- bi est De -- us 
		tu -- _ _ us, u -- bi est De -- us tu -- _ _ _ _ us, dum dí -- ci -- tur
		mi -- hi quo -- tí -- di -- e: u -- bi est De -- us tu -- _ _ us?
	}
}

bassus = \new Voice {
	\relative c {
		\clef bass
		r1 r r r r
		r c2 d f4 f4. f8 f4 e2 d c d4 e f a g2
		f4. e8 d2 c r1 r4 c d e f d c1 f,4 bes2 a4 
		bes g d'2 r1 r r2. bes2 c4 d4. e8 f4 d e f
		d2 c4. bes8 a2 r2 R1 r2 r4 c4 d f4. e8 d4 c2 bes8 c d e
		f1 r2 bes,2 d4 d f2 f r g2. f4 f4. e8 d4 c
		bes2 a1 d c2 f1 g2 a g1
		c,4 c2 f4. f8 f4 bes,2 f' r2. d4 \ficta es f bes,1 r
		r4 bes bes c d d4. c8 bes4 a g f g d' es d bes c2 r4 f d4. d8 bes2
		f'2 f4 d \ficta es f bes, bes'4 ~ bes8 a8 g4 fis g d e f bes, c1 f,\breve
	}
	\addlyrics {	
		Si -- tí -- vit á -- ni -- ma me -- a ad De -- um fon -- tem vi -- 
		_ _ _ vum, ad De -- um fon -- tem vi -- vum: quan -- do 
		vé -- ni -- am, quan -- do vé -- ni -- am et ap -- pa -- 
		ré -- bo __ _ _ an -- te fá -- ci -- em De -- i? __ _ _ _
		_ Fu -- é -- runt mi -- hi lá -- cry -- mæ __ _ _ _
		me -- æ pa -- nes di -- e ac no -- 
		cte, dum dí -- ci -- tur mi -- hi quo -- tí -- di -- e, 
		"[quo" -- tí -- di -- e:] U -- bi est De -- us, tu -- us De -- us tu -- _ us, dum dí -- ci -- tur 
		mi -- hi quo -- tí -- di -- e: u -- bi est De -- us tu -- us, De -- us tu -- us?
	}
}

\score {
	\transpose c d {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\override Score.MetronomeMark #'transparent = ##t
			\new Staff << \global \cantus >> 
			\new Staff << \global \altus >> 
			\new Staff << \global \tenor >> 
			\new Staff << \global \bassus >> 
		>> 
	}
	\header {
		piece = \markup \medium \sans {
			"SECUNDA PARS"
		}
	}
	\layout { }
%	\midi {	}
}