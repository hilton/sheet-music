% CPDL # 
% Copyright ©2018 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "7"
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
	system-system-spacing = #'( (padding . 3) (basic-distance . 30) (stretchability . 100) )
	ragged-bottom = ##f
	ragged-last-bottom = ##t
}

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	copyright = \markup \sans {
		\vspace #1
		\column \center-align {
			\line {
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
		\remove "Forbid_line_break_engraver"
	}
}

global = {
	\key c \major
	\time 3/2
	\tempo 2 = 56
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
singleDigitTime = { \override Staff.TimeSignature.style = #'single-digit }


%{	 █████       ██████      ███    ██     ██    ██      ██████             ██████      ███████     ██
		██   ██     ██           ████   ██     ██    ██     ██                  ██   ██     ██          ██
		███████     ██   ███     ██ ██  ██     ██    ██      █████              ██   ██     █████       ██
		██   ██     ██    ██     ██  ██ ██     ██    ██          ██             ██   ██     ██          ██
		██   ██      ██████      ██   ████      ██████      ██████              ██████      ███████     ██  %}

soprano = \new Voice	{
	\relative c'' {
%    \set Score.currentBarNumber = #105
	  r1. r1. a1. g2. f4 d2 e1 a2 g1 f2 \[ d e \] a g1 f2 d e1 r4 a a a e e g4. f8 d4 g f d4. e8 f g a4. g8 e4 a g e4. f8 g4 a2
	  g4 e4. d8 f4. e8 d c b4 e4. d8 c a b2 r4 a
	  c2 d4. e8 f4 c \[ f2 g \] a4. f8 \[ f2 g \] r4 c, f2 g a4. g8 [ f d ] f4 e b' c d4. c8 b a g4 a e b' c d4. c8 b a g1 r4 e g e g4. a8 b2 r4
	  e,4 g e g4. a8 [ b c ] b4. a8 a4 g c4. b8 b4. a8 a4. \ficta gis8 \ficta gis \ficta fis 
		\set Timing.timing = ##f a\breve.
	  \showBarLine \bar "||"
		\set Timing.timing = ##t
  }
	\addlyrics {
		Á -- _ _ _ gnus Dé -- _ _ _ i, á -- _ gnus Dé -- i,
		qui  tól -- lis __ _  pec -- cá -- _ ta __ _  mún -- _ _ _ _ _ _ _ _ di, mún -- _ _ _ di, mún -- _ _ _ _ _ di,
		mún -- _ _ _ di mún -- _ _ _ _ _ _ _ _ _ di, __ _
		mún -- _ _ _ _ _ _ _ di, mún -- _ _ _ _ _ _ _ di, mún -- _ _ _ _ _ di,
		mi -- _ se -- ré -- _ re 
		mi -- _ se -- ré -- _ _ _ _ _ _ re  nó -- _ _ _ _ _ _ _ bis.
	}
	\addlyrics {
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		_ _ _ _
		dó -- _ na  nó -- _ bis 
		dó -- _ na  nó -- _ _ _ _ _ _ bis  pá -- _ _ _ _ _ _ _ cem.
	}
}

alto = \new Voice	{
	\relative c' {
    e\breve d1 c1 a2 b1. r4 g c2. d4 e2 e d2 ~
		d \[ c2 a \] b \[ e d1 \] c1. a2 r4 e' 
		e e b b d4. c8 a4 d c a4. b8 c d e4 c4. a8 b4 c d b c4. b8 d4. c8
	  b a g4. f8  g4 a2 \ficta gis4 a e'2 f4 g2 \[ c, d \] b \[ c d \] b  \[ c d \] b \[ c d \] b4 e4. d8 f4. e8 d c b4 c4. d8 e4. d8 f4. e8 d c b2 
	  r4 b c8 [a] c [d] e1 r4 b c8 a c d e2 r4 g g g f d e g g g f d e2 e\breve.
  }
	\addlyrics {
		Á -- gnus Dé -- _ i, Dé -- _ _ 
		i, á -- gnus Dé -- _ i, á -- gnus Dé -- i,
		qui  tól -- lis __ _  pec -- cá -- _ ta _ mún -- _ _ _ _ di, 
		mún -- _ _ _ _ di, mún -- _ _ _ _ _ _ _ _ _ _ di,
		mún -- _ di, mún -- _ di, mún -- _ di, mún -- _ di, mún -- _ di, 
		mún -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ di, 
		mi -- se -- _ ré -- _ re, mi -- se -- _ ré -- _ re,  
		mi -- se -- ré -- re nó -- bis,  mi -- se -- ré -- re nó -- _ bis.
	}
	\addlyrics {
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		dó -- na _  nó -- _ bis, dó -- na _  nó -- _ bis, 
		dó -- na  nó -- bis pá -- cem, dó -- na  nó -- bis pá -- _ cem.
	}
}

tenor = \new Voice {
	\relative c' {
	  \clef "treble_8"
    a1. \[ g2 f \] d e1 e' d c2 a1 
		b2 r4 e,4 f d f4. g8 a4. b8 c4 d e2 r4 e,4 f d f4. g8 a4. b8 c d e4 a,4. b8 c2 a
		b1 r2 r1. r1. r1.
	  e1 d2 \[ c a \] b a1 g2 \[ f d \] e a1 g2 f d e r1. r1. r4 e'2 d4 c a b2
	  r4 e2 d4 c a b2 r4 e2 d4. c8 a4 b e2 d4 c a b2 a\breve.
  }
	\addlyrics {
		Á -- gnus Dé -- _ i á -- gnus Dé -- _ 
		i Dé -- _ _ _ _ _ _ _ _ i Dé -- _ _ _ _ _ _ _ _ _ _ _ _ _ 
		i, mún -- _ _ _ di, mún -- _ _ _ di, mún -- _ _ _ di,
		mi -- se -- ré -- _ re  mi -- se -- ré -- _ re nó -- _ _ _ bis, nó -- _ _ _ _ bis.
	}
	\addlyrics {
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		_ _ _ _ _ _ _ _ _ _ 
		dó -- na nó -- _ bis  dó -- na  nó -- _ bis pá -- _ _ _ cem, pá -- _ _ _ _ cem.
	}

}

bass = \new Voice {
	\relative c {
		\clef bass
    a1. \[ c2 d1 \] a1. e'4. f8 g2 g, c2. d4 f2 e c d2 ~
		d a2 f' e \[ c2 d \] b2 a1.
    r4 a' a a e e g4. f8 d4 g f d4. e8 f g a4. g8 e4 a2 g4 f d e a g f d2 e1
    r2 a1 g2 \[ f d \] e2 a1 g2 \[ f d \] e2 a1 g2 \[ f d \] e4 a2 g4 f2 d \[ e2 g \] a2 e
    r4 c g'2 a e r4 c g'4. f8 d4 f e c g'4. f8 d4 f e2 a,\breve.
  }
	\addlyrics {
		Á -- _ _ gnus Dé -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ i,
		qui  tól -- lis __ _  pec -- cá -- _ ta __ _  mún -- _ _ _ _ _ _ di,
		mún -- _ _ _ di, mún -- _ _ _ di, mún -- _ _ _ di, mún -- _ _ _ di, mún -- _ _ _ di, 
		mún -- _ _ _ _ _ _ di, 
		mi -- se -- ré -- re, mi -- _ se -- ré -- re nó -- bis, mi -- se -- ré -- re nó -- bis. 
	}
	\addlyrics {
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
		_ _ _ _ _ _ _ _ _ _ _ _ _ _ _  
		dó -- na nó -- bis, dó -- _ na nó -- bis pá -- cem, dó -- na nó -- bis pá -- cem.
	}
}


\score {
	\transpose c c {
		\new StaffGroup <<
 			\set Score.proportionalNotationDuration = #(ly:make-moment 1 5)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >>
			\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >>
			\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >>
			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >>
		>>
	}
  \header {
		piece = \markup \larger \sans { Agnus Dei I & III }
	}
	\layout { }
%	\midi {	}
}

soprano = \new Voice	{
	\relative c'' {
		\set Score.currentBarNumber = #30 \partial 1
	  b1 c2 b4 c4. b8 g4 a b e,2 r g a4 b2 c4 b c2 b8 a g4 c, d f e2 r
	  g2 a4 g a c2 b8 a g2 c, r4 g'a g2  e4 f g2 c4 b a4. g8 g2 f4 e c d2 r4
	  c4 d e 4. c8 d4 e c d e f g2 c,4 d e f g a c, d e f g a \ficta bes c b4 ~
		b8 a8 a2 g4 f2 e d4 c \ficta bes2 a4 d c f e a g c4. b8 a2 \ficta gis4 \set Timing.timing = ##f a\breve
	  \showBarLine \bar "||" \set Timing.timing = ##t
  }
	\addlyrics {
		Á -- gnus __ _ Dé -- _ _ _ _ i %Á -- gnus Dé -- _ _ _ _ _ _ _ _ _ i
		qui __ _ _ _ _ tól -- _ _ _ _ _ _ lis  pec -- cá -- _ ta  mún -- _ _ _ di
		mún -- _ _ _ _ _ _ _ _ _ _ _ _ _ di
		mi -- se -- ré -- _ _ _ _ _ _ _ re  
		nó -- _ _ _ bis, __ _  nó -- _ _ _ bis, __ _
		mi -- se -- ré -- _ _ _ _ re nó -- _ _ bis,
		mi -- _ se -- _ ré -- re nó -- _ _ _ bis.
	}
}

alto = \new Voice	{
	\relative c' {
	  e1 ~ e1. d2 c2. a4 b2 r2 e\breve d2 c2. a4 b2 r4 e d c a2 b4 e4. d8 c4 a b r
	  e4. d8 c4 a b e2 d4 c a b e d4. c8 a4 b2 e d4 c a b r e d c a b
	  e2 d4 c a b r e d c a b r e2 d4 c a b e2 d4 c a b e2 d4 c8 a b4 e d c a
	  \tuplet 3/2 { b4 e4. d8 } \tuplet 3/2 { d2 c4 } \tuplet 3/2 { a b2 } a\breve
  }
	\addlyrics {
		Á -- gnus Dé -- _ i
		qui __ _ tól -- _ lis  pec -- _ _ cá -- ta  mún -- _ _ _ di
		mún -- _ _ _ di, mún -- _ _ _ di, __ _  mún -- _ _ di, 
		mi -- _ se -- ré -- re  mi -- se -- ré -- _ re	mi -- se -- ré -- _ re
		nó -- _ _ _ bis nó -- _ _ _ bis  nó -- _ _ _ bis nó -- _ _ _ bis  nó -- _ _ _ bis
		nó -- _ _ _ _ _ bis.
	}
}

\score {
	\new StaffGroup <<
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 6)
		\set Score.barNumberVisibility = #all-bar-numbers-visible
		\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >>
		\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >>
	>>
	\header {
		piece = \markup \larger \sans { \vspace #2 Agnus Dei II }
	}
	\layout {
		ragged-last = ##f
	}
%	\midi {	}
}
