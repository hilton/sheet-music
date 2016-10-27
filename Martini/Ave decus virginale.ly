% CPDL #40671
% Copyright ©2016 Peter Hilton - https://github.com/hilton
% Based on CPDL #30531

\version "2.18.2"
revision = "4"
\pointAndClickOff

#(set-global-staff-size 15.0)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 10\mm
	bottom-margin = 10\mm
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 4) )
	markup-system-spacing = #'( (padding . 4) )
	system-system-spacing = #'( (basic-distance . 15) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##f
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		\center-column {
			"Ave decus virginale"
			\vspace #1
		}
	}
	composer = \markup \sans \column \right-align { "Johannes Martini (1440 - 1497)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year \with-url #"http://hilton.org.uk" "Peter Hilton" -
				\with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/" "CC BY-NC-SA 3.0" -
				Lilypond source \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - 
				revision \revision 
			}
		}
	}
	tagline = \markup { 
		\vspace #2
		\column {
			\line { Hail, virginal honour, special temple of God, through you may all the sins we commit be pardoned. }
			\line { You are extraordinary to us, may you lead us, star of the sea, may you always watch over us, look, we take refuge in you. }
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
	\tempo 2 = 60
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
singleDigitTime = { \override Staff.TimeSignature.style = #'single-digit }

soprano = \new Voice	{
	\relative c'' {
		g2. f8 e d2. e4 f2. e8 d e1 d r2 f g2. f4 f2 g a bes c4. bes8 a4 g f2 g4 a4. g8 g2 f4 |
		g2 r g a1 f2 g c d bes1 a2 bes r g a bes1 a2 d1 c2 d4 bes4. a8 a2
		g8 f g2 a bes4 a2 g8 f e2 d r bes' a g c bes4 a4. g8 g2 f4 g2 r1 | r
		
		\singleDigitTime
		r | \time 3/2 r1. g2 g a bes1 a2 d1 c2 d bes c \[ f, g a1 g \] f e2 |
		f1 g2 a2. g4 bes2. a4 c2. bes4 bes1 a2 bes1 r2 g1 a2 bes1 a2 g d f1 e |
		d r2 bes'1 a2 g c1 bes2 a1 g2 r f g bes a bes a2. g4 g1 f2 g1. | \showBarLine \bar "|."
	}
	\addlyrics {
		A -- _ _ ve __ _ _ _ _ de -- cus vir -- gi -- _ ná -- _ _ _ _ _ _ _ _ _ _ _ le, __ _ _
		tem -- plum Dé -- i spe -- ci -- á -- _ le, 
		per te fi -- at ve -- _ _ _ _ ni -- _ _ _ _ _ á -- _ _ _ le
		om -- ne quod com -- _ mít -- _ ti -- _ mus.
		Tu no -- bis es sin -- gu -- _ lá -- _ _ _ _ _ ris,
		tu nos dú -- cas, stel -- _ _ _ la __ _ ma -- _ ris,
		tu nos sem -- per tu -- _ e -- á -- ris,
		en, ad te con -- fú -- gi -- mus,
		con -- _ fú -- _ _ _ _ gi -- _ mus.
	}
}

alto = \new Voice {
	\relative c' {
		r1 r r g2 a bes1 a2 d c1 d\breve g,1 a2 bes4 a f g a2 |
		g4. a8 bes4. c8 d4. e8 f2 c d e1 d2 f1 f2 d bes c2. bes8 a g2 g' f d4 g2 f4 e2 d f |
		d e d1 r2 a a2. bes c2 bes4 d2 c4 d e4. d8 d2 c4 d2 c bes | g 
	
		\singleDigitTime
		r2 r1 |	g2 g a bes1 a2 d1 c2 d4 e f g e2 d1 c2 d bes c f, g2. f4 a1. |
		\[ bes1 f' \] \[ f2 d e f \] \[ d2. e4 f1 \] d c2 d2. e4 f2 g1 f2 d2. c4 d2 a2. g4 a2 |
		f1 f'2 g1 f4 e d2 e f d c a bes4 c d1 d d2 d1 d2 e d1 d1. |
	}
	\addlyrics {
		A -- ve de -- _ _ cus vir -- gi -- ná -- _ _ _ _ le,
		tem -- _ _ _ _ _ plum Dé -- _ i spe -- ci -- á -- _ le,
		per __ _ _ te fi -- at __ _ ve -- _ ni -- _ á -- _ _ le
		om -- ne quod com -- _ _ _ _ _ _ mít -- _ _ ti -- _ mus.
		Tu no -- bis es __ _ sin -- gu -- lá -- _ _ _ _ _ _ _ _ _ ris,
		tu __ _ nos dú -- cas, stel -- _ la __ _ ma -- _ ris,
		tu __ _ nos __ _ _ sem -- per tu -- _ _ e -- _ _ á -- ris,
		en, __ _ _ ad __ _ _ te __ _ ad te __ _ con -- fú -- gi -- mus,
		con -- fú -- gi -- mus.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		r1 r r r r r g2 a bes1 a2 d c1 d d2 r |
		d2. d4 d2 c1 bes a2 bes d c1 bes r r r r g2 a |
		bes1 a2 d c1 d d2 r r1 r r2 bes a g | c
		
		\singleDigitTime
		bes4 a2 g f4 | g1 r2 r1. r r g2 g a bes1 a2 d c2. bes4 d1 r2 |
		d1 d2 \[ c1 bes a2 bes \] d c1 bes r2 r1. g1 a2 bes1 a2 d1 c2 |
		d1 d2 r1. bes1 a2 g c1 bes2 a2. g4 g1 f2 g a bes c a1 g1. |
		
	}
	\addlyrics {
		A -- ve de -- cus vir -- gi -- ná -- le,
		tem -- plum Dé -- i spe -- ci -- á -- _ _ le,
		per te fi -- at ve -- ni -- á -- le
		om -- ne quod com -- _ mít -- ti -- _ mus.
		Tu no -- bis es __ _ sin -- gu -- lá -- ris,
		tu nos dú -- cas, stel -- la ma -- _ ris,
		tu nos sem -- per tu -- e -- á -- ris,
		en, ad te con -- _ fú -- _ gi -- _ mus. __ _ _ _ _ _
	}
}

bass = \new Voice {
	\relative c {
		\clef bass
		g2 a bes1 a2 d c1 d2 g f d e2. d8 c bes2 g d'1 e d2 g4 f2 e4 d2 |
		g2. a4 bes2 f1 d2 c1 bes f' g c, g'2. f8 e d2 g, g'2 a bes f |
		g1 d a' d,2. bes f'2 g4 bes a2 g4 c2 bes4 a2 g4 g2 f4 g e2 c4
		
		\singleDigitTime
		d2 c4 bes a2 | g1 r2 r1. r g2 g a bes1 a2 \[ d g f d e1 \] d1. |
		bes1 bes2 \[ f'1 g \] \[ f2 g bes f1 \] g2 g a bes1 a2 g e f g1 d a |
		bes1. g1 d'2 g1 f2 g a f g d1 g, d'2 g f g c, d1 g,1. |
	}
	\addlyrics {
		A -- ve de -- cus __ _ vir -- gi -- _ ná -- _ _ _ _ _ _ _ _ le, __ _ _ _ _
		tem -- _ _ plum __ _ Dé -- i spe -- _ ci -- á -- _ _ le,
		per te __ _ fi -- at ve -- ni -- _ á -- le
		om -- _ _ ne __ _ quod __ _ com -- _ mít -- _ _ ti -- _ _ _ _ _ mus.
		Tu no -- bis es __ _ sin -- _ gu -- _ lá -- ris,
		tu nos dú -- cas, stel -- _ _ la ma -- ris,
		tu nos __ _ sem -- _ _ per tu -- e -- á -- ris,
		en, ad __ _ te __ _ con -- fú -- _ gi -- _ mus. __ _ _ _ _ _
	}
}

\score {
	\transpose c c {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >> 
			\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >> 
			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\layout { }
	\midi {	}
}
