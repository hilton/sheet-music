% CPDL #
% Copyright ©2018 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "1"

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
	ragged-last-bottom = ##t
}

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		\center-column {
			"Stabat Mater"
			\vspace #1
		}
	}
	composer = \markup \sans \column \right-align { "G.P. da Palestrina" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year \with-url #"http://hilton.org.uk" "Peter Hilton" -
				\with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/" "CC BY-NC-SA 3.0" -
				\with-url #"https://www.cpdl.org/wiki/index.php/Stabat_Mater_(Giovanni_Pierluigi_da_Palestrina)" "CPDL #" -
				Lilypond source at \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - 
				revision \revision 
			}
			\line {
				Lilypond source \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music
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
%		\override BarNumber #'break-visibility = #'#(#f #t #t)
		\override BarLine #'transparent = ##t
		\remove "Metronome_mark_engraver"
		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 10) (stretchability . 100))
	}
	\context {
		\StaffGroup
		\remove "Span_bar_engraver"
	}
	\context {
		\Staff
		\consists "Custos_engraver"
	}
	\context {
		\Voice
		\override NoteHead #'style = #'baroque
		\consists "Horizontal_bracket_engraver"
		\remove "Forbid_line_break_engraver"
	}
}

global = { 
 	\key c \major
	\time 2/1
	\tempo 2 = 44
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }

sopranoA = \new Voice {
	\relative c'' {
	  a1 b \[ c c2 \] \[ c1 c2 \] bes1 a r r\breve r r1 r2 e'1
	  d2 c b1 a1 \ficta gis2 a1 r r\breve r r r r
	  r r r r r
	}
	\addlyrics {
	  Sta -- bat Mat -- ter do -- lo -- ro -- sa
	  dum pen -- de -- bat Fi -- li -- us,
	}
}

sopranoB = \new Voice {
	\relative c'' {
	  r\breve r r r1 a b \[c c2 c1 c2\] bes1 a
	  r\breve r r2 cis1 cis2 d2. d4 f2 e d\breve c\breve. r2 f1 e2 d c
	  d d bes1 a2 c d e1 f e4 d \ficta cis2 d1 \ficta cis2 d1 r
	}
	\addlyrics {
	  Jux -- ta cru -- cem la -- cry -- mo -- sa,
	  cu -- jus a -- ni -- mam ge -- men -- tem,
	  con -- tri -- sta -- tam et do -- len -- tem per tran -- si -- vit gla -- di -- us.
	}
}

altoA = \new Voice {
	\relative c' {
	  e1 g \[a a2\] \[g1 a2\] g1 e r r\breve r r1 r2 a1 a2 a g g f e\breve r1 r\breve r r r r
	  r r r r r
	}
	\addlyrics {
	  Sta -- bat Mat -- ter do -- lo -- ro -- sa
	  dum pen -- de -- bat Fi -- li -- us,
	}
}

altoB = \new Voice {
	\relative c' {
	  r\breve r r r1 e g \[a a2 g1 a2\] g1 e
	  r\breve r r2 a1 a2 a2. a4 a2 a bes\breve a2 f1 e2 a g a a a1 d,2 a'
	  g4 f f1 e2 f a1 b2 c4 b a g f2 g a1 a a r
	}
	\addlyrics {
	  Jux -- ta cru -- cem la -- cry -- mo -- sa,
	  cu -- jus a -- ni -- mam ge -- men -- tem,
	  con -- tri -- sta -- tam et do -- len -- tem,
	  et do -- len -- tem per tran -- si -- vit gla -- di -- us.
	}
}

tenorA = \new Voice {
	\relative c' {
		\clef "treble_8"
		cis1 d \[f f2\] \[e1 f2\] d1. cis2 r1 r\breve r r1 r2 e1
		f2 e e d2. c4 b2 b a1 r r\breve r r r r
	  r r r r r
	}
	\addlyrics {
	  Sta -- bat Mat -- ter do -- lo -- ro -- sa
	  dum pen -- de -- bat Fi -- _ _ li -- us,
	}
}

tenorB = \new Voice {
	\relative c' {
		\clef "treble_8"
	  r\breve r r r1 cis d \[f f2 e1 f2\] d1. cis2
	  r\breve r r2 e1 e2 f2. f4 d2 e f\breve f2 a1 g2 f e f2. e4 d2 e f2. e4
	  d1 g c, r c d e2 f e e fis1 r
	}
	\addlyrics {
	  Jux -- ta cru -- cem la -- cry -- mo -- sa,
	  cu -- jus a -- ni -- mam ge -- men -- tem,
	  con -- tri -- sta -- tam et __ _ _ do -- len -- _ tem per tran -- si -- vit gla -- di -- us.
	}
}

bassA = \new Voice {
	\relative c' {
		\clef bass
		a1 g \[f f2\] \[c'1 f,2\] g1 a r r\breve r r1 r2 a1 
		d,2 a' e g d e1 a r r\breve r r r r 
	  r r r r r
	}
	\addlyrics {
	  Sta -- bat Mat -- ter do -- lo -- ro -- sa
	  dum pen -- de -- bat Fi -- li -- us, __ _
	}
}

bassB = \new Voice {
	\relative c' {
		\clef bass
	  r\breve r r r1 a g \[f f2 c'1 f,2\] g1 a
	  r\breve r r2 a1 a2 d2. d4 d2 c bes\breve f1 c' r d1. c2 bes a
	  \ficta bes2 \ficta bes g1 f2 f1 g2 a1 \ficta bes a a d, r
	}
	\addlyrics {
	  Jux -- ta cru -- cem la -- cry -- mo -- sa,
	  cu -- jus a -- ni -- mam ge -- men -- tem,
	  con -- tri -- sta -- tam et do -- len -- tem per tran -- si -- vit gla -- di -- us.
	}
}


\score {
	\transpose c a, {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 9 10)
%			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \sopranoA \set Staff.instrumentName = #"S1" \set Staff.shortInstrumentName = #"S1" >> 
			\new Staff << \global \sopranoB \set Staff.instrumentName = #"S2" \set Staff.shortInstrumentName = #"S2" >> 
			\new Staff << \global \altoA \set Staff.instrumentName = #"A1" \set Staff.shortInstrumentName = #"A1" >> 
			\new Staff << \global \altoB \set Staff.instrumentName = #"A2" \set Staff.shortInstrumentName = #"A2" >> 
			\new Staff << \global \tenorA \set Staff.instrumentName = #"T1" \set Staff.shortInstrumentName = #"T1" >> 
			\new Staff << \global \tenorB \set Staff.instrumentName = #"T2" \set Staff.shortInstrumentName = #"T2" >> 
			\new Staff << \global \bassA \set Staff.instrumentName = #"B1" \set Staff.shortInstrumentName = #"B1" >> 
			\new Staff << \global \bassB \set Staff.instrumentName = #"B2" \set Staff.shortInstrumentName = #"B2" >> 
		>> 
	}
	\header {
	}
	\layout { }
%	\midi {	}
}
