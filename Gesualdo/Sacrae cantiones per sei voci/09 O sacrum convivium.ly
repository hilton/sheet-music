% Copyright ©2013 Peter Hilton - https://github.com/hilton

% TODO Change altus to treble clef after review.

\version "2.16.2"
revision = "1"

#(set-global-staff-size 15.5)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15.5 20)))
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
		"9. O sacrum convivium"
	}
	subtitle = \markup \medium \sans {
		"Sacræ cantiones per sei voci - liber secundus (1603)"
	}
	composer = \markup \sans {
		\vspace #2
		\column {
			\line { \with-url #"http://en.wikipedia.org/wiki/Carlo_Gesualdo" "Carlo Gesualdo" (1560 – 1613) }
			\line { Sextus & bassus, \with-url #"https://twitter.com/HenriBroeren" "Henri Broeren" (b. 1932) }
		}
	}
	copyright = \markup \sans {
		\vspace #6
		\column \center-align {
			\line { "Sextus & bassus copyright ©2004-2005 Henri Broeren" }
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
%		\consists "Ambitus_engraver"
	}
}


global= { 
	\key c \major
	\tempo 2 = 45
	\time 2/2
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t }



cantus = \new Voice {
	\transpose c c \relative c'' {
		R1 R R d g, ~ g2 b r4 e,2 g a8 b c4 g \break
		a2. c2 b4 a1 a2 r4 c2 a4 g8 a b c d4 g,2 a g4 b d2 b4 \break
		c c2 b4 g2 g4 g2 f4 e g c g a2 b4 e4. e8 c4 R1 R \break
		
		r2 g4 g2 f8 e f4 f d2 dis4 dis e2 fis f! e4 e a4. a8 d,1 r4 c'4 \break
		c2. b8 a e'4. e8 a,4 r c c c a gis \ficta gis a2. b!4 bes2 a a4 d b2 b4 c ~ \break
		c8 d e d c a c2 b8 a b c16 d e4. e8 e,4 b' c a2 a R1 \break
		
	}
	\addlyrics {
		O sa -- crum con -- vi -- _ _ _ vi -- 
		um, in quo Chri -- stus, in quo Chri -- _ _ _ _ stus su -- mi -- tur, su -- mi -- 
		tur, in quo Chri -- stus, in quo Chri -- stus su -- mi -- tur: re -- co -- li -- tur
		
		me -- mo -- _ _ _ ri -- a pas -- si -- o -- nis e -- jus, re -- co -- li -- tur me -- 
		mo -- _ _ _ ri -- a, pas -- si -- o -- nis, pas -- si -- o -- nis e -- jus: mens im -- ple -- tur gra -- 
		_ _ _ _ _ _ _ _ _ _ _ _ ti -- a, mens im -- ple -- tur
	}
}

sextus = \new Voice {
	\transpose c c \relative c' {
		R1 R r4 fis1 ~ fis4 b,2. e r4 g fis e8 d c4 c b2 r4 c2 d4 ~
		d8 e16 f g4 b e2 e,4 fis g2 e4 a e' f e e, e2 e4 g2 d4 f2 e4 e2. g4
		a2 r1 e4 c d8 e f g a4 e g2. fis4 b,2 r4 e2 f4. f8 d4 r g f e8 d
		
		c4 d es2 d4 f a2 a fis4 fis b,2 b c cis r4 a' d4. e!8 f4 d a g8 f
		e4 f g a b2 c4 d e2 f e4 e, e2 f g1 fis2 r4 e d2
		g g4 a4. b8 g fis e c b4. c8 d e16 f g4. f8 g4 c d c2 g4 r2
	}
	\addlyrics {
		O sa -- crum con -- vi -- _ _ _ vi -- um, con -- vi --
		_ _ _ vi -- um, O sa -- crum con -- vi -- vi -- um in quo Chri -- stus, in quo Chri -- stus su -- mi -- 
		tur, in quo Chri -- _ _ _ _ stus su -- mi -- tur: re -- co -- li -- tur me -- mo -- _ _
		
		_ ri -- a pas -- si -- o -- nis, pas -- si -- o -- nis e -- jus, re -- co -- li -- tur me -- mor -- _ _
		_ _ _ ri -- a pas -- si -- o -- nis, pas -- si -- o -- nis e -- jus: mens im -- 
		ple -- tur gra -- _ _ _ _ _ _ _ _ _ _ _ ti -- a mens im -- ple -- tur
	}
}

altus = {
	\new Voice = "altus" {
		\transpose c c \relative c' {
			\clef "treble_8"
			R1 R R d2 g,1 b2 r e1 g,2 g'4 g e d8 c
			f4 f e c d8 c16 b e2 a,4 e'2 r1 c2 b4 g8 a b c d4 g, c2 b4 a d2 e4 ~
			e c d2 e4 d e2 R1 r2 e, e'4. e8 c4 a' a g8 f g4 g f1
			
			R1 R r2 b,4 b cis2. d4 d2 cis e4 f4. f8 bes,4 bes bes a8 g a4 ~
			a a e'1 f4 f e8 d e4. e8 d4 b b cis d d2 d1 r2 d4 e2 g4 ~
			g g r1 g4. e8 c4 c r r8 a' f4 f e4. f8 g f e c g' f16 e d4 ~
		}
	}
	\addlyrics {
		O sa -- crum, O sa -- crum con -- vi -- _ _ 
		_ vi -- um, con -- vi -- _ _ _ vi -- um in quo Chri -- _ _ _ _ stus, in quo Chri -- stus su -- 
		mi -- tur, su -- mi -- tur: re -- co -- li -- tur me -- mo -- _ _ _ ri -- a
		
		pas -- si -- o -- nis e -- jus, re -- co -- li -- tur me -- mo -- _ _ _
		ri -- a, me -- mo -- _ _ _ ri -- a pas -- si -- o -- nis e -- jus: mens im -- ple -- 
		tur, mens im -- ple -- tur, im -- ple -- tur gra -- _ _ _ _ _ _ _ _ _
	}
}

quintus = {
	\new Voice = "quintus" {
		\transpose c c \relative c' {
			\clef "treble_8"
			R1 R R g2 d1 g r2 r4 e g4. a16 b c4 c, g'2
			r4 d e4. d16 c g'4 e e d e8 f16 g a2 f4 a1 R R R
			a2 g e8 f g a b4 g a2. g4 e2 e' b2. a4 c d g,4. g8 a4 d d2
			
			c8 b c2 c4 bes2 a4 a a g fis fis gis a a2 a a4 e c'4. c8 a4 g g f8 e f2 ~
			f4 f c' c c c2 bes a a4 R1 R r4 a d b4. b8 b4 g2 ~
			g4 g r2 r4 g4. a8 b a g e g4. a16 b e,8 a a4 a8 b c b a f c'4. c8 g2
		}
	}
	\addlyrics {
		O sa -- crum con -- vi -- _ _ _ vi -- um, 
		con -- vi -- _ _ _ vi -- um, con -- vi -- _ _ _ vi -- um, 
		in quo Chri -- _ _ _ _ stus, in quo Chri -- stus su -- mi -- tur: re -- co -- li -- tur me -- mo --
		
		_ _ _ ri -- a pas -- si -- o -- nis, pas -- si -- o -- nis e -- jus, re -- co -- li -- tur me -- mo -- _ _ _ _
		ri -- a, pas -- si -- o -- nis e -- jus: mens im -- ple -- tur, im -- ple -- 
		tur, gra -- _ _ _ _ _ _ _ _ _ ti -- a, gra -- _ _ _ _ _ _ ti -- a,
	}
}

tenor = {
	\new Voice = "tenor" {
		\transpose c c \relative c' {
			\clef "treble_8"
			R1 r2 d g,1 b ~ b2 r4 d c b8 a g4 b c2 r4 g2 e4. d16 c c'4 ~
			c a a a d, g2 f4 a e f a f e2 e4 e'2 d4 b2 a4 e'2. a,4 b2
			R1 c4 b g8 a b c d4 g, c2. b4 c2 r4 e,2 c'4. c8 a4 r d c bes8 a bes4 bes
			
			a2 r1 r r r e4 a4. a8 f4 r2 r4 d' d c8 b
			c4. c8 g4 r a a2 g8 f c'4. c8 f,2 r a4 a a g g2 a r d,4 g2 c4
			c c4. d8 e d c a e'4. e8 e,2 e4. f8 g f16 e f8 d f g a b c d e4. e8 d4 b8 c
		}
	}
	\addlyrics {
		O sa -- crum con -- vi -- _ _ _ vi -- um, con -- vi -- _ _ _ 
		vi -- um, O sa -- crum con -- vi -- vi -- um in quo Chri -- stus, in quo Chri -- stus su -- mi -- tur,
		in quo Chri -- _ _ _ _ stus su -- mi -- tur: re -- co -- li -- tur me -- mo -- _ _ _ _
	
		a, re -- co -- li -- tur me -- mo -- _ _
		_ ri -- a, me -- mo -- _ _ _ ri -- a pas -- si -- o -- nis e -- jus: mens im -- ple -- 
		tur gra -- _ _ _ _ _ _ ti -- a, gra -- _ _ _ _ _ _ _ _ _ _ _ _ _ ti -- a, gra -- _
	}
}

bassus = {
	\new Voice = "bassus" {
		\transpose c c \relative c' {
			\clef "bass"
			b1 e, ~ e2 a,2. a2 c d8 e fis4 g a2. g2 fis4 e1 a,2
			r e'1 g2 a4 a, a b c2 e1 d a2 b c ~
			c d a' e f4 g g,8 a b c d4 e2 e4 e4. e8 e2. r4 c1 c4. c8
			
			c4 c' bes a8 g d4 d d1 a4 a a a2. d2 a a'4 a4. bes8 g2. f4 f
			e8 d c4. d8 e2. f4 g a a, bes d! e2. d d4 e2 a, a4 a'2 a
			d d,4. d8 e4 e2 e4. f8 g f e d c4. d8 e2 f4. g8 c c,16 d e8 f g a
		}
	}
	\addlyrics {
		O sa -- crum con -- vi -- _ _ _ vi -- um, in quo Chri -- stus, 
		in quo Chri -- stus, in quo Chri -- stus su -- mi -- tur, su -- 
		mi -- tur, in quo __ _ Chri -- _ _ _ _ stus, re -- co -- li -- tur, re -- co -- li -- 
		
		tur me -- mo -- _ _ _ ri -- a pas -- si -- o -- nis e -- jus re -- co -- li -- tur me -- mo -- 
		_ _ _ ri -- a pas -- si -- o -- nis, pas -- si -- o -- nis e -- _ jus: mens im -- ple -- 
		tur, mens im -- ple -- tur gra -- _ _ _ _ _ _ ti -- a, gra -- _ _ _ _ _ _ _ _
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
