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
%	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##f
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		\center-column {
			"Qui condolens interitu"
			\vspace #1
		}
	}
	composer = \markup \sans \column \right-align { "Constanzo Festa (1490 - 1545)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year \with-url #"http://hilton.org.uk" "Peter Hilton" -
				\with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/" "CC BY-NC-SA 3.0" -
				Lilypond source \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - 
				Translation "Silvia Reseghetti -
				rev \revision 
			}
		}
	}
	tagline = \markup { 
		\vspace #2
		\column {
			\line { You, grieving that the world should perish of destructive death, saved the weak humanity giving a remedy to the guilty. }
		}
	}
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
%		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 10) (stretchability . 100))
	}
	\context { 
		\Staff
		\remove "Time_signature_engraver"
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
	\time 3/2
	\tempo 2 = 40
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
fictaParenthesized = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##t }

soprano = \new Voice	{
	\relative c' {
		r1. r e2. d8 c d2 c e g
		e4. d16 e f4 e4. c8 c'2 b a4 g f e a2 g4. f16 e f e d c b4 c2 b4 c1
		r4 e a a g e4. f8 g4. c,8 c'4 \ficta bes a \ficta bes a2 g4 a2 r4 g f2
		
		d4 e d e a, a'4. g8 f4. e8 d c b4 c b c2 b8 a c4 b r e f d e2 |
		d4 a' b a d2 c1. r4 c, e e f8 e d c e2 r4 c e e |
		g2 r4 g a b c c, e e g8 f e d c2 r4 f a a |
		c c, e e g2 a4 c4. b8 a g a4 a g1. \showBarLine \bar "|."
	}
	\addlyrics {
		Qui __ _ _ _ cón -- do -- _ _ _ _ _ lens in -- té -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ri -- tu 
		mor -- tis pe -- ri -- _ _ re sæ -- cu -- _ _ _ _ _ lum
		sal -- vá -- _ _ _ sti mun -- dum __ _ _ _ _ _ _ lan -- _ gui -- _ _ _ dum,
		sal -- vá -- sti mun -- dum lan -- _ _ gui -- dum
		do -- nans re -- _ _ _ _ is, do -- nans re -- is, do -- nans re -- is, 
		do -- nans re -- _ _ _ _ is, do -- nans re -- is, do -- nans re -- is re -- me -- _ _ _ _ di -- um.
	}
}

alto = \new Voice {
	\relative c' {
		b2. a8 g a2 g4. a8 b g c2 b4 c4. a16 g g4 a2 g4 a8 b c a b4 c2 b4
		c1 r4 c e d2 c4 b8 c d b c4. d8 e4 c d2 r d e1
		c2 d b e e d r d c1 a2
		
		b1 c4. b8 c4 d4. c8 b a g1 a2 g4. a8 b g c2 b4 c4. b8 |
		a4 d,8 e f g a2 g4 a2 r4 e a a c4. b16 a g4 c2 b4 c2 c, r |
		r4 g' b b d2 e c b a4 f a a c2.
		b8 a g2 e'4. d8 c b a4. b8 c2 a4 c b b1 |
		
	}
	\addlyrics {
		Qui __ _ _ _ cón -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ do -- lens 
		in -- té -- _ _ _ _ _ _ _ _ _ ri -- tu 
		mor -- tis pe -- ri -- re sæ -- cu -- lum
		sal -- vá -- sti mun -- _ _ _ dum __ _ _ _ _ lan -- gui -- _ _ _ _ _ dum, __ _ _ 
		lan -- _ _ _ _ gui -- dum
		do -- nans re -- _ _ _ _ _ _ is, __ _ do -- nans re -- is re -- me -- di -- um,
		do -- nans re -- _ _ _ is re -- _ _ _ me -- _ _ _ _ di -- um.
	}
}

tenor = \new Voice {
	\relative c {
		\clef "treble_8"
		r1. r r e2. d8 c d2
		c1 e2 g1 g2 a1 a2 g r g
		a1 f2 g1 e2 f1 d2 e1 r2
		
		r1. r r r1 g2 |
		f1 d2 e1 f2 e1 d2 c r c |
		e1 f2 g1 e2 f1 f2 |
		e\longa s2
	}
	\addlyrics {
		Qui __ _ _ _ cón -- do -- lens in -- té -- ri -- tu 
		mor -- tis pe -- ri -- re sæ -- cu -- lum
		sal -- vá -- sti mun -- dum lan -- gui -- dum
		do -- nans re -- is re -- me -- di -- um.
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
		r1. e2. d8 c d2 c2. b8 a b4 b a2 r g
		a1 a2 g1 r2 r1 d'2 e4 c g'2 c,
		r2 r d2 e1 c2 d2. c4 \ficta bes \ficta bes a4. \ficta b!8 c d e c d2 |
		
		g,2 g' f1 d2 e1 f2 e2. d8 c d4 d c2 |
		d1 b2 a1 r4 f a a c2 g r4 c e e g2 |
		c,4 g'2 f8 e d4 d c1 r2 r1 r4 f, |
		a a c2. b4 a1 a2 e1. |
	}
	\addlyrics {
		Qui __ _ _ _ cón -- _ _ _ do -- lens in -- té -- ri -- tu 
		mor -- tis pe -- ri -- re, mor -- tis pe -- ri -- re sæ -- cu -- lum __ _ _ _ _ _ _ _
		sal -- vá -- sti mun -- dum lan -- _ _ _ gui -- dum, lan -- gui -- dum
		do -- nans re -- is, __ _ do -- nans re -- is re -- me -- _ _ _ di -- um,
		do -- nans re -- is re -- me -- di -- um.
	}
}

\score {
	\transpose c es {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 12)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >> 
			\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >> 
			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\layout { }
%	\midi {	}
}
