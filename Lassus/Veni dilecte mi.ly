\version "2.13.16"
\pointAndClickOff

\header {
	title = "Veni dilecte mi"
	composer = \markup \column \right-align { "Orlando di Lasso (1532 - 1594)" }
	tagline = \markup \small { 
		\left-align \center-column {
			\line { Source: Martyn Imrie, from \italic { Orlandi Lassi Musici… Fasciculi Aliquot Sacrarum Cantionum, } Nuremberg, 1582 }
			\line { Version 1. Copyright ©2011 Cappella Gabrieli - \with-url #"http://cappellagabrieli.nl" http://cappellagabrieli.nl - Licensed under the Creative Commons }
			\line { Attribution-Noncommercial-No Derivative Works 3.0 License - \with-url #"http://creativecommons.org/licenses/by-nc-nd/3.0" http://creativecommons.org/licenses/by-nc-nd/3.0 }
		}
	}
}

global = { 
	\key a \minor
	\time 2/2
	\tempo 2 = 55
	\set Staff.midiInstrument = "choir aahs"
	#(set-global-staff-size 17)
	#(set-accidental-style 'forget)
}

\paper {
	annotate-spacing = ##f
	between-system-spacing = #'((space . 15) (padding . 0))
	top-margin = 10\mm
	bottom-margin = 10\mm
	left-margin = 15\mm
	right-margin = 15\mm
	foot-separation = 10\mm
	ragged-bottom = ##t
}

ficta = { \once \set suggestAccidentals = ##t }

showBarLine = { \once \override Score.BarLine #'transparent = ##f }

cantus = \new Voice	{
	\relative c'' { 
		cis2 fis, r4 cis' d8 cis b d cis2 b a4 a2 b a4 fis b4. 
		\ficta ais16 \ficta gis \ficta ais4 b8 \ficta a! g b ais4 ais2 b4 r g a8 g fis a g4 g a cis d8 cis b d cis4 a a a b a8 g
		fis4 g a cis d8 cis b d cis4 cis b b4. \ficta ais16 \ficta gis \ficta ais4 b2. b4 cis2 r r4 b b b
		a fis a2 a b r4 d d d cis a r b b b a fis a4. \ficta gis16 fis gis4 a4.
		d,8 d'4. cis16 b cis4 d2 b2. b4 b2 a r cis2. cis4 cis4. d8 e4 b4.
		cis8 d2 a4. b8 cis d e1 e2 cis4 \mark \default cis2 cis4 b cis4. a8 d4. cis8 b a \ficta gis fis gis4
		a2 r R1 a2 a4 a b4. a8 g2 fis r cis' cis4 cis
		d2. b4 r b4. cis8 d e fis4. e16 d cis8 b cis d e4 b4. cis8 d4. cis8 b2 \ficta ais4 b1 \showBarLine \bar "||"
	}
	\addlyrics {
		Ve -- ni di -- lé -- _ _ _ _ cte mi, di -- lé -- cte mi, di -- 
		_ _ _ lé -- _ _ _ _ cte mi, di -- lé -- _ _ _ _ cte mi, di -- lé -- _ _ _ _ cte mi, di -- lé -- _ _
		_ cte mi, di -- lé -- _ _ _ _ cte mi, di -- _ _ _ lé -- cte mi, e -- gre -- di -- 
		á -- mur in a -- grum, e -- gre -- di -- á -- mur, e -- gre -- di -- á -- mur in __ _ _ _ a --
		_ _ _ _ _ grum, com -- mo -- ré -- mur, com -- mo -- ré -- _ _ mur __
		_ _ in __ _ _ _ _ vil -- lis. Ma -- ne sur -- gá -- _ _ _ _ _ _ _ _
		mus, ma -- ne sur -- gá -- _ _ mus, ma -- ne sur -- 
		gá -- mus ad __ _ _ _ _ _ _ _ _ _ _ _ ví -- _ _ _ _ ne -- as.
	}
}

altus = \new Voice {
	\relative c' { 
		R1 fis2 b, r4 fis' g8 fis e g fis4 e fis1 r4 fis
		g fis8 e d4 e fis4. e16 d cis4 d d e fis r8 fis d4 e fis2. d4 e8 d cis e d e fis d g4 e
		r2 r4 a a g e fis g2. fis4 fis1 r4 a a a g8 e g4 g g
		fis8 g a d, e4 a,8 b cis d e fis g4 g g g fis d e cis b g' g4 fis16 e d8 e fis g a fis2 r4 e
		fis4. g8 a2 fis g2. g4 g2 fis4 fis2 fis4 fis4. g8 a2 a4 a g2
		g4 g a fis2 e4 e b'4. a8 a4. \ficta gis16 fis \ficta gis4 a1 r1 r2 r4 e
		e e fis2. d4. e8 fis4 cis cis cis d2 b4 r e a a g8 fis16 e fis8 g a2 a
		fis4 g8 fis g a g4 g fis r fis4. g8 a4 e4. fis8 g4 g fis8 e d cis b4 fis' fis4. fis8 dis1
	}
	\addlyrics {
		Ve -- ni di -- lé -- _ _ _ _ cte mi, di -- lé -- _ _ _ cte mi __ _ _ _, di -- lé -- cte mi, di -- lé -- cte mi, di -- lé -- _ _ _ _ _ _ _ _ cte
		di -- lé -- cte mi, di -- lé -- cte mi, e -- gre -- di -- á -- _ _ mur in
		a -- _ _ _ _ grum,__ _ _ _ _ _ _ e -- gre -- di -- á -- mur in a -- grum, in a -- _ _ _ _ _ _ _ grum, in
		a -- _ _ grum, com -- mo -- ré -- mur, com -- mo -- ré -- _ _ mur in vil --
		lis, com -- mo -- ré -- mur in vil -- _ _ _ _ _ lis. Ma --
		ne sur -- gá -- mus, __ _ _ ma -- ne sur -- gá mus, ma -- ne sur -- gá -- _ _ _ _ _ mus
		ad ví -- _ _ _ _ ne -- as, ad __ _ _ ví -- _ _ ne -- as, __ _ _ _ _ ad ví -- ne -- as.

	}
}

tenor = \new Voice {
	\relative c' { 
		\clef "treble_8"
		R1 R R R r4 cis d8 cis b d cis4 cis b2 r fis' b, cis4 d8 cis b d cis b cis2 b a r r4 cis
		d8 cis b d cis d e4 fis d r cis d8 cis b d cis4 cis b2 r4 fis' fis fis e cis b b4. cis8 d4. 
		cis8 a b cis d e4 cis2 r4 b b b a fis r e' e e d b \override TupletNumber #'stencil = ##f \times 1/1 { d2 cis4. } d8 e2
		\override TupletNumber #'stencil = ##f \times 1/1 {d e} d4 \mark \default d2 d4 d4. cis8 b4 g r a2 a4 a4. b8 cis4 cis4. d8 e2 e4
		d4. e8 fis e d4 cis4. b16 a b4 b \override TupletNumber #'stencil = ##f \times 1/1 { c2 b } a e' e4 e fis2 d r
		r4 a a a b2 g4 d' e fis fis4. e8 d8 b d4. cis16 b cis4 d a b b a8 b cis d e fis e4
		d4 b d d g,8 a b cis d4 d2 cis4. d8 e4 e d r b \override TupletNumber #'stencil = ##f \times 1/1 { d2 cis4. } cis8 b1
	}
	\addlyrics {
		di -- lé -- _ _ _ _ cte mi,  ve -- ni di -- lé -- _ _ _ _ _ _ cte mi, di -- 
		lé -- _ _ _ _ _ _ cte mi, di -- lé -- _ _ _ _ cte mi, e -- gre -- di -- á -- mur in a -- _ _
		_ _ _ _ _ _ grum, e -- gre -- di -- á -- mur, e -- gre -- di -- á -- mur in __ _ _ _ 
		a -- _ grum, com -- mo -- ré -- _ _ mur, com -- mo -- ré -- _ _ mur __ _ _ in
		vil -- _ _ _ _ lis, __ _ _ _ in vil -- _ lis. Ma -- ne sur -- gá -- mus,
		ma -- ne sur -- gá -- mus, ma -- ne sur -- gá -- _ _ _ _ _ _ _ mus, ma -- ne sur -- gá -- _ _ _ _ _ _
		mus ad ví -- ne -- as, __ _ _ _ _ ad __ ví -- _ _ ne -- as, ad ví -- _ ne -- as
	}
}

tenorB = \new Voice {
	\relative c' { 
		\clef "treble_8"
		R1 R R r4 cis d8 cis b d cis2 b8 cis d b 
		e4 cis r2 cis2 fis,4 fis g8 fis e g fis g a fis b a g b a4 a fis2 r4 e' fis8 e d fis e2
		d4 d e8 d cis e d4. cis16 b cis4 a r d e cis d \mark \default d d d cis2 cis4 e e e d b
		d4. cis16 b a8 b cis d e4. d16 cis d4 e d2 r4 a a a g e g2 fis4 d r a' b a
		a2 a4 a a2 g r4 d'2 d4 d2 cis4 cis2 cis4 fis2 e4 a,4 b1
		a e2 e'1 e2 r r1 b2 b4 b
		cis4. b8 cis4 d4. e8 fis4 b,2 a4. a8 a2 r1 r4 d4 d d e4. d8 cis4 a
		r d b8 a b cis d4. e8 fis4 b, a2 r4 a4 b8 a b cis d e fis fis, g4 fis fis2 ~ fis1
	}
	\addlyrics {
		di -- lé -- _ _ _ 
		_ cte __ _ _ _ _ mi,  ve -- ni di -- lé -- _ _ _ _ _ _ _ _ _ _ _ _ cte mi, di -- lé -- _ _ _ _
		cte, di -- lé -- _ _ _ _ _ _ _ cte, di -- lé -- cte mi, e -- gre -- di -- á -- mur, e -- gre -- di -- á -- mur
		in __ _ _ _ _ _ _ _ _ _ _ a -- grum, e -- gre -- di -- á -- mur in a -- grum, e -- gre -- di -- 
		á -- mur in a -- grum, com -- mo -- ré -- mur, com -- mo -- ré -- mur in vil --
		lis, __ in vil -- lis. Ma -- ne sur -- 
		gá -- _ _ mus __ _ _ ad ví -- ne as, ma -- ne sur -- gá -- _ _ mus
		ad ví -- _ _ _ _ _ _ ne -- as, ad ví -- _ _ _ _ _ _ _ _ ne -- as. __
	}
}

bassus = \new Voice {
	\relative c { 
		\clef bass
		R1 R R R fis2 b,
		r4 fis' g8 fis e g fis4 fis2 b,4 r2 r4 fis' g8 fis e g fis4 fis b,2 r1 r4 a'
		b8 a g b a4 a d, g a8 g fis a g4. fis8 e4 fis b, b' b b a fis a2 e4. fis8 g2
		d r4 a'4 a a g e g2 \override TupletNumber #'stencil = ##f \times 1/1 { d a } e' r r4 fis fis fis e cis
		d2 a d r4 g2 g4 g2 d fis2. fis4 fis4. g8 a2 e4. fis8
		g2 d4. e8 fis g a4. gis16 fis gis4 a2 e r4 a2 a4 gis a4. fis8 b4. a8 \ficta g! fis e dis e4
		a4. g8 fis e d cis b2 r r4 fis'4 fis fis g4. fis8 e2 d r r4 a'4 a a
		b4. a8 g fis g a b2 b,4. cis8 d e fis g a4. g16 fis e8 fis g a b4 b, b8 cis d e fis4. fis8 b,1
	}
	\addlyrics {
		Ve -- ni,
		di -- lé -- _ _ _ _ cte mi,  di -- lé -- _ _ _ _ cte mi, di
		lé -- _ _ _ _ cte mi, di -- lé -- _ _ _ _ _ _ cte mi, e -- gre -- di -- á -- mur in a -- _ _
		grum, e -- gre -- di -- á -- mur in a -- _ grum, e -- gre -- di -- á -- mur
		in a -- grum, com -- mo -- ré -- mur, com -- mo -- ré -- _ _ mur __ _
		_ in __ _ _ _ _ _ _ _ vil -- lis. Ma -- ne sur -- gá -- _ _ _ _ _ _ _ _ 
		mus, __ _ _ _ _ _ _ ma -- ne sur -- gá -- _ _ mus, ma -- ne sur -- 
		gá -- _ _ _ _ _ _ mus __ _ _ _ _ _ _ _ _ _ _ _ _ _ ad ví -- _ _ _ _ ne -- as.
	}
}

\markup \fill-line { \pad-to-box #'(0 . 0) #'(0 . 5)
	\left-align \center-column {
		\line {
			Come, my beloved; let us go forth into the fields, let us abide in the villages.
		}
		\line {
			Let us arise and go early to the vineyards, let us see if the vines flourish, 
		}
		\line {
			if the blossom be ready to bring forth fruits, if the pomegranates are in flower.
		}
		\line {
			There I will give thee my breasts.
		}
		
	}
}

\score {
	<<
		\new ChoirStaff
	  	<< 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\override Score.MetronomeMark #'transparent = ##t
			\new Staff << \global \transpose b a { \cantus } >> 
			\new Staff << \global \transpose b a { \altus } >> 
			\new Staff << \global \transpose b a { \tenor } >> 
			\new Staff << \global \transpose b a { \tenorB } >> 
			\new Staff << \global \transpose b a { \bassus } >> 
		>> 
	>>
	\layout {
		indent = #0
		\context { 
			\Score
			\override BarLine #'transparent = ##t
			\override BarNumber #'transparent = ##t
		} 
		\context { 
			\Voice 
			\consists "Ambitus_engraver" 
			\override NoteHead #'style = #'baroque
		} 
		\context {
			\Score
			between-system-spacing = #'((space . 10) (padding . 0))
        }
	}
	\midi {
	}
}
