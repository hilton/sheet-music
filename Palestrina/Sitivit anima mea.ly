\version "2.12.2"

\header {
	title = "Sitivit anima mea"
	composer = "G P da Palestrina"
	poet = "SECUNDA PARS"
	tagline = \markup \small { 
		\column \center-align {
			\line { Version 2. Copyright ©2009 Cappella Gabrieli - \with-url #"http://cappellagabrieli.nl" http://cappellagabrieli.nl }
			\line { Licensed under the Creative Commons Attribution-Noncommercial-No Derivative Works 3.0 License - \with-url #"http://creativecommons.org/licenses/by-nc-nd/3.0" http://creativecommons.org/licenses/by-nc-nd/3.0 }
		}
	}
}

global= { 
	\key f \major
	\time 2/2
	\tempo 2 = 55
	\set Staff.midiInstrument = "choir aahs"
	\set Score.timing = ##f 
%	\override Score.LyricText #'font-size = #-1
	#(set-global-staff-size 15) 
	#(set-accidental-style 'forget)
}

\paper {
%	annotate-spacing = ##t
	page-top-space = 0
	ragged-bottom = ##t 
%	bottom-margin = 5\mm
}

ficta = { \once \set suggestAccidentals = ##t }
fictaParenthesized = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##t }

cantus = \new Voice	{
	\relative c' {
		\override NoteHead #'style = #'baroque
		r2 f a c4 c4. c8 c4 bes2 a2. g4 a bes c2 ~ \bar "" \break
		c4 a g2 g r4 f8 g a bes c4 a f g2 f2. e4 f g a f g2 \bar "" \break
		a r2. \mark \default g4 a bes c a g2 f4 g4. f8 f2 e8 d e2 f r4 f ~ \bar "" \break
		f g a4. bes8 c4 a2 bes4 c a4. g8 a f g2 f4 d2 e4 f4. g8 a4 f g a \bar "" \break
		f2 e4 \mark \default g a c4. bes8 a4 g f8 e f e e d16 c d2 c4 e f a4. g8 f4 e8 f g e f2 \bar "" \break
		f1 ~ f r4 f a a c2 g1 r1. \bar "" \break
		d'2. c4 c4. bes8 a4 g f2 e a1 g4 g e f g4. f16 e d2 \bar "" \break
		e4 \mark \default g2 a4. a8 a4 bes2 a4 f g4. g8 a2 r2. \mark \default d4. c8 bes4 a g f g ~ \bar "" \break
		g8 f f2 e4 f1 r r r4 \mark \default g a4. a8 a2 bes \bar "" \break
		a f g4 a d, d'4. c8 bes4 a g f g4. f8 f2 e8 d e2 f\breve \bar "|."
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
		\override NoteHead #'style = #'baroque
		c'2 d f4 f4. f8 f4 e2 d2. c4 d e f d c8 bes a g
		f4 f'2 e8 d e2 f4 d c a8 bes c a d4. c8 c4 d2 g, r c d 
		f4 f4. f8 f4 e2 d r4 c d e f e8 d c4 bes c1 a4 \mark \default bes2 c4
		d4. e8 f4 d e f d2 c4. d8 e4 f2 e4 f4. e8 d4 c8 bes a4 d c d c c
		f,2 g r4 c e f e d4. c8 c2 bes4 a g f4. g8 a2 r4 c d f ~
		f8 e d4 c2 d4 \mark \default bes d d f2 c1 es2. d4 d2. c4 bes a ~
		a g a2 r f1 g4 c c8 bes a g f4 f' e d4. c8 c2 \ficta b8 a b2
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
		\override NoteHead #'style = #'baroque
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
		\override NoteHead #'style = #'baroque
		\clef bass
		r1 r r r r
		r c2 d f4 f4. f8 f4 e2 d c d4 e f a g2 ~
		f4. e8 d2 c r1 r4 c d e f d c1 f,4 bes2 a4 
		bes g d'2 r1 r r2. bes2 c4 d4. e8 f4 d e f
		d2 c4. bes8 a2 r1 r r4 c4 d f4. e8 d4 c2 bes8 c d e
		f1 r2 bes,2 d4 d f2 f r g2. f4 f4. e8 d4 c
		bes2 a1 d c2 f1 g2 a g1
		c,4 c2 f4. f8 f4 bes,2 f' r2. d4 \ficta es f bes,1 r
		r4 bes bes c d d4. c8 bes4 a g f g d' es d bes c2 r4 f d4. d8 bes2
		f'2 f4 d \ficta es f bes, bes'4. a8 g4 fis g d e f bes, c1 f,\breve
	}
	\addlyrics {	
		Si -- tí -- vit á -- ni -- ma me -- a ad De -- um fon -- tem vi -- 
		_ _ vum, ad De -- um fon -- tem vi -- vum: quan -- do 
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
	\layout {
		indent = #0
		\context { 
\Voice 
\consists "Ambitus_engraver" 
} 
	}
	\midi {	}
}

