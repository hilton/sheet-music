% CPDL #
% Copyright ©2017 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "5"
\pointAndClickOff

#(set-global-staff-size 15.0)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 8\mm
	bottom-margin = 10\mm
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 4) )
	markup-system-spacing = #'( (padding . 4) )
	system-system-spacing = #'( (basic-distance . 15) (stretchability . 100) )
	ragged-bottom = ##f
	ragged-last-bottom = ##f
}

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		\center-column {
			"Christe qui lux es"
			\vspace #1
		}
	}
	composer = \markup \sans \column \right-align { "Johann Walter (1496–1570)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year \with-url #"http://hilton.org.uk" "Peter Hilton" -
				Lilypond source \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music -
				revision \revision
			}
      \line {
				Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License published at \with-url #"http://creativecommons.org/licenses/by-nc-sa/4.0/" "http://creativecommons.org/licenses/by-nc-sa/4.0/"
			}
		}
	}
	tagline = ##f
}

\layout {
	indent = #0
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
		\consists "Ambitus_engraver"
	}
}

global = {
	\key f \major
	\time 2/2
	\tempo 2 = 60
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
singleDigitTime = { \override Staff.TimeSignature.style = #'single-digit }

soprano = \new Voice	{
	\relative c'' {
		g2 g bes g f g a2. f4. g8 a2 f4 g2 f4 a4 ~ a8 g8 g4 a2 |
		g4 f d a'4. g8 g2 f4 | g1 ~ g2 r4 g g g bes4. c8 d2. c8 bes | a4. bes8 c4 d4. c8 bes a
		bes2 | c2. c4 bes g g f g1 \break r2 a f4 g a2 g r4 bes2 bes bes4 |
		
		bes2 f | bes a4 c4 ~ \break c bes8 a g2 | r4 f bes4. c8 | d2 c4 a | c2. a4 | a2 r | a
		c1 c2 | c\breve | a1 | g2 a4 c4. bes8 c4 g c | d2 d4 d |
		c2 e | f2 d4. c8 | bes1 | c2 a4 c4 | bes g2 f4 | g1 | r2 c | a
		
		d2 ~ d4 c4 bes bes | c2. c4 | a2 r4 a | bes2 bes c c | bes d c a4. bes8 |
		c4 bes2 a8 g fis4 g2 fis4 g\longa s1
  }
	\addlyrics {
		Chri -- ste __ _ qui __ _ lux es et __ _ _ di -- _ _ _ _ _ _ _ _ _ _ _ _ _ es, 
		lux es et di -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ es lux es et di -- es 
		noc -- tis te -- ne -- bras de -- _ te -- _ _ gis
		noc -- tis __ _ te -- ne -- bras de -- te -- gis
		lu -- cis -- que lu -- men __ _ cre -- _ _ _ _ _ _ _ de -- ris, __ _
		cre -- _ _ _ _ _ _ _ de -- _ ris
		lu -- men be -- _ a -- tum prae -- di -- cans,
		lu -- men be -- a -- tum prae -- _ _ _ _ _ _ _ _ _ _ di -- cans. __ _
	}
}

alto = \new Voice	{
	\relative c' {
		r\breve d2 d f d c d e f e d |
		e4 f2 e4 d2 d1 r4 d | d d e2 d4 g g g g1 a | g4. f8
		d4 g e c e4. f8 g4 g, a f c'2 r4 c a d2 c4 d bes a d d8 c bes a g1 r4 d'2
		
		d d bes4 c4. d8 | e4 f2 e4 | f2 r4 d a'2. f4 | g2 c,4 e f d c2 | c1
		r2 e | f g4 g4. f8 e d e2 | f1 | e2 e4. d8 | e f g4. f8 e4 | d1 |
		e d\breve c1 | r2 d | c1 | a2 a'2. g4 
		
		f e | d2 g2. f4 e2 | d r4 d4. c8 bes a g4 g'2 f8 e f2 | g f4. e8 c4 e d2 |
		r4 d bes c a2 r4 d bes g bes2 | c4 c2 c4 | bes1 d2. bes4 | bes1 \showBarLine \bar "|."
	}
	\addlyrics {
		Chri -- ste __ _ qui __ _ lux es et di -- _ _ _ _ _ es,
		lux es et di -- es, lux es et di -- _ _ _ _ _ _ _ _ _ _ _ _ _ es
		lux es et di -- _ _ _ _ _ _ _ _ es
		noc -- tis te -- ne -- bras __ _ _ de -- te -- gis
		noc -- tis te -- ne -- bras de -- _ _ te -- gis
		lu -- cis -- que lu -- _ _ _ _ men __ _ cre -- _ _ _ _ _ _ de -- _ _ ris,
		lu -- men be -- a -- _ _ _ tum prae -- _ di -- cans, 
		prae -- _ _ _ _ _ _ _ _ _ _ _ _ di -- cans, prae -- _ di -- cans
		lu -- men be -- a -- tum prae -- di -- cans, prae -- di -- cans.
	}
}

tenorA = \new Voice {
	\relative c' {
		\clef "treble_8"
		r\breve r r r r r1 d d f d
		c d e f2 e d1 r\breve
		f2 f f f c1 d f e d2 e\breve
		r2 r\breve r r2 e2 g1
		g2. g4 ~ g4 f8 e f2 g1 f d e f2 e d1
		r e f d c d e2 f
		e4 d2 c4 d\breve es1 d\breve s1
	}
	\addlyrics {
		Chri -- ste __ _ qui __
		_ lux es et di -- es,
		
		noc -- tis te -- ne -- bras de -- te -- _ _ gis
		lu -- cis
		et lu -- _ _ _ men cre -- _ _ de -- _ ris,
		
		lu -- men be -- _ a -- tum prae -- 
		_ _ _ di -- _ cans.
	}
}

tenorB = \new Voice {
	\relative c' {
		\clef "treble_8"
		r1 g2 g bes g f f4. g8 a2. bes4 g c a f g2 f8 g a bes
		c4 d bes c bes a8 g a2 g r4 bes bes bes c2 bes4 g g g bes4. c8 d2. c8 bes a2 bes4. c8
		d4 d, e f e c g'2 d r4 d e c f4. g8 a2 d,4 g2 f4 g2 r4 d' d4. c8 bes a g4
		
		f4. e8 d1 c2 ~ c g'2 d4 f g2 d r4 d e2. c4 f2 e r
		a c c4 c g c2 bes8 a g4 a g2 f2. f4 c1 r4 e g2. g4 g4. f8
		e4 c g'2 d f4. d8 d2 r4 d e2 c g' d4 f e4. d8 e2 d4 d'2 c4 d2
		
		d, g2. f4 e d c2 f4. g8 a4 a d,2 r4 d e2 c g' d4 f e c f d
		e f g g d2 r4 d d d g2 es4 c es4. f8 g2. f8 es d\breve
		
	}
	\addlyrics {
		Chri -- ste __ _ qui __ _ lux -- _ es et di -- _ _ _ _ _ _ _ _ 
		_ _ _ _ _ _ _ _ es lux es et di -- es, lux es et di -- _ _ _ _ _ _ _
		_ _ _ _ _ _ _ es, lux es et di -- _ _ _ _ _ es, noc -- tis __ _ _ _ te -- 
		
		ne -- _ _ bras de -- _ _ te -- gis de -- _ _ te -- gis,
		luc -- cis et lu -- men cre -- _ _ _ _ _ _ de -- ris, lu -- cis et lu -- _
		_ _ men cre -- _ de -- ris, et lu -- _ men be -- a -- _ _ _ tum prae -- di -- cans,
		
		prae -- _ _ _ _ _ _ _ _ di -- cans, lu -- men __ _ be -- a -- _ _ tum prae -- _
		_ _ _ di -- cans lu -- men -- be -- a -- _ tum prae -- _ _ di -- _ cans.
	}
}

bassA = \new Voice {
	\relative c' {
		\clef bass
		r\breve r r r r1 g g bes g f g
		a bes2 a g1 r\breve bes1 bes2 bes
		
		bes1 f g bes a g2 a1 a\breve
		r2 r\breve r2 a2 c1 c2. c2 bes8 a bes2
		c1 bes g a bes2 a g1 r a1
		
		bes1 g f g a bes a4 g2 f4
		g1 a g\longa s1
	}
	\addlyrics {
		Chri -- ste __ _ qui __ _ lux
		es et di -- es,
		noc -- tis te -- 
		
		ne -- bras de -- te -- _ _ _ gis,
		lu -- cis et lu -- _ _ _ 
		men cre -- _ _ de -- _ ris, lu -- 
		
		men be -- _ a -- tum prae -- _ _ _
		di -- _ cans.
	}
}

bassB = \new Voice {
	\relative c {
		\clef bass
		r\breve r1 d2 d f d c d e f |
		e4 d2 c4 | d1 | g,2 r4 g | g g c2 | g r4 g | g g g2 | d' r4 d | bes g
		bes2 a1 g2 r c c d a bes4 g d'2 g,1 r2 bes |
		
		bes bes bes f c'1 bes2 g4 g' f d f2 c a | d a1
		r2 | a c2 ~ c c2 c1 | f, r2 a | c4 c c2 | g1 |
		c1 d1 g,2 bes | a1 | r1 c2 c | d4 d a2 | d
		
		d4 c bes a g2 | c1 d2 d bes4 g4. a8 bes4 | a4. g8 a2 g bes c d |
		c4 d es es d2 d g, g c4 c c c | g\breve s1
	}
	\addlyrics {
	  Chri -- ste __ _ qui __ _ lux es et
		di -- _ _ _ es lux es et di -- es, lux es et di -- es, lux es et
		di -- _ es, lux es et di -- _ _ _ es, noc
		
		tis te ne -- bras de -- te -- gis de -- _ _ te -- gis de -- te -- gis,
		lu -- cis et lu -- men, lu -- cis et lu -- men,
		cre -- _ de -- _ ris, lu -- men cre -- de -- ris lu -- 
		
		_ _ _ _ men be -- a -- tum prae -- _ _ _ _ _ _ _ _ _ _ 
		_ _ _ di -- cans, lu -- men be -- a -- tum prae -- di -- cans.
	}
}

\score {
	\transpose c c {
		\new StaffGroup <<
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >>
			\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >>
			\new Staff << \global \tenorA \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" >>
			\new Staff << \global \tenorB \set Staff.instrumentName = #"T2" \set Staff.shortInstrumentName = #"T2" >>
			\new Staff << \global \bassA \set Staff.instrumentName = #"B1" \set Staff.shortInstrumentName = #"B1" >>
			\new Staff << \global \bassB \set Staff.instrumentName = #"B2" \set Staff.shortInstrumentName = #"B2" >>
		>>
	}
	\layout { }
%	\midi {	}
}
