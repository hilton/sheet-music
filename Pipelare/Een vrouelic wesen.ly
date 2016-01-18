% CPDL #38204
% Copyright ©2015 Peter Hilton - https://github.com/hilton

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
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		\center-column {
			"Een vrouelic wesen"
			\vspace #1
		}
	}
	composer = \markup \sans \column \right-align { "Mattheus Pipelare (1450-1515)" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				\with-url #"http://www.cpdl.org/wiki/index.php/Een_vrouelic_wesen_(Matthaeus_Pipelare)" "CPDL #38204" -
				Transcription & IPA copyright \year \with-url #"http://hilton.org.uk" "Peter Hilton" -
				\with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/" "CC BY-NC-SA 3.0" -
				Lilypond source at \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - 
				revision \revision 
			}
		}
	}
	tagline = \markup \larger { 
		\vspace #2
		\fill-line {
			\hspace #1
			\column {
				\line { Een vrouelic wesen mijn oogskins saghen, }
				\line { Wien ic ghetrauwicheijt moet thoescriven. }
				\line { Al wilt mij haer jonst uut liefden driven, }
				\line { Naer dese gheen ander om mij te behaghen. }
			}
			\hspace #1
			\column \sans {
				\line { ən 'vrɑuwələk 'wezən min 'oɣ̟skəns 'saɣ̟ən }
				\line { win ɪk ɣ̟ə'trɑuwəɣ̟hɛit mut 'tuskrivən }
				\line { ɑl wɪlt mi har jɔnst yt 'lifdən 'drivən }
				\line { nar dezə ɣ̟en 'ɑndər ɔm mi tə bə'haɣ̟ən }
			}
			\hspace #1
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
	\key f \major
	\time 4/2
	\tempo 2 = 65
	\set Staff.midiInstrument = "Choir Aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##f }
fictaParenthesized = { \once \set suggestAccidentals = ##t \override AccidentalSuggestion #'parenthesized = ##t }

superius = \new Voice	{
	\relative c'' {
		g1 g2 g bes2. a4 g2 f bes a g4 g2 f8 \ficta es |
		d2 \ficta es4 d r f4. g8 a4 ~ \break a8 f8 bes2 a8 g \ficta fis4 g2 \ficta fis4 | g1 r2 g |
		a2. a4 a2 a | d d c4. bes8 a4 g | f4. g8 a bes c4. bes8 bes2 a4 |
		bes\breve | r2 f bes a | c c bes bes |

		a a g2. f8 e | f4 g8 a bes a g f e4 f g bes | a c bes a2 g8 f e2 |
		d1 r2 f | g a bes c \break d c bes2. a8 g |
		a2 bes4 a g bes a g | bes4. a8 g4 f r c' bes a8 g |
		f4 g d e f g a bes | c f, g a bes a4. g8 g2 \ficta fis8 e \ficta fis2 g1 \showBarLine \bar "|."
	}
	\addlyrics {
		Een vrou -- e -- lic __ _ _ _ we -- _ sen mijn __ _ _ oog -- skins __ _ sa -- _ _ _ _ _ _ _ _ _ ghen,
		Wien ic ghe -- trauw -- ich -- eijt moet thoe -- _ _ _ scri -- _ _ _ _ _ _ _ ven.
		Al wilt __ _ mij haer jonst uut lief -- den dri -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ven,
		Naer de -- se gheen __ _ an -- der om __ _ _ _ mij __ _ te be -- _ _ ha -- _ _ ghen,
		om mij __ _ _ _ _ te __ _ be -- _ _ _ ha -- _ _ _ _ _ _ _ _ _ _ ghen.
	}
}

counterTenor = \new Voice {
	\relative c' {
		d2. c4 d2 e d r4 d2 \ficta cis4 d2. c8 bes c2 bes g |
		g4 bes4. c8 d e f4 r r2 | a,4 f'2 e4 e c d2 | r4 d2 \ficta es d8 c bes4 d ~ d
		c8 bes a1 d2 | d d f4 \ficta es8 d c2 | d c4 f2 e4 f2 |
		d4 f4. e8 d c bes1 c2 f,1 r2 r a bes2. d4.
		
		e8 f4. e8 d2 \ficta cis8 \ficta b \ficta cis2 | d r4 d c a bes8 c d e | f4. e8 d c f4. e8 d2 \ficta cis4 |
		d4 f2 e8 d e2 d1 d2. c8 bes a2 g4 g'2 \ficta fis4 g2. f8 \ficta es |
		f \ficta es d c bes4 f g2 r2 g4. a8 bes c d4. e8 f4 d2 ~ d
		r2 d c4 bes | a2 r4 a g f'4. \ficta es8 d2 c4 d2 d1 |
	}
	\addlyrics {
		Een __ _ vrou -- e -- lic, vrou -- e -- lic we -- _ sen mijn oog -- skins __ _ _ _ _ _ sa -- _ _ _ _ ghen,
		Wien ic __ _ _ _ _ ghe -- _ trauw -- ich -- eijt moet thoe -- _ _ _ scri -- _ _ _ _ _ _ _ _ _ _ _ ven,
		haer jonst uut __ _ _ _ lief -- _ _ _ den dri -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ven, __ _ _ _
		Naer de -- se __ _ gheen an -- _ der om __ _ _ _ _ _ _ mij __ _ te be -- _ _ _ ha -- _ _ ghen,
		be -- ha -- _ ghen, be -- _ ha -- _ _ _ _ ghen.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		g2. a4 bes2 c | g r4 a bes g a2 | g a bes c |
		bes g4 bes2 a8 g a g f e | d4 d'2 c8 bes a4 g a2 | g4 bes4. a8 g2 \ficta fis4 g \ficta f!8 e |
		d2 f f f bes bes a4 f2 g4 | a2. f4 bes2 c |
		bes f4 bes4. c8 d4. c8 bes4 ~ bes a4 bes2. a8 g f4 a4. g8 f e f2 g1 |

		f g | a2 r a g | f g4 d f g a2 |
		f4. g8 a f bes2 a4 bes1 a2 g f | bes c d1 |
		r4 d2 c4 bes a8 g f4 bes4 ~ bes8 a8 g f g4 a4. bes8 c a bes2 |
		a4 bes4. a8 g4 f bes c d | c bes8 a g4 c bes d c bes g2 a g1 |
	}
	\addlyrics {
		Een __ _ vrou -- e -- lic, een vrou -- e -- lic we -- sen mijn oog -- skins __ _ sa -- _ _ _ _ _ _ _ _ _ _ _ _ _ ghen,
		Wien __ _ _ _ _ _ _ ic ghe -- trauw -- ich -- eijt moet thoe -- _ _ scri -- _ _ _ ven.
		Al wilt __ _ _ _ mij __ _ haer __ _ _ jonst uut __ _ _ _ _ lief -- den dri -- ven,
		dri -- _ _ _ _ _ _ _ _ _ _ _ _ _ ven,
		Naer de -- se gheen an -- der om mij __ _ _ _ te be -- _ _ _ _ ha -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ghen.
	}
}


bass = \new Voice {
	\relative c' {
		\clef bass
		R\breve r4 g2 f4 g e d2 | r4 g2 f4 g2 c, |
		g'1 d | r4 bes2 c4 d \ficta es d2 | g,4. a8 bes4 c a2 g |
		r2 d' d d | g, bes f4 f'2 e4 | d2 f g f |
		bes,1 r4 bes d es | c2 bes1 d2 | c a g1 |

		d' e | d r | R\breve |
		d2. c8 bes c2 bes g d' g,4 g' a c | bes g a2 g1 |
		d2 r r1 r4 g2 d4 f2 g |
		d4 g, bes c d c8 bes a4 g | r d' e f g d f g | es2 d g,1 |
	}
	\addlyrics {
		Een __ _ vrou -- e -- lic we -- sen mijn oog -- skins __ _ sa -- _ _ _ _ _ _ _ _ _ ghen,
		ghe -- trauw -- ich -- eijt moet thoe -- _ _ scri -- _ _ _ ven.
		Al wilt __ _ mij haer jonst uut __ _ lief -- den dri -- ven,
		Naer __ _ _ _ _ de -- se gheen __ _ an -- _ _ _ _ _ der om __ _ mij __ _ te be -- ha -- _ _ _ _ _ ghen,
		be -- _ ha -- _ _ _ _ _ _ ghen.
	}
}

\score {
	\transpose c d {
		\new StaffGroup << 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\set Score.barNumberVisibility = #all-bar-numbers-visible
			\new Staff << \global \superius \set Staff.instrumentName = #"S" \set Staff.shortInstrumentName = #"S" >> 
			\new Staff << \global \counterTenor \set Staff.instrumentName = #"CT" \set Staff.shortInstrumentName = #"CT" >> 
			\new Staff << \global \tenor \set Staff.instrumentName = #"T" \set Staff.shortInstrumentName = #"T" >> 
			\new Staff << \global \bass \set Staff.instrumentName = #"B" \set Staff.shortInstrumentName = #"B" >> 
		>> 
	}
	\header {
		piece = ""
	}
	\layout { }
%	\midi {	}
}

