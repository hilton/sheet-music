% Copyright ©2013 Peter Hilton - https://github.com/hilton

\version "2.16.2"
revision = "4"

#(set-global-staff-size 15)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	inner-margin = 15\mm
	outer-margin = 15\mm
	indent = 0
	top-markup-spacing = #'( (basic-distance . 4) )
	markup-system-spacing = #'( (padding . 5) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #6 \override #'(font-name . "Source Sans Pro Light") {
		"4. Ave sanctissima"
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
		\consists "Ambitus_engraver"
	}
}


global= { 
	\key f \major
	\tempo 2 = 40
	\time 2/2
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t }


cantus = \new Voice {
	\transpose c c \relative c'' {
		d1 d2 r4 g,2 g g4 es'4. \ficta es8 c2. c4 cis2 d r1 r2 g,2. bes4 \break
		a4. bes8 c bes a g \ficta f!1 c'2 r r4 c2 bes4 a c2 bes8 a g2. fis4 g2 r \break
		R1 c4 a g c4. bes8 a g f2 f r1 d'2 d es4 \ficta es d2. c4 \break
		
		c4 c8 c d2 d c4 a d2. d4 bes8 a g f es2 c r1 r es'2 \break
		d g,4 a2 g4 c c bes d2 c b4 c a2 a4 r2 a4. a8 g4 a ~ \break
		a d d4. d8 bes4 d2 a4 R1 R r4 g bes g d'2 c r d \break
		
		c4 d2 c8 bes c2 d1 d2 d, d4 a' e a2 g8 f bes4 a2 g4 a2 r4 e \break
		c'2 d4 bes2 a4 a2 e'4 e8 e e4 d c bes a g fis \ficta fis8 \ficta fis \ficta fis2 g4 g8 g g2 R1 \break
		bes2 a2. g2 f e4 f2 g c a4 a d,2 g g \break bes a r r4 c
		
		c4 a d, d'2 c8 bes a2 a r1 r2 \break r2 c2
		es d2. bes2 bes4 b c d1 ~ d2 d1 \showBarLine \bar "|."
	}
	\addlyrics {
		A -- ve,  a -- ve san -- ctis -- si -- ma Ma -- ri -- a, ma -- ter
		De -- _ _ _ _ _ _ i, re -- gi -- na cœ -- _ _ _ _ li,
		re -- gi -- na cœ -- _ _ _ _ li por -- ta Pa -- ra -- di -- si,
		
		do -- mi -- na mun -- di pu -- ra sin -- gu -- la -- _ _ _ _ ris: tu
		es vir -- go, tu con -- ce -- pi -- sti Je -- _ sum, Je -- sum si -- ne pec -- ca -- 
		to, si -- ne pec -- ca -- to, tu pe -- pe -- ri -- sti Cre --
		
		a -- to -- _ _ _ rem et Sal -- va -- to -- rem mun -- _ _ _ _ _ di in
		quo non du -- bi -- to; li -- be -- ra nos ab om -- ni ma -- lo, li -- be -- ra nos, li -- be -- ra nos
		ab o -- mni ma -- _ lo, et o -- ra, et or -- ra, et o -- ra pro
		
		pec -- ca -- tis no -- _ _ _ stris, et
		o -- ra pro pec -- ca -- tis no -- stris.
	}
}

sextus = \new Voice {
	\transpose c c \relative c'' {
		bes1 a2 r4 d2 g, d'4 c4. c8 g2. g4 a2 a r2 r1 r
		R1 d2 g,4 a2 ~ a8 f d4 e8 f g a bes4 f'2. r2 r4 d a g8 a bes es d4. bes8 a4 f'
		d2 r1 r4 e2 e4 a, a bes8 c d bes g'2. d4 r1 r r2
		
		r2 a4 a8 a bes4 a e'4 e8 e f4 e a, a bes bes c2. d r4 d2 f bes, g4
		g2 c r r4 c2 bes f'8 g e d d2. r4 d4 a g f e f2 ~
		f4 f r g2. bes8 a g f g4 d d'4. d8 d4 d2 c2. r1 r r2
		
		r4 r8 d f4 g a2 d, r g4 g d4. e8 f4 g2 e4 d2. a4 a d e a, r2
		r4 e bes'2 g4 a2 e4 cis2 a'4 a8 a a1 R r2 d4 d8 d f2. e4
		d bes2 f4 g2 r r4 g a2 bes r1 r4 d d2 d es4 f d a d,4. e8 f g a c
		
		f2 d r4 a' e2 d r bes4 c a bes g4. a8 f4 d8 a'
		g2 d r c' e4 e d c4. a8 g fis g bes c4 g1
	}
	\addlyrics {
		A -- ve,  a -- ve san -- ctis -- si -- ma Ma -- ri -- a, 
		ma -- ter De -- _ _ _ _ _ _ _ i, re -- _ gi -- _ na __ _ cœ -- _ _ _ 
		li, por -- ta Pa -- ra -- di -- _ _ _ _ si,
		
		do -- mi -- na mun -- di, do -- mi -- na mun -- di pu -- ra sin -- gu -- la -- ris, pu -- ra sin -- gu --
		la -- ris: tu es vir -- _ _ _ go, tu con -- ce -- pi -- sti Je -- 
		sum, Je -- _ _ _ _ _ sum si -- ne pec -- ca -- to
		
		tu pe -- pe -- ri -- sti Cre -- a -- to -- _ _ rem et Sal -- va -- to -- rem mun -- di
		in quo non du -- bi -- to; li -- be -- ra nos, li -- be -- ra nos, ab
		o -- mni ma -- _ lo, et o -- ra, et o -- ra pro pec -- ca -- tis no -- _ _ _ _
	
		_ stris, 	et o -- ra pro pec -- ca -- tis no -- _ stris, et __ _
		o -- ra pro pec -- ca -- tis no -- _ _ _ _ _ _ stris.
	}
}

altus = {
	\new Voice = "altus" {
		\transpose c c \relative c' {
			\clef "treble_8"
			f1 f2 r4 b,2 \ficta b2 d4 g4. g8 es2. e!4 e2 fis r1 r2 r4 g, bes g4 ~
			g fis4 g2 d'2. f2 e4. \ficta f!8 g2 f8 e f2 f es4 d2 c4 d1 f2
			R1 f4 f g g e2. d8 c d4. c8 d e f2 f4 r2 d4 d8 d g4 c, f f8 f g4 es
			
			es4 c f f d8 e f g a2. g2 fis4 g2 r r4 a2 f! g4 g f4. e8 d2 c4
			d g e f f d8 e f2 f4 f2 e4 a,8 \ficta bes!16 c d4 g, a e' e c g'2 f e4
			f8 e d c bes4 d8 d4 d8 bes4 a a a4. a8 g4 g'2 d8 bes bes4 bes c2 g' f4 d e d8 c d4 c r2
			
			r2 r4 g'4 c, c f2 f, f'4 e8 d g2 f r f d f4 d2 cis4 \ficta cis2
			R1 r4 a2 a8 a a2 r r4 d2 d8 d d1 R r2 f4 f8 f
			f2. es4 d2 c4 d2 bes4 a2 e' c4 c f2 g4 f f es bes es4 ~ es d4 r2 d4 d e2
			
			f1 r f4 f d2 g,4 g'2 f4 ~ f e4 f c
			g'2 g r1 e4 e d d2 d4. c8 a4 b1
		}
	}
	\addlyrics {
		A -- ve,  a -- ve san -- ctis -- si -- ma Ma -- ri -- a, ma -- ter De -- 
		_ i, ma -- ter De -- _ _ _ _ _ i, re -- gi -- na cœ -- li,
		por -- ta Pa -- ra -- di -- _ _ _ _ _ _ _ si, do -- mi -- na mun -- di, do -- mi -- na mun -- di
		
		pu -- ra sin -- gu -- la -- _ _ _ _ _ _ ris, pu -- ra sin -- gu -- la -- _ _ _
		ris, pu -- ra sin -- gu -- la -- _ _ ris: tu es vir -- _ _ _ go, tu con -- ce -- pi -- sti Je -- sum,
		Je -- _ _ _ _ sum si -- ne pec -- ca -- to, si -- ne pec -- ca -- to, tu pe -- pe -- ri -- sti Cre -- a -- to -- _ _ _ rem
		
		et Sal -- va -- to -- rem mun -- _ _ _ di in quo non du -- bi -- to;
		li -- be -- ra nos, li -- be -- ra nos, li -- be -- ra 
		nos, ab o -- mni ma -- lo, et o -- ra, et o -- ra pro pec -- ca -- tis no -- stris, pro pec -- ca -- 
		
		tis, pro pec -- ca -- tis no -- _ _ stris, et
		o -- ra pro pec -- ca -- tis no -- _ _ stris.
	}
}

quintus = {
	\new Voice = "quintus" {
		\transpose c c \relative c' {
			\clef "treble_8"
			bes1 bes2 r4 d,2 g g c c4 c a a2 d4 d2 es4 d4. \ficta e!8 f e c d es4. d16 c d2
			d4 d2 c bes4 d c8 bes a2 g R1 a4 f g bes2 a8 g a2 g c4 a ~
			a c d g, c2 c1 cis4 d a2 a4 d2 d4 d d2 bes a4 bes2 r
			
			g4 g8 g d'4. c16 bes a8 g a bes c2 d1 r4 bes4 bes8 bes c4 a2 c bes4 bes2 bes4 g2 g
			R1 d'2 c f,4. g8 a2 f4 f c'2 c4 a2 b4 c2. bes!8 a
			c4 a d4. d8 d,1 a'8 bes c2 bes8 a bes2 g1 ~ g2 r a bes4 g d' c8 bes
			
			c4 f, bes g a4. g8 f4 bes2 a4 d,2. d4 f d e2 a4 a f2. g4 f e e2
			a2 bes bes4 d2 e4 e2 r f4 f8 f f2 R1 es4 d2 c4 f,1 ~
			f2 a R1 r2 r4 d g,2 a R1 r4 c, g'2 g r f4 f g2
			
			a1 r2 d4 d c f, bes4. a8 bes c d4 c2 r f,4 f
			g a bes2 a4 d2 d c4 f, f'8 e d c bes c d2 d1
		}
	}
	\addlyrics {
		A -- ve,  a -- ve san -- ctis -- si -- ma Ma -- ri -- a, ma -- ter De -- _ _ _ _ _ _ _ _ _
		i, re -- gi -- na cœ -- _ _ _ li, re -- gi -- na cœ -- _ _ _ li, re -- gi -- 
		na cœ -- li, por -- ta Pa -- ra -- di -- si, por -- ta Pa -- ra -- di -- _ si,
		
		do -- mi -- na mun -- _ _ _ _ _ _ _ di, do -- mi -- na mun -- di pu -- ra sin -- gu -- la -- ris:
		tu es vir -- _ _ go, tu con -- ce -- pi -- sti Je -- _ _
		_ sum si -- ne pec -- ca -- _ _ _ _ _ to, tu pe -- pe -- ri -- _ _
		
		_ sti Cre -- a -- to -- _ _ rem et Sal -- va -- to -- rem mun -- di in quo non du -- bi -- to,
		in quo non du -- bi -- to; li -- be -- ra nos, ab o -- mni ma -- 
		lo, et o -- ra, et o -- ra pro pec -- ca -- 
		
		tis, pro pec -- ca -- tis no -- _ _ _ _ stris, pro pec -- 
		ca -- tis no -- stris, pro pec -- ca -- tis no -- _ _ _ _ _ _ stris.
	}
}

tenor = {
	\new Voice = "tenor" {
		\transpose c c \relative c {
			\clef "treble_8"
			f1 f2 r4 d'2 d4 d2 g,2. g4 g e e2 d g2. bes4 a4. bes8 c4 bes8 a g2
			a r1 r c d2 c2. g4 R1 r4 g f2
			e4 f2 e4 r2 g g4 a2 a4 f f d4. e8 f g a f bes2. g4 c,4 c8 c d4 d g g8 g
			
			c2 a4 f2 d4 a' a d,1 g r4 f'2 c4 d2. d4 bes2. a8 g
			bes4. a16 bes c2 bes r1 r2 f'2. e4 a,8 bes c d e4 d r f, c' c
			a f' d8 c bes a g4 d d'4. d8 d,1 g4 f8 e d4. c16 d es2 bes'1 r a4 a
			
			a4 bes2 d4 f2 d f8 e d c bes2 g4 d'2 a4 a e'2 d4 f2 d4 d, a'1
			r2 g2. f2 e4 e2 r1 a4 a8 a a2. d4 c bes g4. a8 bes1 ~
			bes2 c r r4 d, g2 f r4 c' f,2. d4 bes' bes b c d4. c8 bes a bes g a2 a4 b c2
			
			c2 r4 a d2 d, r4 d2 d' g,4 r2 bes4 bes c2 ~
			c4 c d2 d r r4 a a f fis g a2 g1
		}
	}
	\addlyrics {
		A -- ve,  a -- ve san -- ctis -- si -- ma Ma -- ri -- a, ma -- ter De -- _ _ _ _ _
		i, ma -- ter De -- i, re -- gi -- 
		na cœ -- li, por -- ta, por -- ta Pa -- ra -- di -- _ _ _ _ _ _ si, do -- mi -- na mun -- di, do -- mi -- na
		
		mun -- di pu -- ra sin -- gu -- la -- ris, pu -- ra sin -- gu -- la -- _ _
		_ _ _ _ ris: tu es vir -- _ _ _ _ go, tu con -- ce -- 
		pi -- sti Je -- _ _ _ _ sum si -- ne pec -- ca -- _ _ _ _ _ _ to, tu pe -- 
		
		pe -- ri -- sti Cre -- a -- to -- _ _ _ _ rem et Sal -- va -- to -- rem mun -- di in quo 
		non du -- bi -- to; li -- be -- ra nos, ab o -- mni ma -- _ _
		lo, et o -- ra, et o -- ra pro pec -- ca -- tis no -- _ _ _ _ _ _ stris et o --
		
		ra, et o -- ra, et o -- ra pro pec -- ca -- 
		tis no -- stris, pro pec -- ca -- _ tis no -- stris.
	}
}

bassus = {
	\new Voice = "bassus" {
		\transpose c c \relative c {
			\clef "bass"
			bes1 bes2 r4 g2 g'4 f2 es2 c'4 bes a e a2 d, r2 r1 r
			R1 R R R g, es'2 d es1
			d4 d2 d4 d2 a' R1 d,2 d4 bes2 bes4 as4. bes8 g2. f4 bes2 bes4 bes
			
			a2 g' f e a a d\breve bes
			r2 bes a a8 bes a g4. f4 r d g, g a bes2 c1 d4 g,4. g8
			g1 bes8 a g2 a8 bes c2 bes1 ~ bes2 as2. g2 g4 g'2 d2. e4
			
			f4 bes8 a g f es2 d r r4 g2 f4 e d2 c bes1 a r4 a
			a'2 g4 f2 d4 e2 a, r1 r b4 \ficta b8 \ficta b bes!2. bes4 g g g'2
			g1 r r r2 g, a bes4 c d bes'! g2 ~ g r4 d g, d' c a2
			
			 g8 a bes2 bes r1 r r4 g c2 d
			g4 a a2. g4 g8 a g f e gis,4. a4 d2 d2. g,1
		}
	}
	\addlyrics {
		A -- ve,  a -- ve san -- ctis -- _ si -- ma Ma -- ri -- a,
		ma -- ter De -- i,
		re -- gi -- na cœ -- li, por -- ta Pa -- ra -- di -- _ _ si, do -- mi -- na
		
		mun -- di pu -- ra sin -- gu -- la -- ris:
		tu es vir -- _ _ _ go, tu con -- ce -- pi -- sti Je -- sum si -- ne 
		pec -- ca -- _ _ _ _ _ to, tu pe -- pe -- ri -- sti Cre --
		
		a -- _ _ to -- _ _ rem et Sal -- va -- to -- rem mun -- di in 
		quo non du -- _ bi -- to; li -- be -- ra nos, ab o -- mni ma --
		lo, et o -- ra, et o -- ra pro pec -- ca -- tis no --
		
		_ _ _ _ stris, et o -- ra
		pro pec -- ca -- tis, pro __ _ _ _ _ pec -- ca -- tis no -- stris.
	}
}


\score {
	<<
		\new StaffGroup
	  	<< 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\new Staff \with { instrumentName = #"C " shortInstrumentName = #"C " } << \global \cantus >> 
			\new Staff \with { instrumentName = #"S "  shortInstrumentName = #"S " } << \global \sextus >> 
			\new Staff \with { instrumentName = #"A " shortInstrumentName = #"A " } << \global \altus >>
			\new Staff \with { instrumentName = #"Q " shortInstrumentName = #"Q " } << \global \quintus >>
			\new Staff \with { instrumentName = #"T " shortInstrumentName = #"T " } << \global \tenor >>
			\new Staff \with { instrumentName = #"B " shortInstrumentName = #"B " } << \global \bassus >>
		>> 
	>>
%	\midi { }
}
