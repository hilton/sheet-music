\version "2.14.2"

\header {
	title = "Lagrime di San Pietro - XXI"
	composer = "Orlando di Lasso"
	opus = "3’25”"
	copyright = \markup {
			\column {
				" "
				" "
				"Copyright ©2012 Peter Hilton - Tallis Scholars Summer Schools 2012 edition - based on Ausgabe Kallmeyer Nr 60 - translation from cpdl.org"
			}
	}
	tagline = ##f
}


\paper {
	annotate-spacing = ##f
	indent = 0\cm
	left-margin = 10\mm
	right-margin = 10\mm
	ragged-bottom = ##f
	ragged-last-bottom = ##f
	top-markup-spacing = #'(
		(padding . 15)
	)
	markup-markup-spacing = #'(
		(padding . 10)
	)
	system-system-spacing = #'(
        (stretchability . 100)
	)
}

\layout {
  \context {
    \Score
    \remove "Bar_number_engraver"
	\override BarLine #'transparent = ##t
  }
  \context {
  	\Staff
  }
}

\markup \fontsize #2 {
	\fill-line {
	    \hspace #1
		\column {
			"Vide homo quae pro te patior,"
			"Ad te clamo, qui pro te morior,"
			"Vide poenas quibus afficior;"
			"Vide clavos quibus confodior;"
			"Nón est dolor sicut quo crucior;"
			"Et cum sit tantus dolor exterior, "
			"Ingratus tamen dolor est gravior,"
			"Tam ingratum cum te experior."
			""
		}
	    \hspace #1
		\column {
			"See, O man, what things I endure for you,"
			"To you I cry, I who am dying for you,"
			"See the pains with which I am afflicted;"
			"See the nails with which I am pierced;"
			"There is no suffering like crucifixion."
			"And though the outward suffering be so great,"
			"Yet is the inward suffering heavier still,"
			"When I find you to be so ungrateful."
		}
	    \hspace #1
	}
	\vspace #2
}

global = { 
	\key e \minor
	\tempo 2 = 60
	\set Score.proportionalNotationDuration = #(ly:make-moment 1 4)
	\set Staff.midiInstrument = "choir aahs"
	#(set-global-staff-size 14)
	#(set-accidental-style 'forget)
}

sopranoA = \new Voice {
	\relative c' {
		e1. e2 gis1 b r\breve r r
		r r1 \mark \default r2 b1 b2 c1 b2. c4 d1 d r r\breve
		r1 r2 f,2. e8 d e2 d d'1 c4 b c b b a8 g b4 a a2. gis8 fis gis2 a1 r
		r\breve r2 d1 b c2. b4 a b c g c2. b8 a b2 c1 r
		
		r\breve r1 \mark \default b g2 c1 a2 r c1 a2 r c1 a2
		b g d'2. d4 g,2 g r1 r\breve r r2 \mark \default e1 e2
		fis1 a b2. a4 g2 a a1. g2 g2. g4 e1 r\breve
		r r r1 \mark \default e2. e4 b'2 e, a2. a4 g1 c
		
		r2 d b c a1 g1. g2 a e4 fis g a b1 fis2 gis b e, a
		b1 r d2. b4 c2 b b1. fis2 gis1 a2. a4 gis\breve
		\once \override Score.BarLine #'transparent = ##f \bar "||"
	}
	\addlyrics {
		Ví -- de hó -- mo
		Ad te clá -- _ _ _ mo,
		Ví -- _ _ _ de póe -- _ _ _ _ _ _ _ _ _ _ _ _ _ nas
		Ví -- de clá -- _ _ _ _ _ _ _ _ _ vos
		
		Nón est, nón est, nón est, nón est,
		dó -- lor, nón est dó -- lor. Et cum
		sit tán -- tus __ _ _ dó -- lor ex -- té -- ri -- or, 
		Tam in -- grá -- tum, tam in -- grá -- tum,
		
		tam in -- grá -- tum cum te ex -- pé -- _ _ _ _ ri -- or, tam in -- grá --
		tum tam in -- grá -- tum cum te ex -- pé -- ri -- or.
	}
}

sopranoB = \new Voice {
	\relative c'' {
		r1 b1. b2 gis1 a r r\breve r
		r r1 fis gis a g?2. fis8 e a1 b r r\breve
		r g2. a4 b1 fis2 g1 fis4 e fis2. e4 d2 e r\breve
		r r1 r2 g1 e2 c1 g' g\breve r1
		
		r\breve r1 r2 g e1 r2 c'1 a2 r c1 a d2 ~
		d c2. b8 a b2 c1 r r\breve r r1 a ~
		a2 a fis1 g e2 f1 e2 d1 e2. e4 gis1 r\breve
		r r r1 r2 b gis a fis1 r r2 a ~
		
		a2 fis g e r d'1 b2 c1. a2 b g r b1 gis2 a fis
		fis1 gis2 a1 g? g2 fis r4 e fis2 b b1 c2. c4 b\breve
	}
	\addlyrics {
		Ví -- de hó -- mo
		Ad __ _ te clá -- _ _ _ mo,
		Ví -- _ _ _ de póe -- _ _ _ _ nas
		Ví -- de clá -- _ vos
		
		Nón est, nón est, nón est, dó -- 
		_ _ _ _ lor Et 
		cum sit tán -- tus dó -- lor ex -- té -- ri -- or, 
		Tam in -- grá -- tum, tam
		
		in -- grá -- tum, tam in -- grá -- tum cum te, tam in -- grá -- tum
		cum te ex -- pé -- ri -- or, cum te ex -- pé -- _ ri -- or.
	}
}

altoA = \new Voice {
	\relative c' {
		r\breve r1 r2 b e1 a, b1. g2 g d'1 c2
		c4 d e c d2 e1 dis2 dis1 r\breve r r2 \mark \default d1 d2 e2. d4 c1
		b1 a2. a4 g1 r r\breve r cis1 d2 e
		d1. d2 b2. c4 d1 r\breve r e2. d4 cis2 d
		
		d2 d1 c2 b1 b c2 r4 g a1 c a2 a f'2. e8 d c2 r4 d
		b2 c d1 r2 c g d'2. cis8 b cis2 d b b b cis d1 cis2. cis4 cis2
		r\breve r r r1 r2 \mark \default e cis cis1 d2
		e2 f2. e8 d e2 d e1 d2. c8 b c2 b b r1 r2 a b g2. e4 e'2
		
		fis2 d2. b4 a2 a1 d e\breve e2 e1 dis2 e1 r
		r e2 cis d b r\breve b1 gis2 b e, e' e\breve
	}
	\addlyrics {
		quae pro te pá -- ti -- or, quae pro
		te __ _ _ _ _ pá -- ti -- or. qui pro te __ _ _ 
		mó -- _ ri -- or, quí -- bus af -- 
		fí -- ci -- or; __ _ _ quí -- _ _ bus
		
		con -- fó -- di -- or; Nón est, nón est, nón est, dó -- lor __ _ _ _ nón
		est dó -- lor síc -- ut quo __ _ _ _ crú -- ci -- or, síc -- ut quo crú -- ci -- or;
		In -- tus ta -- men		
		dó -- lor __ _ _ _ est grá -- _ _ _ _ vi -- or, Tam in -- grá -- _ _
		
		tum, tam in -- grá -- tum cum te ex -- pé -- ri -- or,
		tam in -- grá -- tum, cum te ex -- pé -- ri -- or.
	}
}

altoB = \new Voice {
	\relative c' {
		r\breve e1. e2 cis1 d r\breve r
		r r e1 a,2 e'2. fis4 g2. fis8 e fis2 g1 r r\breve
		r1 \mark \default c,\breve g2. a4 b2 e1 d4 c d2. c4 b1 e r
		r\breve \mark \default d1 b2 d e c a f'2. e4 e d8 c d1 c r
		
		r\breve r1 r2 e1 c2 e1 f\breve r2 c a r4 f'
		d2 e4. fis8 g1 e r r\breve r r
		d1 d1. e2 b d c1 a2 b c b b1 r\breve
		r r r1 r2 e1 cis2 d1. e2 c2. c4
		
		a2 b r r4 e cis2 d b d c\breve b1 fis'2. b,4 b1 r2 d ~
		d b1 e2 a, d e1 dis2 e1 dis2 e e1 e, b'2 b1
	}
	\addlyrics {
		Ví -- de hó -- mo
		Ad te clá -- _ _ _ _ _ mo,
		Ví -- de __ _ _ póe -- _ _ _ _ _ nas,
		Ví -- de clá -- vos, vi -- de clá -- _ _ _ _ _ vos
		
		Nón est dó -- lor, nón est, nón
		est dó -- _ _ lor,
		Et cum sit tán -- tus dó -- lor ex -- té -- ri -- or, 
		Tam in -- grá -- tum, tam in -- 
		
		grá -- tum, tam in -- grá -- tum cum te ex -- pé -- ri -- or, tam
		in -- grá -- tum cum te ex -- pé -- ri -- or, ex -- pé -- ri -- or.
	}
}

tenor = \new Voice {
	\relative c {
		\clef "treble_8" 
		r\breve r1 e1. a1 d,2 d1 e2. e4 d2. e4 f2 e
		e2. e4 b'1 ~ b\breve r2 e1 a,2 e'1 d g, fis a2 g e2. fis4
		g2 g c,\breve r1 r\breve r a'1. e2
		fis1 g2 d d1 g e f2. e8 d c1 g' r2 e1 fis2
		
		g2. d4 f2 e1 d2 g\breve c1 a2. b4 c2 f, c1 r2 f ~
		f e d1 c2 e1 fis2 g fis4 e fis2 d1 g fis2 e\breve
		r2 d1 d2 g e1 d2 a'1 fis2 g e2. e4 e1 e2. e4 a2 a
		c\breve b1 c2 a1 a2 gis1 r r2 d d g1 a2
		
		r4 fis2 d e c4 e2 d d g2. g4 g2 r e2. fis4 g a b2 b1 b2 a1
		r1 r2 a2. fis4 d2 g e fis g fis1 e2. e4 e1 ~ e\breve
	}
	\addlyrics {
		quae pro te pá -- _ ti -- or, quae pro te
		pá -- ti -- or, Ad te clá -- _ mo, qui pro te mó -- _
		_ ri -- or, quí -- bus
		af -- fí -- ci -- or; Ví -- de clá -- _ _ _ vos quí -- bus
		
		con -- _ _ fó -- di -- or; Nón est __ _ _ dó -- lor, nón
		est dó -- lor, síc -- ut quo __ _ _ _ crú -- _ ci -- or;
		Et cum sit tán -- tus dó -- lor ex -- té -- ri -- or, In -- tus ta -- men
		dó -- lor est grá -- vi -- or, Tam in -- grá -- tum
		
		tam in -- grá -- tum cum te ex -- pé -- ri -- or, ex -- _ _ _ _ pé -- ri -- or,
		tam in -- grá -- tum cum te ex -- pé -- _ ri -- or.
	}
}

baritone = \new Voice {
	\relative c {
		\clef "treble_8" 
		r\breve r r2 e fis1 g2 d'1 c2. b8 a b2 a1
		g1. g2 fis\breve r r r1 a c2. b8 a g2 c,
		d2 e f1 r\breve r r1 r2 \mark \default e1 e2 fis a1 
		 b1 a2 g2. fis8 e d1 r\breve r g1 a
		
		b1 a g2 fis e1 r2 e1 c2 f1 f2 r4 c' a2 f2. g4 a2
		g\breve \mark \default g1 c2 b1 a4 g b a g fis g fis8 e d2 a'2. a4 a\breve
		r r r r1 r2 b a1 e2 fis
		a1 g\breve  f1 e2. e4 e1 r2 a1 fis2 g2. fis4 e1
		
		d1 r\breve g1 e a g fis2. fis4 e1 r2 fis2 ~
		fis d e1 d2 r4 g2 e4 b'2 b1 r2 b b r4 b4 a2. a4 b1 b,
	}
	\addlyrics {
		quae pro te, quae pro __ _ _ _ te
		pá -- ti -- or, qui pro __ _ _ _ te
		mó -- ri -- or, quí -- bus af -- fí -- 
		_ ci -- or; __ _ _ _ quí -- _
		
		bus con -- fó -- di -- or; Nón est dó -- lor, nón est dó -- _ _
		lor, síc -- ut quo __ _ _ _ _ _ _ _ _ _ _ crú -- ci -- or;
		In -- tus ta -- men		
		dó -- lor est grá -- vi -- or, Tam in -- grá -- _ _
		
		tum cum te ex -- pé -- _ ri -- or, tam
		in -- grá -- tum, tam in -- grá -- tum cum te ex -- pé -- ri -- or. __ _
	}
}

bass = \new Voice {
	\relative c {
		\clef "bass" 
		r\breve r a1 d g,\breve ~ g1 a
		c2. c4 b1 ~ b\breve r r r1 d a2 c2. b4 a2
		g2. g4 f1 r\breve r r a1 d2 cis
		d4 c? b a g2 fis g\breve r r c2. b4 a2 d
		
		g,1 a b2. b4 e,1 c' a f\breve ~ f
		g r2 c1 d2 e1 b2. a4 g2 b a1 ~ a\breve
		r r r r1 r2 e' a, a1 d2
		c\breve g1 a a2. a4 e1 r d' b2 c1 a2
		
		r2 b g a1 fis2 g1 c a e'2 e b1 r2 e2 cis d
		b1 r2 a fis g e1 b'\breve e,2 e a2. a4 e\breve
	}
	\addlyrics {
		quae pro te pá -- 
		_ ti -- or, qui pro te __ _ _
		mó -- ri -- or, quí -- bus af -- 
		fí -- _ _ _ _ ci -- or; quí -- _ _ bus
		
		con -- _ fó -- di -- or; Nón est dó --
		lor síc -- ut quo crú -- _ _ ci -- or;
		In -- tus ta -- men		
		dó -- lor est grá -- vi -- or, Tam in -- grá -- tum
		
		tam in -- grá -- tum cum te ex -- pé -- ri -- or, tam in -- grá -- 
		tum, tam in -- grá -- tum cum te ex -- pé -- ri -- or.
	}
}

\score {
	\transpose e fis {
		<<
			\new Staff << \global \sopranoA >>
			\new Staff << \global \sopranoB >>
			\new Staff << \global \altoA >>
			\new Staff << \global \altoB >>
			\new Staff << \global \tenor >>
			\new Staff << \global \baritone >>
			\new Staff << \global \bass >>
		>>
	}
	\layout {
		\context { 
			\Voice 
			\consists "Ambitus_engraver" 
			\override NoteHead #'style = #'baroque
		}
		\context {
			\Staff
			\override VerticalAxisGroup #'default-staff-staff-spacing = #'(
				(basic-distance . 4)
				(minimum-distance . 4)
				(padding . 0)
				(stretchability . 0)
			)
		}
	}
	\midi { }
}

