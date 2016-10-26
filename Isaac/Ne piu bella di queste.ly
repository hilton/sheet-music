% Copyright ©2016 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "1"
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
	system-system-spacing = #'( (basic-distance . 20) (padding . 8) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		\center-column {
			"Ne piu bella di queste"
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
		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 10) (padding . 8) (stretchability . 100))
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
	\tempo 1 = 50
	\set Staff.midiInstrument = "acoustic guitar (nylon)"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
fictaParenthesized = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##t }
singleDigitTime = { \once \override Staff.TimeSignature.style = #'single-digit }

soprano = \new Voice	{
	\relative c' {
		\repeat unfold 2 {
			f1 f2 f g g a1 g c c2 bes1 a2. g8 f g2 a1 r2 a
			a a bes2. a4 g2 f e1 \showBarLine \bar "|"
		}
		r1 r r r a2 a4 a bes2 a4 g2 f e4
		f1 \fermata r r r r g2 g4 g a2 g4 a g c2 \ficta b4 c1 \fermata \showBarLine \bar "|" 
		\singleDigitTime \time 3/2 \tempo 1. = 50 a2 a a
		bes1 bes2 a1 a2 g \[ f g a \] f1 e1 r2 \showBarLine \bar "|" 
		\time 2/2 \tempo 1 = 50 e2 e4 e d2 d c4. d8 e4 f g bes! a g2 f e4 f1 \showBarLine \bar "|."
	}
	\addlyrics {
		Ne piu bel -- la di que -- ste ne piu de -- _ _ _ _ gnia
		Si trou -- "va al" -- cu -- "na i" -- de -- _ a,
		Ju non ve -- de -- te che nel ciel su re -- _ _ _ _ gnia.
		Ve -- de -- te Ci -- the -- re -- _ a,
		Ve -- de -- te qui Mi -- ner -- _ _ ua,
		El Mar -- ti -- al fu -- _ ro -- _ _ re,
		Dom -- ma coll’ A -- re -- "te et" col -- la Sa -- pien -- _ _ za,
		Ve -- nu -- "ti in" -- sie -- "me ad" a -- _ _ bi -- tar __ _ Fio -- ren -- _ _ za.
	}
}

alto = \new Voice {
	\relative c' {
		\repeat unfold 2 {
			f1 c2 d e e f1 e c c2 d2. g,4 c2 bes1 a r2 c
			c c d2. c4 bes2 a g1
		}
		r1 r r r c2 c4 c d2 c4 bes a bes g2
		f r c' c4 c d2 c4. d8 e4 f2 e4 f2 r e e4 e f2 e4 f e c d2 c1 \singleDigitTime c2 c c
		d1 bes2 c1 d2 e d2. c4 c1 \ficta b2 c1 r2 c c4 c bes2 bes a4 c2 bes8 a g2 f4 e f2 g f1
	}
	\addlyrics {
		Ne piu bel -- la di que -- ste ne piu de -- _ _ _ gnia
		Si trou -- "va al" -- cu -- "na i" -- de -- _ a,
		Ju non ve -- de -- te che nel ciel su re -- _ _ _ gnia.
		Ve -- de -- te Ci -- the -- re -- _ a,
		Ve -- de -- te qui Mi -- _ ner -- _ _ ua,
		Che gl’in -- ge -- gni con -- _ ser -- _ _ ua,
		El Mar -- ti -- al fu -- _ ro -- _ _ re,
		Dom -- ma coll’ A -- re -- "te et" col -- la Sa -- _ pien -- _ za,
		Ve -- nu -- "ti in" -- sie -- "me ad" a -- _ bi -- _ tar Fio -- _ ren -- _ za.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		\repeat unfold 2 {
			c1 a2. bes4 c2 c c1 c g c2 bes1 f'2 d e d1 r2 f
			f f f1 es2 d c1
		}
		\ficta e!2 e4 e f2 e4 d2 c \ficta b4 c2 r f2 f4 f f2 e4. d8 c4 d c2
		c r a a4 a bes2 a4 c bes8 a g f g2 f1 r r r r \singleDigitTime f2 f f
		bes2. c4 d e f1 f2 e f \[ e c d1 \] g, r2 g g4 g f2 f f' e4 d c g a c2 \ficta b4 c2 c1
	}
	\addlyrics {
		Ne piu bel -- la di que -- ste ne piu de -- _ _ _ gnia
		Si trou -- "va al" -- cu -- "na i" -- de -- a,
		Ju non ve -- de -- te che nel ciel su re -- _ _ _ gnia.
		Ve -- de -- te Ci -- the -- re -- a,
		Ma -- dre do -- ze d’a -- mo -- _ _ re,
		Ve -- de -- te qui Mi -- _ ner -- _ _ ua,
		Che gl’in -- ge -- gni con -- _ ser -- _ _ _ _ ua,
		Dom -- ma coll’ A -- _ re -- _ "te et" col -- la Sa -- pien -- _ _ za,
		Ve -- nu -- "ti in" -- sie -- "me ad" a -- bi -- _ tar __ _ Fio -- ren -- _ _ za.
	}
}


bass = \new Voice {
	\relative c {
		\clef bass
		\repeat unfold 2 {
			f1 f2 f c c f1 c c c2 g'1 f2 g1 d r2 f
			f f bes, bes es f c1 
		}
		g'2 g4 g a2 g4 f e f d2 c r f f4 f bes,!2 c4 e f bes, c2
		f1 r r r r c2 c4 c f2 c4 f g a g2 c,1 \singleDigitTime a'2 a a
		g1 g2 f1 f2 \[ c2 d \] e f d1 c r2 c c4 c d2 bes f' c4 d e2 f4 c d2 c f1
	}
	\addlyrics {
		Ne piu bel -- la di que -- ste ne piu de -- _ _ gnia
		Si trou -- "va al" -- cu -- "na i" -- de -- _ a,
		Ju non ve -- de -- te che nel ciel su re -- _ _ gnia.
		Ve -- de -- te Ci -- the -- re -- _ a,
		Ma -- dre do -- ze d’a -- _ mo -- _ _ re,
		Ve -- de -- te qui Mi -- _ ner -- _ _ ua,
		El Mar -- ti -- al fu -- _ ro -- _ _ re,
		Dom -- ma coll’ A -- re -- "te et" col -- la __ _ Sa -- pien -- _ za,
		Ve -- nu -- "ti in" -- sie -- "me ad" a -- bi -- _ tar Fio -- _ ren -- _ za.
	}
}

\score {
	\transpose c c {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 5)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >> 
			\new Staff << \global \alto \set Staff.instrumentName = #"CT" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >> 
			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\layout { }
	\midi {	}
}
