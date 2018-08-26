% CPDL #
% Copyright ©2018 Peter Hilton - https://github.com/hilton

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
		\Staff \RemoveEmptyStaves
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
	\time 2/2
	\tempo 2 = 56
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
singleDigitTime = { \override Staff.TimeSignature.style = #'single-digit }


%{ ██████   ███████  ███    ██  ███████  ██████   ██   ██████  ████████  ██    ██  ███████
   ██   ██  ██       ████   ██  ██       ██   ██  ██  ██          ██     ██    ██  ██
   ██████   █████    ██ ██  ██  █████    ██   ██  ██  ██          ██     ██    ██  ███████
   ██   ██  ██       ██  ██ ██  ██       ██   ██  ██  ██          ██     ██    ██       ██
   ██████   ███████  ██   ████  ███████  ██████   ██   ██████     ██      ██████   ███████ %}

soprano = \new Voice	{
	\relative c'' {
  r1 r1 g4. a8 b4 c2 b8 a b a g f e2 r r1 a1 ~ 
	a\breve g1 f2 d e  a,2. b4 c d e f4. g8 a4 ~
	a8 b8 c2 b8 a b4. a8 [b c]
  d4. c8 a2 b c b8 a g4 a2 \ficta gis4 a\breve 
  \showBarLine \bar "||" \break
  r1 r1 a1 b2 d c2. b8 a g2. a8 b c4 a2 g8 f e2
  g2 a2. b4 c2. b8 a g2 c, r4 e2 f4 g a2 g8 f e4 a2 b4 c d2 c8 b a4 d,2 e4 f g2 f8 e d4 g2 a4 b c2 b8 a g4
  c,2 d4 e f2 e8 d c4 a'2 g4 f d e a2 g4 f d e a2 g4 f d e2 r1 r2 r4 c f g a b
  c4. d8 f4 e4. d8 d4. c8 c4. b8 b4 a4. g8 g\breve
  \showBarLine \bar "||" \time 3/2 \break
  r1. r1. r1. r1. r1. r1. g2. a4 b2 c1 g2 \[ a2 g \] a2 \[ b2 g \] a2 g2. a4 b2 c1 b2 c b2. a4 a1 \ficta gis2 a1 r2
  a,2. b4 c2 d1 a2 d2. e4 f2 g1 d2 g2. a4 b2 e,2. f4 g2 \[ a2 e \] b'2 c2. b4 g2
  \[ a2 e \] r2 r1. \[ a,2 c \] d2 \[ e2 f \] g2 a a, b c2. d4 e2 \[ a,2 c \] d2 \[ e2 a, \] a'2 g c, d \[ e2 c \] d2 \set Timing.timing = ##f e\longa. \showBarLine \bar "|." 
  }
	\addlyrics {
	  Be -- _ ne -- díc -- _ _ _ _ _ _ tus,
	  be -- ne -- díc -- _ tus, __ _  be -- _ ne -- díc -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ tus
	  qui __ _ _  vé -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ nit __ _ _ _ 
	  in nó -- mi -- ne, __ _ _ _ in nó -- mi -- ne, __ _ _ _ in nó -- mi -- ne, __ _ _ _ in nó -- mi -- ne, __ _ _ _ in nó -- mi -- ne, __ _ _ _
	  in __ _  nó -- mi -- ne, in __ _  nó -- mi -- ne, in __ _  nó -- mi -- ne
	  Dó -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ mi -- ni.
	  Ho -- _ _ sán -- na, ho -- _ _ sán -- _ na, ho -- _ _ sán -- na,
		
	  ho -- _ _ _ sán -- na, ho -- _ _ sán -- na, ho -- _ _ 
		sán -- na, in __ _ ex -- cél -- _ sis, in __ _ ex -- cél -- _ _ sis, __ _
	  in __ _ ex -- cél -- _ _ sis, in ex -- cél -- _ sis, in __ _ ex -- cél -- _ _ _ _ _ _ _ _ sis.
	}
}

alto = \new Voice	{
	\relative c' {
		r1 r1 r1 r1 r4 e4 f a2 g8 f g f e d c2 r2 
		r1 r4 c4 d f2 e8 d e d c b a4 a b d a2. b4 c2 f,
		r4 f a4. b8 c4. d8 e4 f g4. f8 d4. e8 f4 c f2 e1 r4 e1 c4 f2 e1
		a,1 b2 d c2. b8 a g2. r4 r1 r r2 r4 b4 c2 b4 c ~
		
		c b8 a c4 d e\breve r1 r r r r 
		r1 r r r r r r r c4. d8 f4 e4 ~
		e8 d8 d2 \ficta cis4 d a'2 g4 f d4 e a2 g4 f d e a2 g4 f d e a2 g4 f d e\breve
		r1. r1. r1. e2. f4 g2 a e f g2. f4 d2 
		c g'2. f4 e1 e2 c1 c2 \[ d2 e \] c2 r2 g'1 e2 f g 
		
		c,2 g'e f e1 c2. d4 e2 f1 e2 f2. e4 d c \[ b2 a \] d2 
		\[ b2 g2. \] a4 e'1 d2 \[ c a \] b2 e1 d2 \[ c a \] b2 e1 d2 
		\[ c a \] b2 r1. r1. \[ a2 c \] d2 \[ e2 f ]\] g2 \[ a2 e \] r2 
		\[ a,2 c \] d2 e2. f4 g2 \[ a2 e \] a2 g1 g, a g\breve.
	}
	\addlyrics {
		Be -- ne -- díc -- _ _ _ _ _ _ tus,  
		be -- ne -- díc -- _ _ _ _ _ _ tus, be -- ne -- díc -- _ _ _ tus, be -- _ ne -- díc -- _ _ _ _ _ _ _ _ _ _ tus, be -- ne -- díc -- tus
		qui __ _ _  vé -- _ _ nit, qui vé -- _ _ _ _ _ _ nit 
		in __ _  nó -- _ _ mi -- _ ne
		Dó -- _ _ mi -- ni, Dó -- _ _ mi -- ni, Dó -- _ _ mi -- ni, Dó -- _ _ mi -- ni.
		
		Ho -- _ _ sán -- _ _ _ _ _ na, __ _ _ _  ho -- sán -- na, ho -- sán -- na,
		ho -- sán -- _ na, ho -- _ sán -- _ na, ho -- _ _ sán -- na, ho -- _ _ _ sán -- _ _ na, __ _ _
		in ex -- cél -- _ sis, in ex -- cél -- _ sis, in ex -- cél -- _ sis, 
		in __ _ ex -- cél -- _ _ sis, __ _ in __ _ ex -- cél -- _ _ sis, __ _
		in ex -- cél -- _ sis.
	}
 
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		e\breve. d1 c2 a b1 r1 
		r1 r1 r1 r4 f4 g d d' c8 b c b a g f4. g8 a4. b8 c2 f, 
		r c' d b a d b4 e2 d8 c b4 a b2 a\breve

		r1 r r r2 r4 a8 b c4 a2 g8 f e2 g a2. r4 r1
		r r r r r4 a2 b4 c d2 c8 b a4 d, r2 r1 
		r4 g2 a4 b c2 b8 a g4 c, r2 r1 r4 f2 g4 a f2 g4 a b c2 f,4 g a b c4 r r2 
		r1 r r r r r r r r
		e1 d2 c1 a2 b1. r2 e1 d2 c a b1 r2 
		
		e1 d2 \[ c2 a \] b2 r2 e1 d2 c a \[ b2 e2. \] d4 \[ c2 a2 \] b2 
		e2. d4 c2 \[ a2 b1 \] a1 g2 \[ f2 d \] e2 r2 a1 g2 f d 
		e1 r2 \[ b'2 e, \] g \[ a2 c \] b2 \[ a2 c \] b2 a e'1 c2. b4 a2 
		\[ g2 a \] e2 e'1 d2 \[ c2 a \] b2 e1 d2 \[ c2 a \]
		b2 e1 d2 c1 a2 \[ b2 e \] d2 c1 a2 b1 e2. d4 \[ c2 a \] b\breve. 
}
	\addlyrics {
		Be -- ne -- díc -- _ tus,  be -- ne -- díc -- _ _ _ _ _ _ _ _ _ _ _ _ tus,
		be -- _ ne -- díc -- _ _ _ _ _ _ _ _ tus
		qui __ _ _ vé -- _ _ _ _ nit,
		in nó -- mi -- ne, __ _ _ _ _ 
		in nó -- mi -- ne, __ _ _ _ _ 
		in nó -- mi -- ne, in nó -- mi -- ne, 
		in __ _  nó -- mi -- ne.
		
		Ho -- _ sán -- _ na, ho -- _ sán -- _ na, ho -- _ sán -- _ na, ho -- _ sán -- _ na, 
		ho -- _ sán -- _ na, ho -- _ sán -- _ na, ho -- _ sán -- _ na, ho -- _ sán -- _ na
		in __ _ ex -- cél -- _ sis, in __ _ ex -- cél -- sis, in __ _ ex -- cél -- _ sis, 
		in ex -- cél -- _ sis, in ex -- cél -- _ sis, in ex -- cél -- sis, 
		in __ _ ex -- cél -- _ sis, in ex -- cél -- _ sis. 
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
		e4. f8 g4 a2 g8 f g f e d c2 r r1 r1 r1 a'4. b8 c4 d ~
		d c8 b c b a g f2 r r1 r1 r1 a\breve ~
		a1 g1 f2 d e\breve a,

		r1 r1 r1 r1 r1 r1 r1 r1 r1 r1 e'2.f4 g a2 g8 f e4 a, r2 r1 r2 d4 e f g2 f8 e d4 g, r2 r1 r2 c4 d e f2 e8 d c4 f, r2
		f'2. e4 f g c, f2 e4 f g e f2 g4 a \ficta bes a2 r4 f2 g4 a b c f,2 e4 f g e f2 g4 a b c f,2 g4 a b c\breve
		e,2. f4 g2 \[ a2 e \] f2 g2. f4 d2 c1. r1. g'2. a4 b2 
		
		c \[ c,2 g' \] a2. g4 e2 \[ f2 e \] c2 \[ g'2 e\] f2 \[ g2 c, \] g'2 a1 g2 
		a2 g a1 e a,2. b4 c2 d1 a2 d2. e4 f2 g d1 
		g2. a4 b2 e,2. f4 g2 a1 e2 c'2. b4 g2 a2. g4 e2 \[ a,2 c \] d2 
		\[ e2 f \] e2 a1 d,2 a'1g2 c1 b2 a1 e2 c'1 b2 a2. g4 f2 \[ e2 c' \] b2 a2. g4 f2 e2. d4
		c4 b c2 \[ a1 e'\breve. \]
	}
	\addlyrics {
		Be -- _ ne -- díc -- _ _ _ _ _ _ tus,  be -- _ ne -- díc -- _ _ _ _ _ _ tus,
		be -- ne -- díc -- _ tus. __ _ 

		in nó -- mi -- ne, __ _ _ _ _ in nó -- mi -- ne, __ _ _ _ _ in nó -- mi -- ne, __ _ _ _ _ 
		in __ _  nó -- mi -- ne, in __ _  nó -- mi -- ne, in __ _  nó -- mi -- ne, 
		Dó -- _ _ mi -- ni, Dó -- _ _ mi -- ni, Dó -- _ _ mi -- ni, Dó -- _ _ mi -- ni.

		Ho -- _ _ sán -- _ _ _ _ _ na, ho -- _ _ sán -- _ _ _ _ na, ho -- _ _ sán -- _ na,
		ho -- _ _ sán -- na, ho -- _ sán -- na, ho -- _ _ sán -- na,  ho -- _ _ sán -- na,
		ho -- _ _ _ _ _ sán -- na,
		in __ _  ex -- cél -- _ sis, in __ _  ex -- cél -- _ sis, in  ex -- cél -- sis, in  ex -- cél -- sis,
		in  ex -- cél -- _ _ sis, in  ex -- cél -- _ _ _ _ _ _ _ _ sis. 
	}
}


\score {
	\new StaffGroup <<
		\set Score.proportionalNotationDuration = #(ly:make-moment 1 6)
		\set Score.barNumberVisibility = #all-bar-numbers-visible
		\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >>
		\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >>
		\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >>
		\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >>
	>>
  \header {
		piece = \markup \larger \sans { Benedictus }
	}
	\layout { }
%	\midi {	}
}
