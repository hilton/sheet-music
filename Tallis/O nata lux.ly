% CPDL #
% Copyright ©2014 Peter Hilton - https://github.com/hilton

\version "2.20.0"
revision = "4"
%\pointAndClickOff

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
			\line {
				Licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International license - \with-url #"https://creativecommons.org/licenses/by-nc-sa/4.0/" https://creativecommons.org/licenses/by-nc-sa/4.0/
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
	\time 6/4
	\tempo 4 = 96
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
fictaParenthesized = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##t }

superius = \new Voice	{
	\relative c'' {
		d4 es c d2. a4 bes g a2 e'4 f d e2 c4 d 
		bes a2 g r4 d' c a bes2. \break bes4 a a g4. f8 g a bes4 c c d2. bes4 c c d2 r4
		f es c d2. d4 c a bes2. \break a4 g e a2. d4 d cis d2 r4 
		\showBarLine 
		\repeat volta 2 {
			a a g a2. a4 a g a2. d4 a bes a2 g4 g2 fis4 g2. \fermata
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
		g4 g g f4. e8 d4 d d d e4. d8 cis4 \ficta c'! bes bes a2 a4
		g2 \ficta fis4 g2 r4 d e \ficta f g2. d4 f f es2. bes4 es es d4. es8 f4 g g c, f2 r4
		f g a bes2. f4 a a g2. d4 e e f4. e8 f g a4 g e fis2 r4
		\repeat volta 2 {
			\ficta f! f d f2. f4 f d f2. f4 f d f2 es d4 d b2. \fermata
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
		bes4 c g a4. g8 f4 f d d' cis4. \ficta b8 a2 f'4 g e f2
		bes,4 d d d2 r4 bes a a g2. bes4 c d g,4. a8 bes4 bes bes a bes2. bes4 es es d2 r4
		d c c bes4. c8 d4. es8 f4 f d2. a4 b cis d2. d4 e \ficta e d2 r4
		\repeat volta 2 {
			d d d d2. d4 d d d2. d4 d bes d4. c8 bes4 c a a g2. \fermata
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
		g4 g c, f4. g8 a4 a g g e2 r4 c'4 d bes c2 a4
		d4. c8 a4 b2 r4 g g f d2 g4 ~ g a4 f bes4. a8 g4 f es c f2 f4 bes2 a4 bes2 r4
		bes bes a f2 bes c4 d bes4. a8 bes c d4 g, g a2. a4 bes c? a2 r4
		\repeat volta 2 {
			a4 a bes a2. a4 a bes a2. a4 a g f2 g4 es f4. es8 d2. \fermata
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
		g4 c, es d2. d4 g, bes a2. a'4 bes g a2 f4
		g4 d2 g, r4 bes c d g,2 g4 g' f d es2. d4 c c bes4. c8 d4 es c c bes2 r4
		d es f bes,2 bes4 bes' a f g2. f4 e e d2. f4 g a d,2 r4
		\repeat volta 2 {
			d f g d2. d4 f g d2. d4 d g d2 es4 c d d g,2. \fermata
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
