% CPDL #38059
% Copyright ©2016 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "3"
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
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		\center-column {
			"Het molenarinneken"
			\vspace #1
		}
	}
	composer = \markup \sans \column \right-align { "Mattheus Pipelare (1450-1515)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year \with-url #"http://hilton.org.uk" "Peter Hilton" -
				\with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/" "CC BY-NC-SA 3.0" -
				Lilypond source \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - 
				Translation Mick Swithinbank -
				rev \revision 
			}
		}
	}
	tagline = \markup { 
		\vspace #2
		\column {
			\line { I know a miller’s daughter, charming as can be: in all these parts there is none more beautiful. }
			\line { Mighty God, if she would grind me, I would bring her fine grain, if only she would be my miller. }
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
		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 10) (stretchability . 100))
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
	\key bes \major
	\time 4/2
	\tempo 2 = 100
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
fictaParenthesized = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##t }

superius = \new Voice	{
	\relative c'' {
		r\breve r r a1 bes1.
		bes2 a1 g\breve c1 bes a2 g2. f4 es d
		es2 d1 c2 d1 r2 a' bes a bes g f1 d1.

		c2 d1 r\breve r r2 a' bes2. a4
		bes2 g f1 d g f2. es4 d2 c4 bes
		c1 r2 bes d2. es4 f2 g4 es f2. es4 d1 r r2 f
		f2. g4 a2 bes1 a4 g f2 g1 f2 g1 r\breve

		r r r r1 g
		f2 f g a2. bes4 c a bes1 a g2 c2. bes4 a1 g2
		a2. g4 f e d2 r c d2. e4 f2 g g f g\breve
		r r r r

		r1 g f2 f g a2. bes4 c a bes1 a g2 c2.
		bes4 a1 g2 a2. g4 f e d2 r c d2. e4 f2 g4 g g2 fis g\breve \showBarLine \bar "|."
	}
	\addlyrics {
		Ick weedt een mo -- le -- na -- rin -- ne
		Van __ _ her -- _ ten al -- so fijn.
		In al -- le de -- ze lan -- _ _ den,
		in al -- le de -- ze lan -- den
		En mach gheen schoon -- der __ _ zijn:
		Rijk God __ _ mocht zij mij ma -- _ len,
		Rijk God __ _ mocht zij mij __ _ ma -- _ _ len,
		Goed co -- ren soud ick __ _ haer __ _ ha -- _ _ _ _ _ _ _ _ _ _ len,
		mocht zij __ _ _ mij ma -- _ len,
		goed co -- ren soud ick __ _ haer __ _ ha -- _ _ _ _ _ _ _ _ _ _ len,
		Wou sij mijn mo -- le -- na -- rin -- ne sijn.
	}
}

counterTenor = \new Voice {
	\relative c' {
		a1 bes1. bes2 a1 g2. f8 es d2 g1 f2 g1
		r d d'2. c4 bes a g1 f2 g es f g r g
		c a2. g4 a2 f d r d' d c d bes a1 r

		r1 r2 a2 bes d2. c4 bes2 a d d bes1 c2 d2. c4
		bes1 a r\breve d,1 g
		f g r\breve r2 bes bes2. c4 d2 es d\breve
		c2 bes f'2. es4 d2 c d1 bes r c
		
		bes2 bes c d2. es4 f d es1 d2 f es f2. es4 d1 c2
		d a bes c d c d e f1 r2 f f1 d2. e4
		f2 d2. c4 bes a g2 f d d'1 c2 d1 bes\breve
		r1 c bes2 bes c2 d2. es4 f d es1 d2 f es f2.

		es4 d1 c2 d a bes a d c d e f1 r2 f1
		f2 d2. e4 f2 d2. c4 bes a g2 f d d'1 c2 d1 bes\breve
	}
	\addlyrics {
		Ick weedt een mo -- le -- _ _ na -- rin -- ne -- ken
		Van her -- _ _ _ _ ten al -- so fijn, __ _
		Van her -- _ ten al -- so fijn,
		Van her -- ten al -- so fijn.
		In al -- _ _ le de -- ze lan -- _ _ _ _ _ den,
		gheen schoon -- der zijn:
		Rijk God __ _ _ mocht zij __ _ mij ma -- _ _ _ _ len,
		Goed co -- ren soud ick __ _ haer ha -- _ _ _ _ _ _ _ _ len,
		goed co -- ren soud ick haer ha -- len,
		goed co -- ren __ _ soud ick __ _ _ _ _ haer ha -- _ _ _ len,
		goed co -- ren soud ick __ _ haer __ _ ha -- _ _ _ _ _ _ _ len,
		goed co -- ren soud ick haer ha -- len,
		Wou sij mijn __ _ mo -- le -- _ na -- _ rin -- _ _ _ _ ne sijn.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		r\breve r r r
		r1 a1 bes1. bes2 a1 g c bes2 g1
		f2 e1 d\breve r r2 a' bes a

		bes g f1 d g f d2 es1 c bes2. 
		c4 d es f1 r\breve r
		r1 r2 bes bes2. c4 d2 es d1 g,2. a4 bes2 c bes1
		r2 bes a f bes1 a2 g a1 g2 bes2. a4 g1 fis2

		g2 d' es f4 es d c bes2. a8 g a2 bes2. a4 g2 f2. g4 a bes g1
		a1 r r g f2 f g a2. bes4 c a bes1
		a2 a2. g4 f e d2 a' bes1 a2 g a1 g2. f4 g a bes2
		bes4 a g1 fis2 g2 d' es f4 es d c bes2. a8 g a2 bes2. a4 g2 f2. 

		g4 a bes g1 a r r g f2 f g a2. 
		bes4 c a bes1 a2 a2. g4 f e d2 a' bes bes a g a1 g\breve
	}
	\addlyrics {
		Ick weedt een mo -- le -- na -- rin -- _ _ ne -- ken
		In al -- le de -- ze lan -- _ _ _ _ _ _ _ _ _ _ den
		En mach __ _ _ gheen schoon -- _ _ _ der zijn:
		Rijk God mocht zij __ _ mij ma -- _ _ _ _ _ len,
		rijk God __ _ _ _ _ _ _ _ mocht zij __ _ _ mij __ _ _ _ ma -- len,
		Goed co -- ren soud ick __ _ haer __ _ ha -- len,
		goed __ _ _ _ co -- _ _ ren __ _ soud ick __ _ _ _ haer ha -- _ _ _ len,
		goed co -- _ _ _ _ _ _ _ ren soud __ _ ick haer __ _ _ _ ha -- len,
		goed co -- ren soud ick __ _ haer __ _ ha -- len,
		Wou __ _ _ _ sij mijn mo -- le -- na -- rin -- ne sijn.
	}
}


bass = \new Voice {
	\relative c {
		\clef bass
		r\breve r1 a bes1. bes2 a1 g2. a4
		bes g g'1 f2 g\breve r1 r2 g f es2. d4 es2
		c d a1 a'2. g4 f e d2 r\breve r2 d g f

		g es d2. c4 bes2. a4 g1 r\breve r1 r2 g2. 
		a4 bes c d2. es4 f2 g2. a4 bes c a d2 c4 bes2 bes |
		a2 a bes2. a4 g2 f4 es d2 c bes1 r r\breve |
		r1 r2 bes bes2. c4 d2 es d1 g,2. a4 bes2 c a1 |

		g r r c bes2 bes c d2. es4 f d es1 |
		d r r\breve r2 d e f2. g4 a f g1 |
		d d2. c4 bes2 a g g' f e d1 r2 g, g2. a4 |
		bes2 c a1 g r r a bes2 bes c d2. 
		
		es4 f d es1 d r r\breve r2 d e f2. 
		g4 a f g1 d d2. c4 bes2 a g g' f es d1 g,\breve
	}
	\addlyrics {
		Ick weedt een mo -- le -- na -- rin -- _ _ ne -- ken
		Van her -- _ _ ten al -- _ so fijn. __ _ _ _ _
		In al -- le de -- ze lan -- _ _ _ den
		En __ _ _ _ mach __ _ _ _ _ _ _ _ _ gheen schoon -- der zijn,
		En mach __ _ _ gheen __ _ schoon -- der zijn:
		Rijk God __ _ _ _ mocht zij __ _ _ mij ma -- len,
		Goed co -- ren soud ick __ _ haer __ _ ha -- len,
		goed co -- _ _ _ _ ren soud ick __ _ _ haer ha -- _ _ _ len,
		soud ick __ _ _ haer ha -- len,
		goed co -- ren soud ick __ _ haer __ _ ha -- len,
		Wou sij mijn __ _ _ _ mo -- le -- na -- _ rin -- _ _ _ _ _ ne sijn.
	}
}

\score {
	\transpose c d {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 6)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \superius \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >> 
			\new Staff << \global \counterTenor \set Staff.instrumentName = #"CT" \set Staff.shortInstrumentName = #"CT" >> 
			\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >> 
			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\layout { }
	\midi {	}
}
