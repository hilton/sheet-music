% Copyright ©2013 Peter Hilton - https://github.com/hilton

\version "2.16.2"
revision = "5"

#(set-global-staff-size 15)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 4) )
	markup-system-spacing = #'( (padding . 5) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #6 \override #'(font-name . "Source Sans Pro Light") {
		"5. O Oriens"
	}
	subtitle = \markup \medium \sans {
		"Sacræ cantiones per sei voci - liber secundus (1603)"
	}
	composer = \markup \sans {
		\vspace #2
		\column {
			\line { \with-url #"http://en.wikipedia.org/wiki/Carlo_Gesualdo" "Carlo Gesualdo" (1560 – 1613) }
			\line { Sextus & bassus, \with-url #"http://en.wikipedia.org/wiki/Joop_Voorn" "Joop Voorn" (b. 1932) }
		}
	}
	copyright = \markup \sans {
		\vspace #6
		\column \center-align {
			\line { "Sextus & bassus copyright ©2005 Joop Voorn" }
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


global= { 
	\key c \major
	\tempo 2 = 90
	\time 2/2
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t }


cantus = \new Voice {
	\transpose c c \relative c' {
		e2. e'4. e8 c4 a8 b c a d4 c8 b c2 b r r4 b2 e4 ~
		e8 e c4 d4. c16 d e2 a, r4 e b'4. b8 cis4 d4. cis!16 d e4 a,2 r
		
		g8 a bes g c a \once \override HorizontalBracket #'direction = #UP d2\startGroup c\stopGroup b4 c2 r r4 c8 bes a g f4 e2. d4
		d2. d4 e4. f8 g a b2 a g4 g2 g4 d a'4. a8 g4 d8 e fis d g2 \ficta fis!4
		g1 r4 b e4. e8 a,2 r a4. b8 c a c2 a g8 f e d c4 e g \break
		
		g2 gis4 a b2 b r r4 c8 b a g f4 a a a2 a1 d2 ~  \break
		d1 b2 r b a2 ~ a1 b2. b4 d4. d8 d2 ~  \break
		d d b a R1 r4 d2 b a4 b2 r g4 g  \break
		
		a4. a8 d,2 r d' bes f ~ f1 R1 d'
		g,2 a g g2. g4 g2. f4 g2. gis4 gis2 a r
		R1 R r2 e'1 cis4 c! \ficta c!2 b ~ b1 \showBarLine \bar "|."
	}
	\addlyrics {
		O O -- ri -- ens, splen -- _ _ _ _ _ _ _ dor, O O -- 
		ri -- ens, splen -- _ _ _ dor, O O -- ri -- ens, splen -- _ _ _ dor,
		
		splen -- _ _ _ _ _ _ _ _ dor lu -- _ _ _ _ cis æ -- 
		ter -- næ, lu -- _ _ _ _ cis æ -- ter -- næ, O O -- ri -- ens, splen -- _ _ _ _ _
		dor, O O -- ri -- ens, splen -- _ _ _ _ dor lu -- _ _ _ _ cis æ --

		ter -- næ, æ -- ter -- næ, lu -- _ _ _ _ cis æ -- ter -- næ: __ ve --
		ni, ve -- ni __ et il -- lu -- mi -- na __
		se -- den -- tes, se -- den -- _ tes, et il -- 
		
		lu -- mi -- na se -- den -- tes, __ se -- 
		den -- tes in te -- ne -- bris et um -- bra mor -- tis,
		et um -- bra mor -- tis. __
	}
}

sextus = \new Voice {
	\transpose c c \relative c' {
		r2 e e'4. e8 c2 b8 c d4 c4. b16 a g4. f16 g a4 g8 a b4 g r2
		r d4 g4. g8 e4 f4. e16 f e8 f g4 g2 g4 f8 g a2 a8 b c a c4 a8 d ~
		
		d8 c bes4 a2 R1 r4 a8 b c a d2 c4 c8 bes a4 r a a2
		a d,8 e f g a4 c g4. g8 e2 r r d8 c d e f2 d r a'
		g4 f! e4. d8 c d e fis g4 g fis fis4. e16 \ficta fis! g4 e2 e8 f! g e a4. g8 f e16 d e4 c'4. b8 a g16 f e8 e
		
		e2 f4. e8 e2 e c'4. b8 a4. g8 f4. e8 d2 d4 d2 d4 r a'2 f4
		g2 d r4 g8 g d'4. d8 g,2 r R1 d4 d g4. g8 g2 r4 b8 b
		a4. a8 a2 R1 r2 c4 c b4. g8 g2 R1 r2 r4 g ~
		
		g4 fis g4. g8 e4 e d2 d4 d d2. d4 d2 r c'4 c bes4. bes8 g2
		e d es r es4 \ficta es2 \ficta es4 \ficta es d \ficta es2 \ficta es f4 e! \ficta e!2 r4 e
		a2 a r4 a c2 b c4 d d8 c b a gis4 e e c e2 e1
	}
	\addlyrics {
		O O -- ri -- ens, splen -- _ _ _ _ _ _ _ _ _ _ _ _ dor, 
		O O -- ri -- ens, splen -- _ _ _ _ dor, O O -- _ ri -- ens, splen -- _ _ _ _ _ _
		
		_ _ dor, splen -- _ _ _ _ dor lu -- _ cis æ -- ter --
		næ, lu -- _ _ _ cis, O O -- ri -- ens, splen -- _ _ _ _ dor, splen -- 
		_ _ dor, O O -- _ _ _ _ ri -- ens, splen -- _ _ _ dor, splen -- _ _ _ _ _ _ _ _ dor, lu -- _ _ _ _ cis æ -- 
		
		ter -- næ, æ -- ter -- næ, lu -- _ _ _ _ _ cis æ -- ter -- næ, ve -- ni,
		ve -- ni et il -- lu -- mi -- na, et il -- lu -- mi -- na, et il -- 
		lu -- mi -- na, et il -- lu -- mi -- na, et
		
		il -- lu -- mi -- na se -- den -- tes in te -- ne -- bris, et il -- lu -- mi -- na
		se -- den -- tes in te -- ne -- bris et um -- bra mor -- tis, et 
		um -- bra, et um -- bra, um -- bra mor -- _ _ _ tis et um -- bra mor -- tis.
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
			
			R1 r4 g'2 g, a a4 f'4. f8 f2 r d cis d ~
			d g,4 g8 g d'4. d8 d2 e1 a, R b2. b4
			fis'4. \ficta fis8 \ficta fis2 g4 e2 d4 e2 c4 c d4. d8 d2 e e4 g4. g8 d2 b4
			
			a2 g c bes g4 bes \ficta bes2. \ficta bes4 \ficta bes2 c4 bes2 a4 a g8 fis g2 ~
			g d' r bes4 \ficta bes2 \ficta bes4 \ficta bes2 R1 R R
			c2 cis4 d d2 e\longa
		}
	}
	\addlyrics {
		O O -- ri -- ens, O O -- ri -- ens, 
		splen -- _ _ _ dor, splen -- _ _ _ _ dor, O O -- ri -- ens, splen --
		
		_ _ _ _ _ dor lu -- _ _ _ _ cis æ -- ter -- næ,
		O O -- ri -- ens, splen -- _ _ _ dor, splen -- _ _ _ dor,
		splen -- _ _ _ _ _ _ _ _dor, splen -- _ _ _ dor lu -- _ _ _ _ cis æ -- ter -- næ:
		
		ve -- ni __ et il -- lu -- mi -- na, ve -- ni, ve -- 
		ni et il -- lu -- mi -- na, ve -- ni et il -- 
		lu -- mi -- na se -- den -- _ tes, et il -- lu -- mi -- na, et il -- lu -- mi -- na se --
		
		den -- tes, se -- den -- tes in te -- ne -- bris et um -- bra mor -- _ _ _
		tis, in te -- ne -- bris, et um -- bra mor -- tis.
	}
}

quintus = {
	\new Voice = "quintus" {
		\transpose c c \relative c {
			\clef "treble_8"
			R1 R R R r2 e 
			e'4. e8 d2 r4 c4. b16 c d4 g,2 r r4 d a'4. a8 f4 c'4. b16 c d4
			
			g,2 r g d'4. d8 c4 e4. e8 d4 e4. d16 e f4 c2 c4. b8 a g
			f1 e4 e e2 e d4 d'4. d8 c4 g8 a b c d2. b4 b4. b8 a2
			d,4. c16 d e2 e'1 r2 r4 e4. d8 c b a4 e f f2 e8 d e2 e4 c8 d
			
			e8 f g a16 b c4 c b b2 b4 r c2 e,4 a2 d, ~ d1 e2 d ~
			d1 r2 g e1 ~ e2 e4 e g4. g8 g2. g4 g d' ~
			d d d2 e c4 b8 a c4 g a a b4. b8 b2 c2 b1 g2
			
			d'2 b a4 a2 g f4 f f2 f4 f2 g4 g c4. c8 d2 r
			r4 g, f2 es4 g g4. g8 g2. g4 bes2. b!4 b1 a
			a2 fis4 f! \ficta f!2 e ~ e1 ~ e ~ e ~ e
		}
	}
	\addlyrics {
		O O -- ri -- ens, splen -- _ _ _ dor, O O -- ri -- ens, splen -- _ _ _
		
		dor, O O -- ri -- ens, O -- ri -- ens, splen -- _ _ _ dor, lu -- _ _ _ 
		_ cis æ -- ter -- næ, O O -- ri -- ens, splen -- _ _ _ _ dor, O -- ri -- ens,
		splen -- _ _ _ dor, lu -- _ _ _ _ cis æ -- ter -- _ _ _ næ, lu -- 
		
		_ _ _ _ _ _ _ cis æ -- ter -- næ: ve -- ni, ve -- ni, __ ve -- ni, __
		ve -- ni __ et il -- lu -- mi -- na, et il -- lu -- 
		mi -- na se -- den -- _ _ _ tes, et il -- lu -- mi -- na se -- den -- tes,
		
		se -- den -- tes, se -- den -- tes in te -- ne -- bris, et il -- lu -- mi -- na
		se -- den -- tes in te -- ne -- bris et um -- bra mor --  tis,
		et um -- bra mor -- tis.
	}
}

tenor = {
	\new Voice = "tenor" {
		\transpose c c \relative c {
			\clef "treble_8"
			R1 R r2 e e'4. e8 c2 b8 c d b e4. d16 c
			b8 a16 b c2 b4 c2 r c,4 g'4. g8 e2 a c4. c8 a4 r d,
			
			d'4. d8 c4 a8 g16 a \ficta b!4 e r2 r4 e,4. d16 e f4 e2 r r r4 f8 g
			a b c2 b4 c b8 a g fis g2 fis8 e b'2 g4 g g2 d r r d
			g4. g8 c,4 c'4. b16 cis d2 \ficta cis4 d2 b r e,4 e'4. e8 d4 r g,4. fis16 g a2 g4 ~
			
			g8 a b2 a g4. f8 e d c4 e2 c' c4. b8 a g a4 a r2 e' a,4 c ~
			c b8 a b4 b g8 g b4. b8 b2 d cis8 b cis2 cis b4 b2 d4. d8 d4 d, d
			a'4. a8 a2 r f e2. d8 c g'1 e4 a2 g fis4 d d ~
			
			d4 d d2 R1 R r2 r4 d e2. f4 f e8 d d'2
			c4 c a2 bes4 es, es4. es8 es1 R1 r2 r4 d' cis c! \ficta c!2
			e,2 a ~ a1 b4 d d8 c b a g4 g8 g gis4 a a2 b ~ b1
		}
	}
	\addlyrics {
		O O -- ri -- ens, splen -- _ _ _ _ _ _
		_ _ _ _ _ dor, O O -- ri -- ens, O O -- ri -- ens, O
		
		O -- ri -- ens, splen -- _ _ _ dor, splen -- _ _ _ dor, lu -- _ 
		_ _ _ _ cis, lu -- _ _ _ _ _ _ _ cis æ -- ter -- næ, O
		O -- ri -- ens, splen -- _ _ _ _ _ dor, O -- ri -- ens, splen -- _ _ _ _
		
		_ _ _ dor lu -- _ _ _ _ cis æ -- ter -- _ _ _ _ _næ: ve -- ni, ve -- 
		_ _ _ ni et il -- lu -- mi -- na, ve -- _ _ _ ni et il -- lu -- mi -- na, et il -- 
		lu -- mi -- na se -- den -- _ _ _ tes, se -- den -- tes in te -- 
		
		ne -- bris et um -- bra mor --  _ _ _ 
		tis, se -- den -- tes in te -- ne -- bris et um -- bra mor --  
		tis, et um -- bra mor -- _ _ _ tis, et um -- bra mor -- tis.
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
			
			e e2. f2 e r4 a,4. b8 c d16 e f4 f r f2 f4. e8 d c16 b a4 a r2
			g1 g2 r1 a2 ~ a1 g r2 g4 b
			d4. d8 d2 R1 r2 a g g4 g c2 e4 e2 b4. b8 b4
			
			r2 g a d d bes2. bes4 bes2 r a bes2. bes4
			c c r2 R1 R R f4. e!8 d4 c8 b a1
			a a gis2 a4. b8 c4. d8 e4 fis8 gis a1 gis
		}
	}
	\addlyrics {
		O O -- ri -- 
		ens, splen -- dor, splen -- dor, O O -- ri -- ens, O O -- ri -- 

		ens, splen -- _ _ _ dor lu -- _ _ _ cis, lu -- _ _ _ _ cis æ -- 
		ter -- næ, O splen -- _ _ _ _ _ _ _ _ _ _ dor,
		O O -- ri -- ens, splen -- dor, lu -- _ _ _ _ cis, lu -- _ _ _ _ 
		
		cis æ -- ter -- næ, lu -- _ _ _ _ _ cis æ -- ter -- _ _ _ _ _ næ,
		ve -- ni, ve -- ni et il -- 
		lu -- mi -- na se -- den -- tes, se -- den -- tes in te -- ne -- bris,
		
		se -- den -- tes in te -- ne -- bris et um -- bra 
		mor -- tis, mor -- _ _ _ _ tis,
		et um -- bra mor -- _ tis, et um -- bra _ mor -- tis.
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
	\layout { }
	\midi { }
}
