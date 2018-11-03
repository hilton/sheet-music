soprano = \new Voice {
	\relative c'' {
		R1 R R g1 fis2 g g1 a b4. c8 d4 b a d4. c8 b a 
		g4. f8 e4 d a'1 fis4. g8 a2 r1 r1 r2 r4 a c2 a4 a c b a2 
		g2. g4 e a4. g8 g4. fis8 fis4 g2 e r g1. a2 b g a2. a4 
		g1 c b2 g2. fis8 e fis2 g4 d'2 c4 b a g f e f g2 g1\fermata \showBarLine \bar "||"
	}
	\addlyrics {
		A -- gnus __ _ De -- i, A -- _ gnus De -- i, A -- _ _ _ _ _ gnus __ _ De -- _ _ i,
		qui tol -- lis pec -- ca -- ta mun -- di, pec -- _ ca -- _ _ _ ta mun -- di,
		do -- na e -- is re -- qui -- em, sem -- pi -- ter -- _ _ _ nam, sem -- pi -- ter -- _ _ _ _ _ _ nam.
	}
}

alto = \new Voice {
	\relative c' {
		R1 R r2 d1 cis2 d d e4 c2 d4 cis d2 cis4 d1 r4 d2 d4 
		e2 g4. f8 e4 d2 cis4 d d f d d f4. e8 d2 c4 d1 cis2 e2 e e2. d8 c 
		b4 e d e2 f2 e4 d4. c8 b2 r c d e e4 g2 fis4 g d e1 fis2 
		g4 g,2 g4 c8 d e f g1 d2. d4 d2 b4. c8 d2 r g2. f4 e2 d1\fermata
	}
	\addlyrics {
		A -- gnus __ _ De -- i, A -- gnus De -- _ _ i, A -- gnus De -- _ _ _ _ _ i,
		qui tol -- lis pec -- ca -- _ _ ta mun -- di,
		qui tol -- lis __ _ _ _ pec -- _ _ ca -- ta mun -- _ di,
		do -- na e -- is re -- _ _ qui -- em,
		do -- na e -- is re -- _ qui -- _ em,
		sem -- pi -- ter -- nam, __ _ _
		sem -- pi -- ter -- nam.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8" 
		R1 R R R R R R g1 fis2 g 
		g1 a1. r4 a4 a2 a2. g4 a f g2 a r4 a c2 a4 b c d2 
		c4. \autoBeamOff b8 \autoBeamOn b a16 b c4 f, g2 r1 g2 a b g4 c2 e4 d1 c1 d 
		e2 e4 c2 c4 d2 b4 b a4 d, r d'4. c8 b2 a4 g a b2 c1 b1\fermata
	}
	\addlyrics {
		A -- gnus __ _ De -- i,
		qui tol -- lis pec -- ca -- ta mun -- di,
		qui tol -- lis pec -- _ ca -- _ _ _ _ _ _ _ ta,
		do -- na e -- is re -- qui -- em,
		do -- na e -- is re -- qui -- em,
		sem -- pi -- ter -- nam,
		sem -- _ _ pi -- ter -- _ _ _ nam.
	}
}

baritone = \new Voice {
		\relative c' {
		\clef "treble_8" 
		d1 cis2 d b a b g a b c c,4 d e f e2 r4 g8 a b c d2 a4 b2 
		c4 c,8 d e f g2 f4 e2 d r d f d4 e f4. e8 d2 e4 a a2 a2. gis4 a f 
		g1 a4 a c4. b8 a2 g4 b c2 r r1 r g2 e a1 
		b2 c g g g g a1 g\breve ~ g1 ~ g1\fermata
	}
	\addlyrics {
		A -- gnus __ _ De -- _ i, A -- _ gnus __ _ De -- _ _ _ i,
		A -- _ _ _ _ gnus De -- i, A -- _ _ _ _ gnus De -- i,
		qui tol -- lis pec -- ca -- ta mun -- di,
		qui tol -- lis pec -- ca -- ta mun -- di, pec -- ca -- ta mun -- _ _ di,
		do -- na e -- is re -- qui -- em,
		sem -- pi -- ter -- nam.
	}
}

bass = \new Voice {
	\relative c' {
		\clef "bass"
		R1 r2 g1 fis2 g e d g, c2. b4 a1 g d'2 g, 
		c2. b4 c d a2 r d f d4 d f4 e d4. c8 bes2 a1. r1 
		r r2 c d e c f4 a g2 c, r1 r2 c a d 
		g, c2. c4 c2 g g d'1 g,2 g'2. f4 e d c1 g1\fermata
	}
	\addlyrics {
		A -- gnus __ _ De -- _ i, A -- gnus De -- i, A -- gnus De -- _ _ _ i,
		qui tol -- lis pec -- ca -- ta mun -- _ _ di,
		do -- na e -- is re -- _ qui -- em,
		do -- na e -- is re -- qui -- em,
		sem -- pi -- ter -- nam,
		sem -- pi -- ter -- _ _ nam.
	}
}

\score {
	<<
		\new ChoirStaff
		<< 
			\new Staff << \global \keyA \soprano >> 
			\new Staff << \global \keyA \alto >> 
			\new Staff << \global \keyA \tenor >>
			\new Staff << \global \keyA \baritone >>
			\new Staff << \global \keyA \bass >>
		>>
	>>
	\layout {
	}
}
