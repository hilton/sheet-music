% Copyright ©2016 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "2"
\pointAndClickOff

#(set-global-staff-size 16.0)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 16 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 10\mm
	bottom-margin = 10\mm
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 4) )
	markup-system-spacing = #'( (padding . 4) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
 	ragged-bottom = ##f
	ragged-last-bottom = ##f
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		\center-column {
			"Donna, di dentro dalla tuo casa"
			\vspace #1
		}
	}
	composer = \markup \sans \column \right-align { "Heinrich Isaac (c. 1450 – 1517)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year \with-url #"http://hilton.org.uk" "Peter Hilton" -
				\with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/" "CC BY-NC-SA 3.0" -
				Lilypond source \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - 
				rev \revision 
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
	\key c \major
	\time 2/2
	\tempo 1 = 50
	\set Staff.midiInstrument = "acoustic guitar (nylon)"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
fictaParenthesized = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##t }
singleDigitTime = { \once \override Staff.TimeSignature.style = #'single-digit }

soprano = \new Voice	{
	\relative c'' {
		c1 a r2 a c c4 c c2. c4 c1 a
		r r2 d d2. c4 b2 a1 g2. \ficta fis8 e \ficta fis2 g\breve r1 r r
		r c2. b8 a g4. a8 b c \[ d2 c \] b4 c2 r4 c c c c c b4. a8 g4 f e a2 \ficta gis4 a1
		r r2 a d2. c4 b2. a4 g1 g r2 g' g2. f4 e2 d2.
		
		c4 c2. b8 a b2 c1 r \tuplet 3/2 { c1 c2 } \tuplet 3/2 { c1 a2 } \tuplet 3/2 { b2. a4 b2 } c1 r r
		r r c2 c c c c4 c c c c1 b1\fermata \showBarLine \bar "||" r1 r r
		r r r d2 d4 d g,2 g4 a b4. c8 b4 a2 g \ficta fis4 g\breve
		r1 r r r g'2 g4 g c,2. d4 e4. f8 e4 d4. c8 c2 b4 c1 \showBarLine \bar "|."
	}
	\addlyrics {
		Don -- na, di den -- tro dal -- la tuo ca -- sa
		son ro -- se, gi -- "gli e" fio -- _ _ _ ri,
		e __ _ _ fio -- _ _ _ _ _ _ ri. Tut -- "to ho" -- mo che l’an -- na -- _ _ _ _ _ _ sa
		ne sen -- te ghu -- "sto al" co -- re. For -- tu -- na d’un gran
		
		__ _ tem -- _ _ _ po, dam -- mi u -- na ro -- _ _ sa,
		to te la o per -- la pre -- ti -- o -- sa.
	}
}

alto = \new Voice {
	\relative c' {
		
	}
	\addlyrics {
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		r1 r r r r r r
		r2 d d2. c4 b2 a g r4 a b4. a8 b4 c a4. g8 a2 g\breve r1 r r 
		r r2 g' g2. f4 e2 d c c r e e2. d4 c2 b a a
		r d d2. c4 b2 a g g r1 r2 g' g2. f4 e2 d c r4 d
		
		e4. d8 e4 \ficta fis d4. c8 d2 c1 r2 d e2. d4 e2 f d4. c8 d2 c1 r r
		r r a2 a4 a a2. b4 c4. b8 a4. g8 a1 g1\fermata r1 r r
		r r d'2 d4 d g,2 g4 a b4. c8 b4. a8 g4 d'2 c4 d c8 b a2 g\breve
		r1 r r g'2 g4 g c,2 c4 d e4. f8 e4. d8 c4 g'2 f4 g e d2 c1
	}
	\addlyrics {
		For -- tu -- na d’un gran tempo mi se’ __ _ _ _ sta -- _ _ ta,
		for -- tu -- na d’un gran tem -- po, for -- tu -- na d’un gran tem -- po,
		for -- tu -- na d’un gran tem -- po, for -- tu -- na d’un gran tempo mi
		
		se’ __ _ _ _ sta -- _ _ ta, gran tem -- po mi se’ sta -- _ _ ta,
		o glo -- ri -- o -- sa, don -- na mi -- a bel -- la.
	}
}


bass = \new Voice {
	\relative c' {
		\clef bass
		r1 c2 c4 c f,2 f4 g a4. \ficta bes8 a4. g8 f2 f c' c4 c f,1
		a2 a4 a d,1 r2 d g f4 f g2 e d d r g g2. f4 e2 d c r4 d e4. d8 e4 f
		d4. c8 d2 c1. r2 g' g4 g c,2 c4 c c c c4. d8 e2 e r e a a4 a
		d,2 d4 e f4. g8 f4. e8 d2 d g g4 g c,2 c4 d e4. f8 e4. d8 c2 c r g' c bes4 \ficta bes
		
		c2 a g1 c,2 r g'2 g4 g c,1 r g'2 g4 g c,2 c4 d e4. f8 e4. d8 c4 g'2 f4
		g4 f8 e d2 c1 r2 c' c c a2. b4 c d2 c4 d1\fermata d2 d4 d g,2 g4 a b4. c8 b4. a8
		g4 d'2 c4 d c8 b a2 g1 r g2 e4. \ficta fis8 g2. a4 f g d2 g g4 g c,2 c4 d
		e4. f8 e4. d8 c4 g'2 f4 g f8 e d2 c1 ~ c\breve c'2. d4 g, c g2 c,1
	}
	\addlyrics {
		Dam -- me -- "ne un" po -- cho di quel -- la ma -- za cro -- cha, dam -- me -- "ne un" pocho,
		dam -- me -- "ne un" pocho et non __ _ me ne dar trop -- pa. For -- tu -- na d’un gran tempo mi se’ __ _ _ _
		sta -- _ _ ta. Dam -- me -- "ne un" po -- cho et non me ne dar trop -- pa et dam -- me -- "ne un"
		po -- cho di quel -- la ma -- za cro -- cha, dam -- me -- "ne un" po -- cho di quel -- la ma -- za cro -- cha et non __ _ me 
		
		ne dar trop -- pa. Dam -- me -- "ne un" pocho, dam -- me -- "ne un" po -- cho di quel -- la ma -- za cro -- _ _ 
		_ _ _ _ cha et non me ne dar trop -- _ _ pa.
	}
}

\score {
	\transpose c a, {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 5)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >> 
%			\new Staff << \global \alto \set Staff.instrumentName = #"CT" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >> 
			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\layout { }
%	\midi {	}
}
