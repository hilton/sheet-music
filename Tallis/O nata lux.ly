% CPDL #31402
% Copyright ©2014 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "3"
\pointAndClickOff

#(set-global-staff-size 15.0)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 10\mm
	inner-margin = 15\mm
	outer-margin = 15\mm
%	top-markup-spacing = #'( (basic-distance . 8) )
	markup-system-spacing = #'( (padding . 4) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		"O nata lux"
	}
	composer = \markup \sans \column \right-align { "Thomas Tallis (1505-1585)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				This edition copyright \year Peter Hilton - 
				Lilypond source at \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - 
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
	\time 3/1
	\partial 1.
	\tempo 2 = 72
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
fictaParenthesized = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##t }

superius = \new Voice	{
	\relative c'' {
		d2 es c \bar "" d1. a2 bes g a1 e'2 f d e1 c2 d \bar "" \break
		bes a1 g r2 d' c a bes1. bes2 a a g2. f4 g a \bar "" \break bes2 c c d1. bes2 c c d1 r2
		f es c \bar "" \break d1. d2 c a bes1. a2 g e a1. d2 d cis d1 r2 
		\showBarLine 
		\repeat volta 2 {
			a a g a1. a2 a g a1. d2 a bes a1 g2 g1 fis2 g1 \fermata
		 \showBarLine \bar ":|."
		}
	}
	\addlyrics {
		O na -- ta lux de lu -- mi -- ne, Je -- su red -- em -- ptor se -- 
		cu -- _ li, di -- gna -- re cle -- mens sup -- pli -- cum __ _ _ lau -- _ des pre -- ces -- que su -- me -- re,
		qui car -- ne quon -- dam con -- te -- gi di -- gna -- tus es pro per -- di -- tis,
		nos mem -- bra con -- fer ef -- fi -- ci tu -- i be -- a -- ti cor -- po -- ris.
	}
}

discantus = \new Voice {
	\relative c'' {
		g2 g g f2. e4 d2 d d d e2. d4 cis2 \ficta c'! bes bes a1 a2
		g1 \ficta fis2 g1 r2 d e \ficta f g1. d2 f f es1. bes2 es es d2. es4 f2 g g c, f1 r2
		f g a bes1. f2 a a g1. d2 e e f2. e4 f g a2 g e fis1 r2
		\repeat volta 2 {
			\ficta f! f d f1. f2 f d f1. f2 f d f1 es d2 d b1 \fermata
		}
	}
	\addlyrics {
		O na -- ta lux __ _ _ de lu -- mi -- ne, __ _ _ Je -- su red -- em -- ptor se -- 
		cu -- li, di -- gna -- re cle -- mens sup -- pli -- cum lau -- des pre -- ces -- _ _ que su -- me -- re,
		qui car -- ne quon -- dam con -- te -- gi di -- gna -- tus es __ _ _ pro __ _ per -- di -- tis,
		nos mem -- bra con -- fer ef -- fi -- ci tu -- i be -- a -- ti cor -- po -- ris.
	}
}

contraTenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		bes2 c g a2. g4 f2 f d d' cis2. \ficta b4 a1 f'2 g e f1
		bes,2 d d d1 r2 bes a a g1. bes2 c d g,2. a4 bes2 bes bes a bes1. bes2 es es d1 r2
		d c c bes2. c4 d2. es4 f2 f d1. a2 b cis d1. d2 e \ficta e d1 r2
		\repeat volta 2 {
			d d d d1. d2 d d d1. d2 d bes d2. c4 bes2 c a a g1 \fermata
		}
	}
	\addlyrics {
		O na -- ta lux __ _ _ de lu -- mi -- ne, __ _ _ Je -- su red -- em -- ptor se -- 
		cu -- li, di -- gna -- re cle -- mens sup -- pli -- cum __ _ _ lau -- des pre -- ces -- que su -- me -- re,
		qui car -- ne quon -- dam __ _ con -- _ te -- gi di -- gna -- tus es pro per -- di -- tis,
		nos mem -- bra con -- fer ef -- fi -- ci tu -- i be -- a -- ti __ _ cor -- _ po -- ris.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		g2 g c, f2. g4 a2 a g g e1 r2 c'2 d bes c1 a2
		d2. c4 a2 b1 r2 g g f d1 g a2 f bes2. a4 g2 f es c f1 f2 bes1 a2 bes1 r2
		bes bes a f1 bes c2 d bes2. a4 bes c d2 g, g a1. a2 bes c a1 r2
		\repeat volta 2 {
			a2 a bes a1. a2 a bes a1. a2 a g f1 g2 es f2. es4 d1 \fermata
		}
	}
	\addlyrics {
		O na -- ta lux __ _ _ de lu -- mi -- ne, Je -- su red -- em -- ptor se -- 
		cu -- _ li, di -- gna -- re cle -- mens sup -- pli -- cum __ _ _ lau -- des pre -- ces -- que su -- me -- re,
		qui car -- ne quon -- dam con -- te -- gi __ _ _ _ di -- gna -- tus es pro per -- di -- tis,
		nos mem -- bra con -- fer ef -- fi -- ci tu -- i be -- a -- ti cor -- _ po -- ris.
	}
}

bassus = \new Voice {
	\relative c' {
		\clef bass
		g2 c, es d1. d2 g, bes a1. a'2 bes g a1 f2
		g2 d1 g, r2 bes c d g,1 g2 g' f d es1. d2 c c bes2. c4 d2 es c c bes1 r2
		d es f bes,1 bes2 bes' a f g1. f2 e e d1. f2 g a d,1 r2
		\repeat volta 2 {
			d f g d1. d2 f g d1. d2 d g d1 es2 c d d g,1 \fermata
		}
	}
	\addlyrics {
		O na -- ta lux de lu -- mi -- ne, Je -- su red -- em -- ptor se -- 
		cu -- li, di -- gna -- re cle -- mens sup -- _ pli -- cum lau -- des pre -- ces -- _ _ que su -- me -- re,
		qui car -- ne quon -- dam con -- _ te -- gi di -- gna -- tus es pro per -- di -- tis,
		nos mem -- bra con -- fer ef -- fi -- ci tu -- i be -- a -- ti cor -- _ po -- ris.
	}
}

\score {
	\transpose c c {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 5 12)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \superius >> 
			\new Staff << \global \discantus >> 
			\new Staff << \global \contraTenor >> 
			\new Staff << \global \tenor >> 
			\new Staff << \global \bassus >> 
		>> 
	}
	\header {
		piece = ""
	}
	\layout { }
	\midi {	}
}

