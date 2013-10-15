% Copyright ©2013 Peter Hilton - https://github.com/hilton

\version "2.16.2"
revision = "2"

\pointAndClickOff
#(set-global-staff-size 15)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 15\mm
	inner-margin = 15\mm
	outer-margin = 15\mm
	markup-system-spacing = #'( (padding . 8) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
	indent = 0
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #6 \override #'(font-name . "Source Sans Pro Light") {
		"20. Illumina nos"
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
		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 10))
	}
	\context { 
		\StaffGroup
		\remove "Span_bar_engraver"	
	}
	\context {
		\Staff
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
	\tempo 2 = 44
	\time 2/2
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t }
squareBracket = {  }


cantus = \new Voice {
	\relative c' {
		R1 r2 r4 e a2. a8 a b4 b c a
		c c e2 ~ \break e1 d2 e4. d8 c b c4 b2 R1
		R \break R r2 e, e'4 e8 e c2.
			b4 c e, \break f1 f2 a2. g8 f g2
		
		f2 r R1 \break R d'4. c8 b a b4
		a2 r b4 d2 cis4 d d e2 ~ \break e8 d ~ d4. c4.
		b8 a g d a' g a b c2 c, r gis'4 a \break f2 fis8 \ficta fis g2
			fis4 g1 r2 r e'8 d c a b4 a8 g c4 c \break
			
		d8 c b a c2 b c c4 e2 a,4 r2 r4 e' \break 
		c8 c a4 d8 c16 b e8 e a,2 b4. a16 g a4. a8 d,2 R1 \break 
		g2 d' c a r2 r4 d d d2 b4 ~ \break b b4 r2
		r g g4 g2 e e e4. e8 e4 e'8 e a,4 ~ \break
		
		a a a4. a8 d2 d d8 d g,2 g4 g2. g4
		a4. b8 c2 ~ \break c r d1. g,1.
		d'2. a4 f1 g2 r
		b4. c8 d4 g, g g8 a b c d b c b e2 d4 \break e4 e4. a,8 d4.
		
		c8 b4 b2 a b4 b8 a g2 r \break d'1
		a1. e'1 e1. \fermata \showBarLine \bar "|."
	}
	\addlyrics {
		Il -- lu -- mi -- na nos,
		mi -- se -- ri -- cor -- di -- a -- rum De -- _ _ _ _ us,
		il -- lu -- mi -- na nos, mi -- se -- ri -- cor -- di -- a -- _ _ _ 
		rum De -- _ _ _ _ us, mi -- se -- ri -- cor -- di -- a -- _ rum 
		De -- _ _ _ _ _ _ _ _ us, mi -- se -- ri -- cor -- di -- a -- _ rum De -- _ _ _ _ _ _ _ us, 
		De -- _ _ _ _ us, sep -- ti -- for -- mi Pa -- ra -- cli -- ti gra -- _ _ _ ti -- a, gra -- _ _ _ ti -- a,
		ut per e -- am a de -- lic -- to -- rum, 
		a de -- lic -- to -- rum te -- ne -- bris li -- be -- ra -- 
		ti, li -- be -- ra -- ti, li -- be -- ra -- ti,
		vi -- tæ glo -- ri -- a per -- fru -- 
		a -- mur, vi -- tæ glo -- ri -- a per -- fru -- a -- _ _ _ _ _ _ _ _ _ mur, per -- fru -- a -- 
		_ _ mur, vi -- tæ glo -- ri -- a per -- fru -- a -- mur.
	}
}

sextus = \new Voice {
	\relative c' {
		r2 r4 a e'2. e8 e f4 e f d g g a1
			e2 e'4. d8 c4 b4. a8 g4 g2 r d4 e2 c4 e e
		f2 e4 f8 e d4 g r c2 b8 a b4. a8 g2 r4 c,
		f4 f8 f e4 g a4. g8 f e f4 c2 f r g8 f e d
		
		c4 f r2 d4 a'2 a8 a c2. b4 g b b g
		c2 b1 a g2 a4 f8 g a2
		d,4 b'8 a g d d2 c4 c2 f8 g a4 e8 d c e d4 f8 e d2
		r e' ~ e8 d c b c2 c4. b8 a2 d4 c8 b a4 g ~ g
		
		a2 g8 \ficta f! g2 c,4 g' c4. b8 a4 b8 c b2 b4 gis8 \ficta gis
		e4 fis8 e16 d g8 g c,2 r d' d4 b2 R1
		R r2 c,4 c' b2 a r r4 b b b d2
		d e c4 c g2 g4 e4. e8 e4 c4. c8 a4 a' ~
		
		a8 a cis,4 d d4. d8 fis4 a a8 a g4 g d'8 d g,4 g2 r
		a2. a4 f4. g8 a2 b8 a g2 fis4 g4. f!8 e f g a
		b8 c d2 c4 b2 a ~ a8 g f2 d4 r2 r4 a'
		d, b'4. b8 e,4 d d g2 g c4 b8 a a4 e a4. d,8
		
		d4. fis16 e d4 d r a'2 g4 g8 fis e4 c' c8 c b a g4 d'4. c16 b!
		c4 a4. g8 f g a4. g16 f e1 e1. \fermata
	}
	\addlyrics {
		Il -- lu -- mi -- na nos, mi -- se -- ri -- cor -- di -- a -- 
		rum De -- _ _ _ _ _ us, mi -- se -- ri -- cor -- di -- 
		a -- _ _ _ _ rum De -- _ _ _ _ us, il -- 
		lu -- mi -- na nos, mi -- se -- ri -- cor -- _ di -- a -- rum De -- _ _ _ 
		
		_ us, il -- lu -- mi -- na nos, mi -- se -- ri -- cor -- di -- 
		a -- rum, mi -- se -- ri -- cor -- di -- a -- 
		rum De -- _ _ _ _ _ us, mi -- _ se -- ri -- _ _ cor -- di -- a -- _ rum 
		De -- _ _ _ us, De -- _ us, De -- _ _ _ us,
		
		De -- _ _ us, sep -- ti -- for -- _ _ _ _ mi Pa -- ra -- cli -- 
		ti gra -- _ _ _ ti -- a, gra -- ti -- a,
		ut per e -- am a de -- lic -- to -- 
		rum, a de -- lic -- to -- rum te -- ne -- bris, te -- ne -- bris li -- 
		
		be -- ra -- ti, li -- be -- ra -- ti, li -- be -- ra -- ti, li -- be -- ra -- ti,
		vi -- tæ glo -- ri -- a per -- _ _ fru -- a -- _ _ _ _ _ 
		_ _ _ _ mur, per -- fru -- a -- mur, vi -- 
		tæ glo -- ri -- a per -- fru -- a -- mur, per -- fru -- _ a -- mur, per -- fru -- 
		
		a -- _ _ _ mur, vi -- tæ glo -- ri -- a, vi -- tæ glo -- _ ri -- a per -- _ _ 
		_ fru -- _ _ _ _ _ _ a -- mur.
	}
}

altus = {
	\new Voice = "altus" {
		\relative c' {
			\clef "treble_8"
			R1 R R R
			r2 r4 a4 e'2. e8 e g!2 e f4 e g1 g2
			a1 g2 fis4 g2 fis4 g g e8 d c b a g a4
			f2 r R1 r4 c'8 bes a g a4 f2 r
			
			R1 r4 a d d8 d g1 r2 e4 g2 
			fis4 g g e1 d2 r R1
			fis4 g2 \ficta fis4 g g a f?2 d4 e2 d1
			a'4 a e8 fis g \ficta fis e2. d8 c d2 e g8 f e d f e e4 ~ e
			
			d4 e1 g4 g a2. e4 R1
			a2 g8 g e4 r2 fis8 e16 d g4. fis16 e \ficta fis8 \ficta fis g2 R1
			g,4 g' f2 e r r a a4 a2 g4 ~ g g4 a4. a8
			a2 r R1 R r2 e4. e8
			
			cis4 e fis4. \ficta fis8 a2 fis d4. d8 b4. c16 d e4. d8 e f g2
			f4 r2 f2. e4 fis4 g d4. c8 b c d4 e2.
			d4 e4. fis8 g4 g d f ~ f d r2 e fis1 
			r2 r r4 d e e8 g a4 a e a4. g16 fis g4
			
			g2 fis e r r4 g e8 e4 fis8 g2 f!8 g a4
			r2 a, a4 a8 b c d e fis gis e a2 g8 fis gis2 a \fermata
		}
	}
	\addlyrics {
		Il -- lu -- mi -- na nos, mi -- se -- ri -- cor -- di -- 
		a -- rum mi -- se -- ri -- cor -- di -- a -- _ _ _ _ _ _ 
		rum De -- _ _ _ _ us, 
		
		il -- lu -- mi -- na nos, mi -- se -- 
		ri -- cor -- di -- a -- rum 
		mi -- se -- ri -- cor -- di -- a -- rum, mi -- se -- ri -- 
		cor -- di -- a -- _ _ _ _ _ _ _ rum De -- _ _ _ _ _ _ 
		
		_ us, sep -- ti -- for -- mi 
		Pa -- ra -- cli -- ti gra -- _ _ _ _ _ _ ti -- a,
		ut per e -- am a de -- lic -- to -- rum te -- ne -- 
		bris li -- be -- 
		
		ra -- ti, li -- be -- ra -- ti, li -- be -- ra -- _ _ _ _ _ _ _ 
		ti, vi -- tæ, vi -- tæ glo -- ri -- a, __ _ _ vi -- 
		tæ glo -- ri -- a per -- fru -- a -- mur, vi -- tæ, 
		vi -- tæ glo -- ri -- a per -- fru -- a -- _ _ _ 
		
		mur, vi -- tæ, vi -- tæ glo -- ri -- a, glo -- ri -- a
		per -- fru -- a -- _ _ _ _ _ _ _ _ _ _ _ mur.
	}
}

quintus = {
	\new Voice = "quintus" {
		\relative c {
			\clef "bass"
			R1 R R R
			R R R R r2 r4 e
			a2. a8 a b2 r R1 R
			r2 g c4 c8 c d4 a c a c c d2 b4 c4.
			
			bes8 a g a4 d, R1 R r2 e
			a4 a8 a g2 gis a fis4 g g a4 ~ a d,4 a'4. g8
			gis d \ficta gis4 a2 R1 a2 b4 a4 ~ a bes2 b!4
			d2 g,1 c8 b a g a2 a, R1
			
			R1 r2 g'4 g e1 b'
			r4 fis g4. g8 a4 a4. g16 fis d'4. d8 d,4 r2 r d4 d' ~ d
			c2 b4 c e,2 a4 d,1. b4 e e e fis2
			fis g4. g8 g2 r r e4. e8 e2 e ~
			
			e4 e d d' d4. d8 d,4 d g2 g1 c2
			c4 c2 a4 R1 R r2 c,4 e
			g4. f8 e2 d d4 d8 e f g a b cis a d2 cis4 d2
			d4 d, g2 g1 e2 f c'4. b8 a4 g4.
			
			a8 b4 d2 c r4 e,2 g4 g8 fis e4 d bes' a4. g8
			f2 r a2. cis,4 e1. e2 \fermata
		}
	}
	\addlyrics {
		Il -- 
		lu -- mi -- na nos,
		il -- 	lu -- mi -- na nos, mi -- se -- ri -- cor -- di -- a -- rum De -- 
		
		_ _ _ _ us, il -- 
		lu -- mi -- na nos, mi -- se -- ri -- cor -- di -- a -- rum De -- _ 
		_ _ _ us, mi -- se -- ri -- cor -- di -- 
		a -- rum De -- _ _ _ _ us,
		
		sep -- ti -- for -- mi 
		Pa -- ra -- cli -- ti gra -- _ _ _ ti -- a, ut per 
		e -- _ am, ut per e -- am a de -- lic -- to -- 
		rum te -- ne -- bris, te -- ne -- bris li -- 
		
		be -- ra -- ti, li -- be -- ra -- ti, li -- be -- ra -- 
		ti, vi -- tæ, vi -- tæ 
		glo -- ri -- a per -- fru -- a -- _ _ _ _ _ _ _ _ _ mur, 
		per -- fru -- a -- mur, vi -- tæ glo -- ri -- a, glo -- 
		
		ri -- a, vi -- tæ, vi -- tæ glo -- ri -- a, vi -- tæ glo -- ri -- 
		a per -- fru -- a -- mur.
	}
}

tenor = {
	\new Voice = "tenor" {
		\relative c {
			\clef "treble_8"
			R1 R R r4 e a2. 
			a8 a c2 ~ c4 gis4 a \ficta gis b b c1 g? r2
			R1 r2 r4 e'8 d c b c4 b8 a g4 c,2 r
			r c'4. bes8 a g a4 d,2 R1 r4 d g g8 g
			
			a4 c d1 d,2 e4 e g2 d r
			R1 R r2 e c'4 a e e
			b'2 a r4 c8 b a g a2 g8 f e4 e R1
			R r2 r4 f'8 e d c d a c2 d r
			
			R1 r2 e4 e c8 b c d e2. dis4 e2
			e4 d4. d8 c4. c4 b16 a d4. d8 a2 g4 d' b2 a
			r d, a'4 g2 fis4 g2 a4 a2 a4 b2 b a4 a2
			a4 c2 c b4. b8 b1. cis4. \ficta cis8
			
			e4 a, r8 d4 d8 a2. a4 b4. b8 d4 d, R1
			r4 f2 e4 a4. b8 c2 b a r c4 b2
			b c4 d4. e8 f2 c4 f, a2 g a
			fis r r r4 g4. b8 c4 r2 R1
			
			g4 d d8 e fis g a8. b16 c4 b2 e,4 e e8 fis g a b c d4. c16 b? a4 ~
			a8 g8 f e d e f4 e1 e'4 a, b4. c16 d e2 e, \fermata
		}
	}
	\addlyrics {
		Il -- lu -- 
		mi -- na nos, mi -- se -- ri -- cor -- di -- a -- rum 
		De -- _ _ _ _ _ _ _ us, 
		De -- _ _ _ _ us, il -- lu -- mi -- na 
		
		nos, mi -- se -- ri -- cor -- di -- a -- rum,
		mi -- se -- ri -- cor -- di -- 
		a -- rum De -- _ _ _ _ _ _ _ us, 
		De -- _ _ _ _ _ _ us, 
		
		sep -- ti -- for -- _ _ _ _ _ mi 
		Pa -- ra -- cli -- ti gra -- _ _ _ ti -- a, ut per e -- am, 
		ut per e -- _ am a de -- lic -- to -- rum, a de -- 
		lic -- to -- rum te -- ne -- bris, li -- be -- 
		
		ra -- ti, li -- be -- ra -- ti, li -- be -- ra -- ti,
		vi -- tæ glo -- ri -- a, vi -- tæ, vi -- tæ,
		vi -- tæ glo -- ri -- a per -- fru -- a -- mur, vi -- 
		tæ glo -- ri -- a 
		
		per -- fru -- a -- _ _ _ _ _ _ mur, per -- fru -- a -- _ _ _ _ _ _ _ _ _ 
		_ _ _ _ _ _ mur, per -- fru -- a -- _ _ _ mur.
	}
}

baritone = {
	\new Voice = "baritone" {
		\relative c {
			\clef "treble_8"
			R1 R R e4 e'2 e8 e
			f2 r R1 r2 r4 e, a a8 a b4 b2 c b4
			d d e d ~ d e4. d8 c b c2 g g c4 c8 c
			d4 d e c f, f a2 f4 f'4. e8 d c d4 g,2 r4
			
			r2 a4 bes2 a c4 c e b? d8 c b a b4 g r
			c d d8 d b2 r4 r2 r4 e2 f4 ~ f e2 d2.
			 d4 e4. d16 e f2 f, r4 r2 R1
			d'8 c b a b4 b c8 b a g a2. g8 f e4 e R1
			
			R1 r2 c'4 c a1 g4 fis gis8 \ficta gis b4
			R1 c8 b16 a d8 d b2 R1 r2 r4 a
			e'2 d4. c16 d e4 c r2 d1 d2 d4 e ~ e e4 d4. d8
			d2 r R1 r4 gis,4. \ficta gis8 \ficta gis4 a1 ~
			
			a2 a2. d2 d4 r d,4. d8 d'4 c8 c4 c8 g4 g
			r2 a4 c c4. b8 a2 d2. a4 d8 c b4. a8 g2
			d4 r2 g a R1 b4 g r8 d'4 c8
			b8 c d2 c b4 d8 c b4 r2 a4 a a8 b c d e c d b
			
			e4 d b2 e,1 b'8 a16 b c2 c4 d g,8 d'4 e8 f4 ~
			f8 e8 d cis d2 e4 c?8 d e e4 a,8 c b c d e4 d8 c b2 a \fermata
		}
	}
	\addlyrics {
		Il -- lu -- mi -- na 
		nos, il -- lu -- mi -- na nos, mi -- se -- ri -- 
		cor -- di -- a -- rum De -- _ _ _ _ us, il -- lu -- mi -- na 
		nos, mi -- se -- ri -- cor -- di -- a -- rum De -- _ _ _ _ us,
		
		mi -- se -- ri -- cor -- di -- a -- rum De -- _ _ _ _ us,
		il -- lu -- mi -- na nos, mi -- se -- ri -- cor -- 
		di -- a -- _ _ _ rum 
		De -- _ _ _ _ us, De -- _ _ _ _ _ _ _ us,
		
		sep -- ti -- for -- mi Pa -- ra -- cli -- ti 
		gra -- _ _ _ ti -- a, ut 
		per e -- _ _ _ am a de -- lic -- to -- rum te -- ne -- 
		bris, te -- ne -- bris li -- 
		
		be -- ra -- ti, li -- be -- ra -- ti, li -- be -- ra -- ti,
		vi -- tæ glo -- ri -- a per -- fru -- a -- _ _ _ _ 
		mur, vi -- tæ, vi -- tæ glo -- ri -- 
		a, __ _ _ vi -- tæ glo -- ri -- a per -- fru -- a -- _ _ _ _ _ _ _ 
		
		_ _ mur, per -- fru -- _ _ a -- mur, per -- fru -- a -- _ _ 
		_ _ _ _ mur, glo -- ri -- a per -- fru -- a -- _ _ _ _ _ _ _ mur.
	}
}

bassus = {
	\new Voice = "bassus" {
		\relative c {
			\clef "bass"
			r4 e a2. a8 a c4 c d c a f e2 a,1
				r2 R1 r2 c4. b8 a4 g8 f g2 e' e4 e
			d4 f a f g8 f e d16 c d4 e a2 e r f4. e8
			d2 c R1 r2 f4. e8 d c \ficta b! a g4 c
			
			f4 f8 f d2. d4 f e8 d c4 c g2 g r
			a4 d g,2 R1 R d'2 c8 b a4
			b4 b d2 c f8 e d c d2 r d1 ~ 
			d4 e8 fis e4. d8 c2 r f4 e8 d c b a4 g2 r
			
			R1 r2 e'4 e a,4. b8 c4 b8 a b2 e
			a,4 d8 d b4 c8 d16 e f!8 f fis4 b,4. c8 d4 d g2 d4 g \ficta f! d
			c2 d a1 g2 r R1 r2 d'
			d4 d c2 c e4. e8 e2 r a,4. a8 a2
			
			a4. a8 d2 d d4. d8 g,2 g c2. c4
			f,4. g8 a2 R1 b4. c8 d2 g, g'
			g,4. g8 g'2 g,4. g8 d'2 r4 a'4. g8 f d e2 d2.
			b2 c4 g4. g8 g'2 R1 a,4. b8 c a b4
			
			b4. a8 b2 c8 d e4 e2 r4 g8 fis e2 g,8 a bes c d4 d
			a1 a2 a4 a' e1. a,2 \fermata
		}
	}
	\addlyrics {
		Il -- lu -- mi -- na nos, mi -- se -- ri -- cor -- di -- a -- rum 
		De -- _ _ _ _ us, mi -- se -- ri -- 
		cor -- di -- a -- rum De -- _ _ _ _ _ _ _ us, De -- _ 
		_ us, De -- _ _ _ _ _ us, il -- 
		
		lu -- mi -- na nos, mi -- se -- ri -- _ cor -- di -- a -- rum 
		De -- _ us, mi -- se -- _ ri -- 
		cor -- di -- a -- rum De -- _ _ _ us, De -- 
		_ _ _ _ us, De -- _ _ _ _ _ us,
		
		sep -- ti -- for -- _ _ _ _ _ mi 
		Pa -- ra -- cli -- ti gra -- _ _ _ ti -- a, gra -- _ _ ti -- a, ut per e -- am,
		ut per e -- am a 
		de -- lic -- to -- rum te -- ne -- bris, te -- ne -- bris 
		
		li -- be -- ra -- ti, li -- be -- ra -- ti, vi -- tæ 
		glo -- ri -- a, glo -- ri -- a, vi -- tæ 
		glo -- ri -- a, glo -- ri -- a per -- _ _ fru -- a -- mur,
		vi -- tæ glo -- ri -- a per -- _ _ _ fru -- 
		
		a -- _ mur, vi -- _ _ tæ glo -- ri -- a per -- _ _ _ _ fru -- 
		a -- mur, per -- fru -- a -- mur.
	}
}


\score {
	<<
		\new StaffGroup
	  	<< 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\new Staff << \global \cantus >> 
			\new Staff << \global \sextus >> 
			\new Staff << \global \altus >>
		>>
		\new StaffGroup
	  	<< 
			\new Staff << \global \tenor >>
			\new Staff << \global \baritone >>
			\new Staff << \global \quintus >>
			\new Staff << \global \bassus >>
		>>
	>>
	\layout { }
%	\midi { }
}
