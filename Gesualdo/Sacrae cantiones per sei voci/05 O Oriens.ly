% Copyright ©2013 Peter Hilton

\version "2.16.2"
revision = "1"

#(set-global-staff-size 15.5)
#(set-accidental-style 'forget)
#(define fonts (make-pango-font-tree "Century Schoolbook L" "Open Sans Light" "Luxi Mono" (/ 15.5 20)))


\paper {
	annotate-spacing = ##f
	two-sided = ##t
	inner-margin = 15\mm
	outer-margin = 10\mm
	top-markup-spacing = #'( (basic-distance . 4) )
	markup-system-spacing = #'( (padding . 5) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \sans {
		5. O Oriens
	}
	subtitle = \markup \medium \sans {
		Sacræ cantiones per sei voci - liber secundus
	}
	composer = \markup \sans {
		\vspace #2
		\column {
			\line { Carlo Gesualdo (1603) }
			\line { Sextus & bassus, Joop Voorn (2005) }
		}
	}
	copyright = \markup \sans {
		\vspace #6
		\column \center-align {
			\line {
				This edition copyright \year Peter Hilton - 
				Lilypond source at \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - 
				revision \revision 
			}
			\line { Sextus & bassus copyright ©2005 Joop Voorn }
		}
	}
	tagline = ##f
}

\layout {
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
	}
}


global= { 
	\key c \major
	\tempo 2 = 90
	\time 2/2
	\set Staff.midiInstrument = "choir aahs"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t }


cantus = \new Voice {
	\transpose c c \relative c' {
		e2. e'4. e8 c4 a8 b c a d4 c8 b c2 b r r4 b2 e4 ~
		e8 e c4 d4. c16 d e2 a, r4 e b'4. b8 cis4 d4. cis16 d e4 a,2 r
		
		g8 a bes g c a \once \override HorizontalBracket #'direction = #UP d2\startGroup c\stopGroup b4 c2 r r4 c8 bes a g f4 e2. d4
		d2. d4 e4. f8 g a b2 a g4 g2 g4 d a'4. a8 g4 d8 e fis d g2 \ficta fis4
		g1 r4 b e4. e8 a,2 r a4. b8 c a c2 a g8 f e d c4 e g
	}
	\addlyrics {
		O O -- ri -- ens, splen -- _ _ _ _ _ _ _ dor, O O -- 
		ri -- ens, splen -- _ _ _ dor, O O -- ri -- ens, splen -- _ _ _ dor,
		
		splen -- _ _ _ _ _ _ _ _ dor lu -- _ _ _ _ cis æ -- 
		ter -- næ, lu -- _ _ _ _ cis æ -- ter -- næ, O O -- ri -- ens, splen -- _ _ _ _ _
		dor, O O -- ri -- ens, splen -- _ _ _ _ dor lu -- _ _ _ _ cis æ --
	}
}

sextus = \new Voice {
	\transpose c c \relative c' {
		r2 e e'4. e8 c2 b8 c d4 c4. b16 a g4. f16 g a4 g8 a b4 g r2
		r d4 g4. g8 e4 f4. e16 f e8 f g4 g2 g4 f8 g a2 a8 b c a c4 a8 d ~
		
		d8 c bes4 a2 R1 r4 a8 b c a d2 c4 c8 bes a4 r a a2
		a d,8 e f g a4 c g4. g8 e2 r r d8 c d e f2 d r a'
		g4 f! e4. d8 c d e fis g4 g fis fis4. e16 fis g4 e2 e8 f! g e a4. g8 f e16 d e4 c'4. b8 a g16 f e8 e
	}
	\addlyrics {
		O O -- ri -- ens, splen -- _ _ _ _ _ _ _ _ _ _ _ _ dor, 
		O O -- ri -- ens, splen -- _ _ _ _ dor, O O -- _ ri -- ens, splen -- _ _ _ _ _ _
		
		_ _ dor, splen -- _ _ _ _ dor lu -- _ cis æ -- ter --
		næ, lu -- _ _ _ cis, O O -- ri -- ens, splen -- _ _ _ _ dor, splen -- 
		_ _ dor, O O -- _ _ _ _ ri -- ens, splen -- _ _ _ dor, splen -- _ _ _ _ _ _ _ _ dor, lu -- _ _ _ _ cis æ -- 
	}
}

altus = {
	\new Voice = "altus" {
		\transpose c c \relative c' {
			\clef "treble_8"
			R1 R g4 g'4. g8 e2 e,4 e'4. e8 g1 ~
			g2 r g,4. f16 g a2 c4 b8 c d b e2 d4 e2 f4. f8 e4 f ~
			
			f8 e16 f g8 d f2 g1 e8 d c b a2 g4 a a2 a1
			R1 r2 b4 e4. e8 c4 d4. c16 d e2 b a4. g16 a b2 d1
			b8 c d b c4. b16 a g1 a2 g4. fis16 g a4 e' e8 d c b a2 c4 c c2 c
		}
	}
	\addlyrics {
		O O -- ri -- ens, O O -- ri -- ens, 
		splen -- _ _ _ dor, splen -- _ _ _ _ dor, O O -- ri -- ens, splen --
		
		_ _ _ _ _ dor lu -- _ _ _ _ cis æ -- ter -- næ,
		O O -- ri -- ens, splen -- _ _ _ dor, splen -- _ _ _ dor,
		splen -- _ _ _ _ _ _ _ _dor, splen -- _ _ _ dor lu -- _ _ _ _ cis æ -- ter -- næ:
	}
}

quintus = {
	\new Voice = "quintus" {
		\transpose c c \relative c {
			\clef "treble_8"
			R1 R R R r2 e 
			e'4. e8 d2 r4 c4. b16 c d4 g,2 r r4 d a'4. a8 f4 c4. b16 c d4
			
			g2 r g d'4. d8 c4 e4. e8 d4 e4. d16 e f4 c2 c4. b8 a g
			f1 e4 e e2 e d4 d'4. d8 c4 g8 a b c d2. b4 b4. b8 a2
			d,4. c16 d e2 e'1 r2 r4 e4. d8 c b a4 e f f2 e8 d e2 e4 c8 d
		}
	}
	\addlyrics {
		O O -- ri -- ens, splen -- _ _ _ dor, O O -- ri -- ens, splen -- _ _ _
		
		dor, O O -- ri -- ens, O -- ri -- ens, splen -- _ _ _ dor, lu -- _ _ _ 
		_ cis æ -- ter -- næ, O O -- ri -- ens, splen -- _ _ _ _ dor, O -- ri -- ens,
		splen -- _ _ _ dor, lu -- _ _ _ _ cis æ -- ter -- _ _ _ næ, lu -- 
	}
}

tenor = {
	\new Voice = "tenor" {
		\transpose c c \relative c {
			\clef "treble_8"
			R1 R r2 e e'4. e8 c2 b8 c d b e4. d16 c
			b8 a16 b c2 b4 c2 r c,4 g'4. g8 e2 a c4. c8 a4 r d,
			
			d'4. d8 c4 a8 g16 a b4 e r2 r4 e,4. d16 e f4 e2 r r r4 f8 g
			a b c2 b4 c b8 a g fis g2 fis8 e b'2 g4 g g2 d r r d
			g4. g8 c,4 c'4. b16 cis d2 \ficta cis4 d2 b r e,4 e'4. e8 d4 r g,4. fis16 g a2 g4 ~
		}
	}
	\addlyrics {
		O O -- ri -- ens, splen -- _ _ _ _ _ _
		_ _ _ _ _ dor, O O -- ri -- ens, O O -- ri -- ens, O
		
		O -- ri -- ens, splen -- _ _ _ dor, splen -- _ _ _ dor, lu -- _ 
		_ _ _ _ cis, lu -- _ _ _ _ _ _ _ cis æ -- ter -- næ, O
		O -- ri -- ens, splen -- _ _ _ _ _ dor, O -- ri -- ens, splen -- _ _ _ _
	}
}

bassus = {
	\new Voice = "bassus" {
		\transpose c c \relative c {
			\clef "bass"
			R1 R R R g2 g'4. g8 
			e2 g c, f g g,4 g'4. g8 d4 r2 f a4. a8
			
			bes2 f4 e8 d g,1 a2 f8 g a b c2 f4 e8 d c b a2 d4
			d1 a2 r r r4 b c8 d e f g4. f16 g a4 g8 f g2 d r
			g, c4. c8 e2 e d e4. d8 c b a2 e'4 R1 r4 a,8 b c d e4
		}
	}
	\addlyrics {
		O O -- ri -- 
		ens, splen -- dor, splen -- dor, O O -- ri -- ens, O O -- ri -- 

		ens, splen -- _ _ _ dor lu -- _ _ _ cis, lu -- _ _ _ _ cis æ -- 
		ter -- næ, O splen -- _ _ _ _ _ _ _ _ _ _ dor,
		O O -- ri -- ens, splen -- dor, lu -- _ _ _ _ cis, lu -- _ _ _ _ 
		
		cis
	}
}


\score {
	<<
		\new StaffGroup
	  	<< 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\new Staff \with { instrumentName = #"CANTUS"  shortInstrumentName = #"C " } << \global \cantus >> 
			\new Staff \with { instrumentName = #"SEXTUS"  shortInstrumentName = #"S " } << \global \sextus >> 
			\new Staff \with { instrumentName = #"ALTUS"   shortInstrumentName = #"A " } << \global \altus >>
			\new Staff \with { instrumentName = #"QUINTUS" shortInstrumentName = #"Q " } << \global \quintus >>
			\new Staff \with { instrumentName = #"TENOR"   shortInstrumentName = #"T " } << \global \tenor >>
			\new Staff \with { instrumentName = #"BASSUS"  shortInstrumentName = #"B " } << \global \bassus >>
		>> 
	>>
%	\midi { }
}
