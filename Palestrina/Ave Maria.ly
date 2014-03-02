% CPDL #31404
% Copyright ©2014 Peter Hilton - https://github.com/hilton

\version "2.18.0"
revision = "2"
\pointAndClickOff

#(set-global-staff-size 15) 

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 16 20)))
	annotate-spacing = ##f
	two-sided = ##t
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 4) )
	markup-system-spacing = #'( (padding . 6) )
	system-system-spacing = #'( (padding . 1) (basic-distance . 20) (stretchability . 100) )
	indent = 0
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		"Ave Maria"
	}
	composer = \markup \sans \column \right-align { "Giovanni Pierluigi da Palestrina (1525-1594)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				This edition copyright \year Peter Hilton - 
				Lilypond source at \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - 
				revision \revision 
			}
			\line {
				Licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License - \with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/" http://creativecommons.org/licenses/by-nc-sa/3.0/
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
	\tempo 4 = 100
	\set Score.timing = ##f 
%	\override Score.LyricText #'font-size = #-1
	\set Staff.midiInstrument = "Harpsichord"
	#(set-accidental-style 'forget)
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t }
fictaParenthesized = { \ficta \override AccidentalSuggestion #'parenthesized = ##t }

cantus = \new Voice {
	\relative c'' {
		bes2 f g d'2. c4 bes4. a16 g bes8 c d4. c8 c2 bes8 a bes4 a8 g 
		f4 f'2 f4 d1 \bar "" \break bes4. c8 d4. c16 d \ficta es2 d d1 ~ d
		r2 r4 bes2 a4 g2 f f \bar "" \break r4 bes2 a4 g2 a a r1 
		r4 d2 c bes a4. g8 g2 f4 g2 ~ \bar "" \break g g' g4 g \ficta e!2 
		c r1 r4 c2 c4 d2 c4. d8 e f g4. f8 f4. e16 d e4 \bar "" \break c2 r
		r4 c d2. c4 bes a g g'2 f e4 d4. c16 bes a2 bes4 c d2 r4 c4
		\bar "" \break c bes a g f f' f e d2. d4 d1 r r4 c d bes
		c d4. c16 bes c4 \bar "" \break d2 r2 r1 d2. d4 d d d2 d g2. 
		f4 es2 d r2 \bar "" \break r r4 d2 c4 d2 bes a1 r1
		r4 a a g a bes c4. bes8 c a \ficta bes!4 \bar "" \break a4. g8 f e d4 r1 r4 d'2 
			\ficta cis4
		d2 bes a1 r c2 d4 c \bar "" \break d2 e r4 g g g g2 d r1 f4. e8 d4 c d e4. d8 d2 c4 d2 \bar "" \break r4 d d d
		d2 c4 a bes c d c8 bes a2 g r1 r2 r4 a bes c d2
		\bar "" \break d4 bes bes bes bes2 a4 c f4. e8 d4 e d1 d\breve \showBarLine \bar "|."
	}
	\addlyrics {
		A -- ve Ma -- ri -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		a, a -- ve Ma -- ri -- _ _ _ _ _ _ a, __
		gra -- ti -- a ple -- na, "[gra" -- ti -- a ple -- na,]
		Do -- mi -- nus te -- _ _ _ cum, "[Do" -- mi -- nus te -- 
		cum: be -- ne -- di -- _ _ _ _ _ _ _ _ _ cta tu
		in mu -- li -- e -- ri -- bus, "[in" mu -- li -- e -- _ _ _ _ ri -- bus,] in
		mu -- li -- e -- ri -- bus "[in" mu -- li -- e -- ri -- bus,] et be -- ne -- 
		di -- _ _ _ _ _ fru -- ctus ven -- tris tu -- i Je -- _ _ sus. San -- cta Ma -- ri -- a
		re -- gi -- na cœ -- _ _ _ _ _ _ li, __ _ _ _ _ dul -- cis
		et pi -- a, o ma -- ter De -- i, o -- ra pro
		no -- bis pec -- _ _ ca -- to -- _ _ _ ri -- bus, ut cum e -- 
		le -- ctis te vi -- de -- a -- _ _ _ mus, te vi -- de -- a -- 
		mus, ut cum e -- le -- ctis te vi -- _ _ de -- a -- mus.
	}
}

quintus = \new Voice {
	\relative c'' {
		r1 r2 bes f g d'( \ficta es) d1
		d4. c8 a bes c4 bes2 a g4. a8 bes c d4. c8 c2( bes) a8 g a2 g4 bes a f
		g a bes2 r1 r4 d2 c4 bes2 c1 d2 r2 r4 d2 
		c4 bes2 a4 a r d2 c4 bes2 a g r4 d' e e d2 g, 
		r4 c2 c4 d2 c4. d8 e f g4. f8 f4. e16 d e4 c4. bes8 a4 bes c2 r4 a a bes2
		a4 bes2 r4 c d2. c4 bes a g g'2 f e4 d c4. \ficta b16 a 
			\ficta b4 c2
		r2 c bes4 a f8 g a2( g) \ficta fis4 g2 r1 d'2 c4 a bes2
		a4. bes8 g2( a) r2 r1 r4 bes2 a4 g f bes a bes4. c8 d2
		\ficta es4. d16 c bes2. d2 c4 d2 bes a1 r2 r1 
		r c2 d4 c d2 \ficta e! r2 r r4 d2 \ficta cis4 d2 bes a1
		r2 r1 r r4 a a g a bes c c c c c2
		bes4 bes2 f4 g a g2 r4 a2 a4 bes8 a a2 g4 a2 bes bes4 bes bes2
		a1 r1 r2 r4 d d d d2 c4 a bes c bes a8 g a2
		bes4 d d d f2 f4. e8 d4 c bes a2 g4. \set suggestAccidentals = ##t fis16 e fis4 g\breve
		
	}
	\addlyrics {
		A -- ve Ma -- ri -- a,
		"[a" -- _ _ _ _ _ _ ve Ma -- ri -- _ _ _ _ _ _ _ a,] gra -- ti -- a
		ple -- _ na, gra -- ti -- a ple -- na, Do -- 
		mi -- nus te -- cus, "[Do" -- mi -- nus te -- cum,] "[Do" -- mi -- nus te -- cum:]
		be -- ne -- di -- _ _ _ _ _ _ _ _ _ cta tu, __ _ _ _ _ "[be" -- ne -- di -- 
		cta tu] in mu -- li -- e -- ri -- bus, "[in" mu -- li -- e -- ri -- _ _ _ bus,]
		in mu -- li -- e -- _ _ ri -- bus, et be -- be -- di -- 
		ctus __ _ _ fru -- ctus ven -- tris tu -- i Je -- _ _
		sus. __ _ _ _ San -- cta Ma -- ri -- a, __
		re -- gi -- na cœ -- li, dul -- cis et pi -- a
		o ma -- ter De -- _ i, o -- ra pro no -- 
		bis pec -- ca -- to -- ri -- bus, pec -- ca -- to -- _ _ ri -- bus, ut cum e -- le -- 
		ctis, ut cum e -- le -- ctis te vi -- de -- a -- _ _ _
		mus, ut cum e -- le -- ctis __ _ _ te vi -- de -- a -- _ _ _ mus.
	}
}

altus = \new Voice {
	\relative c' {
		r1 r r2 es bes c g'2. f8 e
		d c d e f g a4. g8 g2 f4 g2 f es4 c d4. c8 bes g g'2 f4 g2 d
		bes4 c d e f2 r r4 bes2 a4 g2 f4. \ficta es16 d es2 d r4 a'4 g f 
		e2 d r4 a'2 g4 f2 g d4. c8 bes4 \ficta es d d c8 d e c d2 c4 g'2
		g4 a2 f4. g8 a bes a2 g4 a bes g2 r4 e f2 g a f1 
		r4 f bes a g f e2( d) r4 g bes a d, e f2 r4 g f e
		f g c,2 r4 f d e f g a2 bes a4 f g a4. g16 f g4 a2 g
		f4 d \ficta es2 d4 a'2 a4 g f bes a r g2 f4 bes a g \fictaParenthesized fis? g2. a4
		bes4. a8 g2 f1 r r4 e fis fis g2 e f g4 f
		g2 a4 f f e f g c,4. d8 e f g4 e a2 g4 a2 f g r4 e
		fis fis g2 e f g4 f g2 a4 f f e f g c, g' g g g2.
		g4 f8 e d c bes4 a bes g a d4. e8 f2 e4 f d e2 r4 g4 g g g2
		f4 d e f g a4. g8 g2 f4 g bes bes bes a2 a4 c bes a4. g8 g2 f4
		g f f f f1 f2. e4 fis g a2 b\breve
		
	}
	\addlyrics {
		A -- ve Ma -- ri -- _ _
		_ _ _ _ _ _ _ _ _ _ a, "[a" -- ve Ma -- ri -- _ _ _ _ _ a,] gra -- 
		ti -- a ple -- _ na, gra -- ti -- a ple -- _ _ _ na, Do -- mi -- nus
		te -- cum, "[Do" -- mi -- nus te -- cum,] __ _ _ "[Do" -- mi -- nus te -- _ _ _ _ cum:] be -- 
		ne -- di -- _ _ _ _ _ _ _ cta tu, "[be" -- ne -- di -- cta tu] __
		in mu -- li -- e -- ri -- bus, __ "[in" mu -- li -- e -- ri -- bus,] in mu -- li -- 
		e -- ri -- bus, "[in" mu -- li -- e -- ri -- bus,] et be -- ne -- di -- _ _ _ _ _ ctus,
		"[be" -- ne -- di -- ctus] fru -- ctus ven -- tris tu -- i, "[fru" -- ctus ven -- tris tu -- i] Je -- _
		_ _ _ sus. San -- cta Ma -- ri -- a, re -- gi -- na
		cœ -- li, re -- gi -- na cœ -- _ _ _ _ _ _ li, dul -- cis et pi -- a, "[dul" -- 
		cis et pi -- a,] o ma -- ter De -- i, o ma -- ter De -- _ i, o -- ra pro no -- 
		bis pec -- _ _ _ _ _ca -- to -- ri -- bus, pec -- _ _ ca -- to -- ri -- bus, ut cum e -- le -- 
		ctis te vi -- de -- a -- _ _ _ _ mus, "[ut" cum e -- le -- ctis te vi -- de -- _ a -- _
		mus,] ut cum e -- le -- ctis te vi -- de -- a -- mus.		
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		r1 r r r r
		bes2 f g d'( es) d g g4. f16 \ficta es d1 d2 r4 d2
		c4 bes2 c1 d2 r2 r1 r4 g2 f8 e f4 e d2 
		g1 f2 r2 r1 r4 d2 c4 \ficta b!2 c g r4 c
		e2 f bes,8 c d e f4. e16 d c8 d e4 d bes c2 r1 r4 c4 ~ c c d2
		c bes r1 r c2 d2. c4 bes a g2 r2
		r r4 c4 d2. c4 bes2 a g4 g' f d e4. f8 d2 e
		r2 r1 r4 f2 e4 d c d d bes4. c8 d4. c8 bes g d'4 g, d'4. c8 bes a bes4 a
		g1 bes2 r4 f' f f g4. f8 e2( d) g,( a) r4 d d c
		d e f2 r1 r2 r4 d4 ~ d \ficta cis4 d2 e d r4 d f e
		d2 g,2\( a\) r4 d d c d e f2 r2 r r4 e e e e2
		d2. f4 e d2 c4 d2 f4. e8 d4 c d bes a2 g8 a bes c d2 r
		r1 r r4 d d d g2 f4 d e f g f8 e d4 g, r d'
		d d d1 c4 a bes c d c8 bes a4 bes a2 g\breve
	}
	\addlyrics {
		A -- ve Ma -- ri -- a, Ma -- ri -- _ _ _ a, gra -- 
		ti -- a ple -- na, Do -- _ _ _ mi -- nus
		tu -- cum, Do -- mi -- nus te -- cum: be -- 
		ne -- di -- _ _ _ _ _ _ _ _ _ _ _ cta tu, be -- ne -- di -- 
		cta tu in mu -- li -- e -- ri -- bus,
		"[in" mu -- li -- e -- ri -- bus,] et be -- ne -- di -- _ _ ctus
		fru -- ctus ven -- tris tu -- i, Je -- _ _ _ _ _ _ _ _ _ _ _ _ _
		_ sus. San -- cta Ma -- ri -- _ _ a,_ re -- gi -- na
		cœ -- _ li, dul -- cis et pi -- a, "[dul" -- cis et
		pi -- _ a,] o ma -- ter De -- _ i, o -- ra pro no -- 
		bis pec -- ca -- to -- ri -- bus, pec -- _ _ ca -- to -- ri -- bus, __ _ _ _ _ _
		ut cum e -- le -- ctis te vi -- de -- a -- _ _ _ mus, ut
		cum, e -- le -- ctis te vi -- de -- a -- _ _ _ _ _ mus.
	}
}

bassus = \new Voice {
	\relative c {
		\clef bass
		r1 r r r r
		r r es2 bes c g'2. f8 \ficta es d2 g r4 bes2
		a4 g2 f4. \ficta  es16 d es2 bes8 c d \ficta es f2( g) r1 r4 d'2 c4 bes2
		c g r1 r d2 g4 c, g'2 c,4 c'4. \ficta b16 a \ficta b4 c1 
		r2 r1 r r4 c2 c4 d2 c4. bes8 a g f e d c bes4
		f'2( bes,) r1 r r r r4 g'4 a2 ~
		a4 g f e d1 ~ d r2 d' c4 a bes2 a r2
		r1 r4 d2 c4 bes a g \ficta fis g2 d r1 g2. f4
		es1 bes4 bes'2 a4 bes2 g a r r4 d4 d cis d4. c8 bes4 a
		bes c f,2 r1 r4 a2 g4 a2 bes a bes g4 g a2
		d, r4 d' d cis d4. \ficta c!8 bes4 a bes c f,2 r2 r r4 c' c c c2
		d2 bes4. a8 g4 fis g es d2 r1 r r4 g g g g8 a bes c
		d2 a r4 a bes c d2 g,4 g g g d2 a' r4 f4 g es d2
		g4 bes bes bes bes,8 c d e f2 bes,4 a bes c d1 g\breve
	}
	\addlyrics {
		A -- ve Ma -- ri -- _ _ _ a, gra -- 
		ti -- a ple -- _ _ _ na __ _ _ _ _ Do -- mi -- nus
		te -- cum, Do -- mi -- nus te -- cum, te -- _ _ _ cum:
		be -- ne -- di -- _ _ _ _ _ _ _ _ cta
		tu __ in mu -- 
		li -- e -- ri -- bus, __ et be -- ne -- di -- ctus
		fru -- ctus ven -- tris tu -- i Je -- sus, Je -- _
		_ sus. San -- cta Ma -- ri -- a, re -- gi -- na cœ -- _ _ _
		_ _ li, dul -- cis et pi -- a, "[dul" -- cis et pi -- 
		a,] o ma -- ter De -- _ _ _ _ _ i, o -- ra pro no -- 
		bis pec -- _ _ ca -- to -- ri -- bus, ut cum e -- le -- _ _ _ 
		_ ctis te vi -- de -- a -- mus, ut cum e -- le -- ctis te vi -- de -- a -- 
		mus, ut cum e -- le -- _ _ _ _ ctis te vi -- de -- a -- mus.
	}
}

\score {
	\transpose c a, {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 16)
			\new Staff << \global \cantus >> 
			\new Staff << \global \quintus >> 
			\new Staff << \global \altus >> 
			\new Staff << \global \tenor >> 
			\new Staff << \global \bassus >> 
		>> 
	}
	\layout { }
	\midi {	}
}
