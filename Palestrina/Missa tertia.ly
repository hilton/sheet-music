% Copyright ©2016 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "1"
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
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
	ragged-bottom = ##f
	ragged-last-bottom = ##f
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		\center-column {
			"Missa tertia (O magnum mysterium)"
			\vspace #1
		}
	}
	composer = \markup \sans \column \right-align { "Giovanni Pierluigi da Palestrina (1525-1594)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year \with-url #"http://hilton.org.uk" "Peter Hilton" -
				\with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/" "CC BY-NC-SA 3.0" -
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
		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 15) (stretchability . 100))
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
	\key c \minor
	\time 3/4
	\tempo 4 = 100
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
fictaParenthesized = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##t }


% HOSANNA 1

cantus = \new Voice	{
	\relative c'' {
		R2. R R es2 d4 c2 bes4
		bes2 a4 bes2 f'4 bes, es d es2 r4 es2 d4
		
		c2 b4 c2 as4 g bes2 as4 g2 as4 g2
		f4 g2 R2. R R es'2 d4
		c2 b4 c2 as4 g8 as bes c d bes c d es4 d c2 b4
		
		c as bes c2 bes4 as2 as g g4. as8 bes4 c8 d es c d4
		c2 r4 es2 d4 c2 b4 c4 as4. g8 g2 f4 g c d
		es c d es c2 d2. ~ \time 4/4 d1 \showBarLine \bar "|."
	}
}

altusA = \new Voice {
	\relative c' {
		es2 d4 c2 bes4 c2 as4 bes4 bes'4. as8 g4 as f
		g2 f4 d4. d8 c4 es4 bes' as g2 f4 es8 f g as bes4
		
		as4 g4. f8 es2 d4 es g f es r r r es d
		c2 b4 c4 f g as bes g as2 g4 g2 r4
		as2 g4 f es f g2 f4 es4. f8 g4 as g2
		
		es4 f g c,1. R2. r4 bes'2 as4 g2
		as4 g f g4. es8 f4 es c r r r d es c2 c b4
		c4 g'2 g g4 g2. g1
	}
}

altusB = \new Voice {
	\relative c' {
		g'2 g4 f2 es4 es2 d4 es2 r4 R2.
		R r4 bes' as g2 f4 es8 f g as bes4 as g4. f8
		
		es4. d16 c d4 c d f bes,2. c2 d4 es r r
		R2. as2 g4 f2 e4 f2 d4 es c d
		es f d c4. bes8 c d es4 bes bes' as g4. f8 es4 d2
		
		c4 r r as'2 g4 f2 es4 f d2 c4 g' f es2 d4
		es2 c4 bes bes' bes g2 g4 es f d c2 r4 es2 d4
		c2 b4 c es2 d2. ~ d1
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		R2. R R g'2 f4 es2 d4
		es2 c4 bes g as bes2 r4 es2 d4 c2 bes4
		
		c4. bes8 g4 as4. g8 f4 es r r es'2 d4 c2 b4
		c4 d4. es8 f4 c2 c4 des c c as bes c2 r4
		R2. R es2 d4 c2 b4 c g2
		
		c4 c d f f, g as4. bes8 c4 f, g2 es' d4 c2 b4
		c2 as4 g2 r4 es'2 d4 c2 b4 c as2 g2.
		es'2 d4 c2. b2. ~ b1
	}
}


bassus = \new Voice {
	\relative c' {
		\clef bass
		c2 bes4 as2 g4 as2 f4 es8 f g as bes4 c as bes
		es,2 f4 g4. es8 f4 es2 r4 R2. R 
		
		R R es2 d4 c2 b4 c8 d es f g4
		as4 g2 f e4 f bes, c f2 g4 c,4 c' bes
		as f g as4. g8 f4 es2 r4 R2. R
		
		as2 g4 f2 e4 f4. g8 as bes c2 b4 c r r R2. 
		R es,2 bes'4 c2 g4 as f g c, f2 c g'4
		c,4 c g' c, c2 g'2. ~ g1
	}
}

\score {
	\transpose c c {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 10)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \cantus \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >> 
			\new Staff << \global \altusA \set Staff.instrumentName = #"A1" \set Staff.shortInstrumentName = #"A1" >> 
			\new Staff << \global \altusB \set Staff.instrumentName = #"A2" \set Staff.shortInstrumentName = #"A2" >> 
			\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >> 
			\new Staff << \global \bassus \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\header {
		piece = \markup \sans { "Hosanna 1" }
	}
	\layout { }
%	\midi {	}
}


% HOSANNA 2

cantus = \new Voice	{
	\relative c'' {
		R2. R R es2 d4 c2 b4 c2 as4
		g2 c4 bes4. as8 bes4 c2 r4 R2. R es2 d4 c2 bes4
				
		c2 as4 g2 c4 bes4. as8 c4 bes2 a4 bes2. ~ bes2 r4 R2.
		R es2 d4 c2 b4 c as g c2 b4 c2 r4 es2 d4
		c2 c4 bes2 r4 es2 d4 c2 b4 c2 c4 \time 4/4 d1 \showBarLine \bar "|."
	}
}

altusA = \new Voice {
	\relative c' {
		bes'2 bes4 as2 g4 g2 f4 g2 r4 R2. R
		bes2 as4 g2 f4 es'4. f8 g4 as2 g4 f2 r4 R2. as2 g4
		
		f es f d4. es8 c4 es4 d c d es2 r4 f es d2 c4 bes2 c4
		bes bes'2 bes r4 as2 g4 f2 e4 f2 d4 c g' f es4. c8 d4
		es2 c4 r es d c2 b4 c2 d4 es2 es4 d1
	}
}

altusB = \new Voice {
	\relative c' {
		g'2 f4 es2 d4 es2 c4 bes bes' bes g2 g4 es2 f4
		bes,2 r4 es2 d4 c2 bes4 f'2 g4 as2 f4 as g4. f8 es d es4. d8

		c bes c2 bes4 bes' as g2 f4 g2 es4 d4. es16 f g4 f2 r4 bes2 as4
		g2 f4 g2. es4 f d c c'4. bes8 as2 g4 g r bes as g2
		as4 g8 es f4 g g f es g2 g g4 g2. ~ g1
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		es2 d4 c2 b4 c2 as4 g g' f es2 d4 c as8 bes c d
		es2 as,4 es2 r4 r es'2 d4 c2 c4 as bes c c b c4. d8 es4

		as,2 f4 g2 as4 es g as g c2 bes r4 r f'2 es4 d f
		es4. d16 c d4 es4. d8 bes4 c2 r4 R2. R es2 d4 c2 b4
		c2 as4 g4. as8 bes4 g2 r4 es'2 d4 c2. b1
	}
}


bassus = \new Voice {
	\relative c {
		\clef bass
		R2. R R es2 bes'4 c2 g4 as2 f4
		es2 r4 R2. as2 g4 f2 e4 f2 des4 c8 \ficta d! es f g4 as2 es4
		
		R2. R R R R bes'2 as4 g2 f4
		g es bes' es,4. f8 g4 as4 f g as f c' f,2 g4 c,2 r4 R2.
		R es2 bes4 c8 d es f g4 c,2 g'4 c,2 c4 g'1
	}
}

\score {
	\transpose c c {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 10)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \cantus \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >> 
			\new Staff << \global \altusA \set Staff.instrumentName = #"A1" \set Staff.shortInstrumentName = #"A1" >> 
			\new Staff << \global \altusB \set Staff.instrumentName = #"A2" \set Staff.shortInstrumentName = #"A2" >> 
			\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >> 
			\new Staff << \global \bassus \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\header {
		piece = \markup \sans { "Hosanna 2" }
	}
	\layout { }
%	\midi {	}
}
