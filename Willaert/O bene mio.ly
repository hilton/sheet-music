% CPDL #48971
% Copyright ©2018 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "7"
\pointAndClickOff

#(set-global-staff-size 15.0)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	top-margin = 10\mm
	bottom-margin = 10\mm
	left-margin = 15\mm
	right-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 10) )
	markup-system-spacing = #'( (padding . 10) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 50) )
 	ragged-bottom = ##f
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		\center-column {
			"O bene mio"
			\vspace #1
		}
	}
	composer = \markup \sans \column \right-align { "Adrian Willaert (c. 1490 - 1562)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year \with-url #"http://hilton.org.uk" "Peter Hilton" - 
				\with-url #"http://www.cpdl.org/wiki/index.php/O_bene_mio_(Adrian_Willaert)" "CPDL #48971" -
				Lilypond source \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music -
				rev \revision - This work is licensed under
			}
      \line {
				the CC Attribution-NonCommercial-ShareAlike 4.0 International License published at \with-url #"http://creativecommons.org/licenses/by-nc-sa/4.0/" "http://creativecommons.org/licenses/by-nc-sa/4.0/"
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
		\override BarLine #'transparent = ##t
		\remove "Metronome_mark_engraver"
		\override VerticalAxisGroup #'staff-staff-spacing = #'((padding . 10) (stretchability . 100))
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
	\time 4/2
	\tempo 2 = 80
	\set Staff.midiInstrument = "acoustic guitar (nylon)"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }

stanzaA = \lyricmode {
	\set stanza = #"1. "
	\repeat unfold 2 { O be -- ne mi -- o fa fam -- m’u -- no fa -- vo -- re, }
	Che que -- sta se -- ra ti pos -- sa par -- la -- re, ti pos -- sa par -- la -- re.
}

stanzaB = \lyricmode {
	\set stanza = #"2. "
	\repeat unfold 2 { Vi -- e -- ni sen -- za pa pau -- "ra e" non bus -- sa -- re, }
	But -- ta la por -- ta che po -- rai en -- tra -- re, che po -- rai en -- tra -- re.
}

stanzaC = \lyricmode {
	\set stanza = #"3. "
	\repeat unfold 2 { Al -- la fi -- ne -- "stra in" -- si si -- "no al" -- le du -- "e o" -- re, }
	Fa -- rò la spi -- a che po -- rai en -- tra -- re, che po -- rai en -- tra -- re.
}

refrain = \lyricmode {
	\repeat unfold 2 { E s’al -- cu -- no ti ci tro -- va e tu gri -- da, e tu gri -- da, 
	‘chi ven -- d’o -- va, chi ven -- d’o -- va, chi ven -- d’o -- va. }
}

soprano = \new Voice	{
	\relative c' {
		\repeat unfold 2 { d2 f2. g4 f2 e d f2. f4 e2. e4 d2 c }
		d d2. e4 f2 d e4 f g f e2 d d4 e f e d2 \time 3/2 \ficta cis r2 e4 e \time 4/2
		\repeat unfold 2 { f2 d d4 c c2 b d4 e f2 e f4 g a2 g bes1 g2 a f g e f d e f e1 }
		\alternative {
			{ \time 2/2 d2 e4 e \time 4/2 }
			{ d\breve \showBarLine \bar "|." }
		}
	}
	\addlyrics { \stanzaA \refrain }
	\addlyrics { \stanzaB }
	\addlyrics { \stanzaC }
}

alto = \new Voice	{
	\relative c' {
		\repeat unfold 2 { b2 d2. d4 d2 cis r4 d d2 \ficta c! c2. c4 b2 c }
		b g2. g4 d'2 a cis4 d d d \ficta cis2 d4 b2 c4 a g f2 e r cis'4 \ficta cis
		
		\repeat unfold 2 { d2 b b4 c a2 d b4 c a2 g d'4 e f2 e r 
		d e f d e2. e4 d2 f e d4 d2 \ficta cis8 b \ficta cis2 }
		\alternative {
			{ d2 cis4 \ficta cis }
			{ d\breve }
		}
	}
	\addlyrics {
		\stanzaA		
		
		\repeat unfold 2 { E s’al -- cu -- no ti ci tro -- va e tu gri -- da, e tu gri -- da, 
		‘chi ven -- d’o -- va, chi ven -- d’o -- va, chi ven -- d’o -- _ _ _ va. }
	}
	\addlyrics { \stanzaB }
	\addlyrics { \stanzaC }
}

tenor = \new Voice	{
	\relative c' {
		\clef "treble_8"
		\repeat unfold 2 { g2 a2. bes4 a2 a f \ficta bes a a4 a g1 e2 }
		g b2. c4 a2 f a4 a b a a2 a4 g2 g4 c c a2 a r a4 a
		\repeat unfold 2 { a2 g g4 e f2 d g4 g c2 c a4 c c2 c d1 c2 c a b c a2. a4 c2 a a1 }
		\alternative {
			{ a2 a4 a }
			{ a\breve }
		}
	}
	\addlyrics { \stanzaA \refrain }
	\addlyrics { \stanzaB }
	\addlyrics { \stanzaC }
}

bass = \new Voice	{
	\relative c {
		\clef bass
		\repeat unfold 2 { g2 d'2. g,4 d'2 a bes1 f2 a c4 c g2 c }
		g g2. c4 d2 d a4 d g, d' a2 d4 g,2 c4 f, c' d2 a r a4 a
		\repeat unfold 2 { d2 g, g4 a f2 g g4 c f,2 c' d4 c f2 c g'1 c,2 f f e a, d d a d a1 }
		\alternative {
			{ d2 a4 a }
			{ d\breve }
		}
	}
	\addlyrics { \stanzaA \refrain }
	\addlyrics { \stanzaB }
	\addlyrics { \stanzaC }
}

\score {
	\transpose c d {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 4)
			\new Staff << \global \soprano \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >> 
			\new Staff << \global \alto \set Staff.instrumentName = #"A" \set Staff.shortInstrumentName = #"A" >> 
			\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >> 
			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\header {
		piece = ""
	}
	\layout { }
	\midi {	}
}
