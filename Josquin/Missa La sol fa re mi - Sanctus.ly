% CPDL #
% Copyright ©2018 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "3"
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

soprano = \new Voice	{
	\relative c'' {
	  a1 a2 g f2. d4 e\breve a1 g2 f d e a1 
		g4. e8 f4 e2 d4 e2 a1 g4. e8 f4 e2 d4 c b4. a8 a2 \ficta gis4 a1 c2. c4 c2 f 
		e r2 r4 b4 c1 f2 g4. a8 \ficta bes4 a2 f4 g e2 c4 b2 a4 c4. d8 e f g4. a8
	  b4 a2 c b8 a g1 r4 g a b c c,4. d8 e c d2 c r4 g' a b c a2 c4 b g4. f8 e d c4 g'4. f8 f4. e8 e2 d4 
		\set Timing.timing = ##f e\breve.
	  \showBarLine \bar "||" \set Timing.timing = ##t	\set Score.currentBarNumber = #27
	  a2. g4 f d e2 a1 g2 f4 e2 d8 c b4 e4. d8 d2 c4 g' f4. e8 a4. g8 g4 c
	  b4. a8 a2 \ficta gis4 a1 r2 r1. r1. r1. r1. r1. r1. r1. r1. r1. r1. r2 r2 r4 a g c4. a8 b4 r a2 g4 f d e2 r4 d2 c4 f4. d8 e2 r4
	  a g c4. a8 b4 r a g c4. a8 b4. a8 a2 \ficta gis4 a c2 b4 a2 \set Timing.timing = ##f \ficta gis\breve.
	  \showBarLine \bar "||" \set Timing.timing = ##t	\set Score.currentBarNumber = #54
	  r1. r1. e1 d2 c2. a4 b2 r4 e2 f4 g2 c,8 d e f g4c d
	  b4 c a2 c4 b g a f r f g e f d2 f4 e8 d c \ficta bes a4 a'2 f4 g e4. d8 f4. e8 d c b2 r1. r1. 
	  r4 e4. f8 g a b4 g a c4. b8 a2 \ficta gis4 a2 e r r1. r4 a,4. b8 c d e4 c d f4. e8 d2 \ficta cis4 d f2 g4 a b \set Timing.timing = ##f c\breve.
	  \showBarLine \bar "|." 
  }
	\addlyrics {
	  Sanc -- tus, san -- _ _ tus Sanc -- _ _ _ tus Sanc -- _ _ _ _ _ tus Sanc -- _ _ _ _ _ _ _ _ _ _ tus
	  Do -- mi -- nus De -- us, De -- _ _ _ _ _ _ _ _ _ _ us Sa -- _ _ _ _ _ _ _ _ _ ba -- _ oth,
	  Sa -- _ _ _ _ _ _ _ ba -- oth Sa -- _ ba -- oth, Sa -- _ _ _ _ _ _ _ _ _ _ _ _ ba -- oth.
	  
	  Ple -- _ _ ni sunt coe -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ li,
	  glo -- _ _ ri -- a  tu -- _ _ _ a, glo -- _ _ ri -- a, glo -- _ _ ri -- a, glo -- _ _ _ _ _ _ ri -- a tu -- _ _ a. 
	  Ho -- _ san -- _ na, ho -- _ _ san -- _ _ _ _ _ _ _ _ na,
	  ho -- _ _ san -- na, ho -- _ _ san -- na, ho -- _ _ _ _ _ san -- _ _ na, __ _ _ _ _ _ _
	  in __ _ _ _ _  ex -- cel -- _ _ _ _ sis, __ _
	  in __ _ _ _ _  ex -- cel -- _ _ _ _ sis,  in ex -- cel -- _ sis.
	}
}

alto = \new Voice	{
	\relative c' {
		a1 a4. b8 c2 d1c\breve a2 d b4e4. d8 d2 a4 b c a f'4. e8 d c 
		b4 c f, c'2 a4 b c a f'4. e8 d c b4 c f, c'2 d4 e2 a, d c1 r2 a a a
		r a2. f4 g a4. f8 c'2 a4 b c4 d4. c8 a4. b8 c4. b8 g4 a2 \ficta gis4 a2 e'1 b8[ c8] d f4 e8 e2 d4 
		e2 r4 g2 e4 f g e2 r2 r2 r4 a g e f g e c4. b8 a4g1 c2 b4 a2 g4 a2 
		
		g1 g\breve r1. r1. r1. r1. r1. 
		r1. a1. g2 c2. a4 b2 e1 d2 f2. d4 e1. 
		d2 c4 a b2 r1. r1. r4 e d f4. d8 e4 r a, g c4. a8 b4 r a g c4. a8 b4 r d2 c4 f4. d8 e1.
		r1. r1. r2 r2 r4 a,2 g4 c4. a8 \tuplet 3/2 { b4 c a } 
		
		\tuplet 3/2 { c d b } \tuplet 3/2 { e f d } e\breve. s\breve r1. e1 d2 c2. a4 b2 
		r1. r4 a c d e4. f8 g2 c, r4 g'4 e f4. e8 c4 d e c d a d b c a bes4. a8 f4 g a4 
		a1 g2 a4 d2 f4 e2 r1. r1. c1 g4 d' e a, c4. d8 e2 
		c r r r1. a1 g2 f f4. g8 a2 r4 a2 g4 f4 g a\breve.
	}
	\addlyrics {
	  Sanc -- tus, __ _ _  sanc -- _ tus, __ _  sanc -- _ _ _ _ _ _ tus, sanc -- _ _ _ 
		_ _ tus, sanc -- _ _ _ tus, sanc -- _ _ _ _ _ tus, sanc -- _ _ _ _ tus Do -- mi -- nus 
		De -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ us
	  Sa -- _ _ _ _ _ _ ba -- oth, Sa -- _ _ ba -- oth,
	  Sa -- _ _ _ ba -- oth, Sa -- _ _ _ _ _ _ _ _ ba -- oth.
	  
	  Ple -- ni sunt __ _ _  coe -- _ _ _ _ _ _ _ li,
	  et __ _ ter -- _ ra, et __ _ ter -- _ ra, 
	  et __ _ ter -- _ ra, et __ _ ter -- _ ra, 
	  glo -- _ _ ri -- a __ _ _  
		
		tu -- _ _ _ _ _ a. Ho -- _ san -- _ na, 
		ho -- _ _ _ _ san -- na, ho -- _ san -- _ na, ho -- _ _ san -- na, ho -- _ _ _ san -- _ na, __ _ _
	  ho -- _ san -- _ _ na, in  ex -- cel -- _ _ _ _ _ 
		sis, in  ex -- cel -- _ _ sis,  in ex -- cel -- _ sis.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		r1. r1. a1. \[ g2 f \] d2 e a1 g2 f d 
		e a1 g2 f d e a1 g2 f d e2. c4 c2 f2. f4 f2
		\[ g2 f \] d2 e a1 g2 f d e1 r2 e' e,4 g4. a8 b4 \[ d2 c \] a2 
		b e1 d2 c a b e1 d2 c a b e1 d2 c a4 d, 
		
		b'\breve. r1. a2. g4 f d e2 a1 g2 f4 d e e'2 d4 c a b e ~ \break
		e d4 c a b2 r1. r1. r1. r1. r1. 
		r1. r4 a g f4. d8 e4 r a g c4. a8 b4 r1. r1. r1. 
		r1. r4 a2 g4 c4. a8 b2 r4 d2 c4 f4. d8 e2 r4 d2 c4 f4. d8 e1. r4 a, ~ 
		
		a g4 c a b2 r4 a2 g4 c a b\breve. r1. r1. r1. 
		e1 d2 \[ c2 a \] b2 e1 d2 \[ c2 a \] b2 a1 g2 \[ f2 d \] e2 
		a8 g8 f e d4 d'4 b c \[ f,2 d \] e2 e'1 d2 \[ c2 a \] b2 e1 d2 \[ c2 a \] b2 
		a1 g2 \[ f2 d \] e2 f1 c4 g' a d, d2 e d2. e4 f d e\breve.
	}
	\addlyrics {
		Sanc -- _ _ _ tus, sanc -- _ _ _ 
		tus, sanc -- _ _ _ tus, sanc -- _ _ _ _ _ tus, Do -- mi -- nus 
		De -- _ _ us, De -- _ _ _ us,
		Sa -- _ _ _ _ _ _ ba -- oth, Sa -- _ _ ba -- oth, 
		Sa -- _ _ ba -- oth, Sa -- _ _ ba -- _ oth. 

		Ple -- _ _ ni sunt coe -- _ _ _ li, coe -- _ _ _ _ _ _ _ _ li,
		et __ _ ter -- _ ra, et __ _ ter -- _ ra, 
		glo -- _ _ ri -- a, glo -- _ _ ri -- a, glo -- _ _ ri -- a, glo -- _ _ ri -- a tu -- _ _ _ a.

		Ho -- _ san -- _ na, ho -- _ san -- _ na, ho -- _ san -- _ na, 
		ho -- _ _ _ _ _ _ _ san -- _ na, in ex -- cel -- _ sis, in ex -- cel -- _ sis, 
		in ex -- cel -- _ sis, in ex -- _ cel -- _ sis, __ _ in ex -- cel -- _ sis.
	}
}

bass = \new Voice {
	\relative c' {
		\clef bass
	  a2. g4 f d \[ e2 d1 \] a1.c2 d4. e8 f2 r4 c4 d4. e8 f2 e4 c d4. e8 f2 r4 c d c f2 e4 c d4. e8 f2 
	  r4 c d c f2 e d4. c8 b2 a1 r2 f2. f4 f2 c' d1 c2 f1 e2 d1 c2. a4 e'2 r4
	  a,4 c4. d8 [e f] g2 d4 a'4. g8 f2 e2. c4 c2 r4 g' a4. b8 c2 r4 g a4. b8 c2 r4 g a4. b8 c4 f, g e4. c8 c4. d8 e f g4 d a' e f2 e\breve.
	  r1. r1. r1. r1. r1. r1. a,1 c4 d e1 a2 g c2. a4 b2 \[ a2 d, \] r4 a'2 g4 c4. a8 b2 r4
	  a2 g4 f4. d8 e4 a2 g4 f4. d8 e4 a,2 g4 c4. a8 b4 d2 c4 f4. d8 e4 a2 g4 c4. a8 b4 a2 g4 
		f d e2 r r1. r1. r1. r1. r2 a2 e4 f ~
		
		f g4 a f e2 a,2 r a e'\breve.
	  e1 d2 c2. a4 b2 r4 a2 a' g4 a a,2 a' g4 a a, a' f
	  e2 r4 c'2 a4 b g a f2 a4 g e f d r d e c d bes2 d4 c8 b a g f4 f'2 d4 e c d4. e8 [ f g ] a2 
	  \ficta gis4 a e4. f8 g a b4 g a c4. b8 a2 \ficta gis4 a2 c b a4. g8 f2 e r4 a,4. b8 c d e4 c d f4. e8
	  d2 c4 d2 f e d4. c8 \ficta bes2 a a'4. g8 f4 e d8 c b4 a\breve.
	}
	\addlyrics {
	  Sanc -- _ _ _ tus, __ _ _  sanc -- tus, __ _ _ sanc -- tus, __ _ _  sanc -- tus, __ _ _ _  
	  sanc -- _ _ _ _ _ tus, __ _ _ sanc -- _ _ _ _ _ _ _ tus.
	  Do -- mi -- nus De -- _ _ _ _ _ _ _ us  Do -- _ _ _ _ _ _ _ _ _ mi -- _ nus De -- _ _ us De -- _ _ us
	  Sa -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ba -- oth.
  
	  Ple -- _ ni sunt  coe -- _ _ _ _ _ li,
	  et __ _ ter -- _ ra, et __ _ ter -- _ ra, et __ _ ter -- _ ra, et __ _ ter -- _ ra, 
	  et __ _ ter -- _ ra, et __ _ ter -- _ ra, et __ _ ter -- _ ra
	  glo -- _ _ _ _ _ ri -- a  tu -- a.
	  Ho -- _ san -- _ na, ho -- _ san -- na, ho -- _ san -- na, ho -- _ san -- na, 
	  ho -- _ _ _ san -- na, ho -- _ _ san -- na, ho -- _ _ san -- na,
	  ho -- _ _ _ _ _ san -- _ _ na, ho -- _ _ _ _ san -- na,  
	  in __ _ _ _ _  ex -- cel -- _ _ _ _ sis, in ex -- cel -- _ _ sis,
	  in __ _ _ _ _  ex -- cel -- _ _ _ _ sis, __ _ 
	  ex -- cel -- _ _ sis, in __ _ _  ex -- cel -- _ _ sis.
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
		piece = \markup \larger \sans { Sanctus }
	}
	\layout { }
%	\midi {	}
}
