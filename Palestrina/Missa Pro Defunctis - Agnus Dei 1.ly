soprano = \new Voice {
	\relative c'' {
		R1 R R g fis2 g g1 a g2 a4 g2 fis4 g2 
		r4 g2 fis4 g4 a4. g8 g2 fis8 e fis2 g1 r r r a \break
		a2 a2. gis4 a fis4 gis2 a1 r4 a a2 b c4 a2 gis4 a1 r 
		r r g1. a2 b2 g a g2. fis8 e fis4 fis g1\fermata \showBarLine \bar "||"
	}
	\addlyrics {
		A -- gnus __ _ De -- i, A -- gnus De -- _ i, A -- gnus __ _ De -- _ _ _ _ _ i,
		qui tol -- lis pec -- ca -- ta mun -- di, pec -- ca -- ta mun -- _ _ di,
		do -- na e -- is re -- _ _ _ _ qui -- em,
	}
}

alto = \new Voice {
	\relative c' {
		R1 d cis2 d e4 d2 cis4 d2 e2. d8 c d2 f1 e2 e2. d8 c d4. c16 b 
		a4 g a2 e'2. c4 d2. a4 b4. c8 d2 r4 d d2 d2. cis4 d b cis2 d e 
		f e e cis4 d b2 a e' f e e e4 f e2 e c1 d2 
		e c1 d4. d8 d2 e2. d4 d1 e2 r4 e2 d8 c d2 d d1\fermata
	}
	\addlyrics {
		A -- gnus De -- _ _ _ _ _ _ _ i, A -- gnus De -- _ _ _ _ _ _ _ i, A -- gnus De -- _ _ _ i,
		qui tol -- lis pec -- ca -- ta mun -- di,
		qui tol -- lis pec -- ca -- ta mun -- di,
		qui tol -- lis pec -- ca -- ta mun -- di,
		do -- na e -- is re -- qui -- em,
		do -- na e -- is re -- _ _ _ qui -- em,
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8" 
		R1 R R R R R R r2 c1 b2 
		c d4. c8 b4 c4. b8 a g a1 g a2 bes a2 a fis4 g e2 fis a 
		d, a' e a4 d, e2 a cis d e4 a, a gis a a r2 r4 c2 bes4 a g f2 
		r4 c'4. bes8 a2 g fis4 g2 e4. f8 g2 d r4 g2 e4 f e4. f8 g4 a8 d, d'2 a4 b1\fermata
	}
	\addlyrics {
		A -- gnus __ _ De -- _ _ _ _ _ _ _ i,
		qui tol -- lis pec -- ca -- ta mun -- di,
		qui tol -- lis pec -- ca -- ta mun -- di,
		qui tol -- lis pec -- ca -- ta mun -- di,
		do -- na e -- _ is re -- _ _ _ qui -- em,
		do -- na e -- is, do -- na __ _ e -- _ is re -- _ _ qui -- em,		
	}
}

baritone = \new Voice {
		\relative c' {
		\clef "treble_8" 
		R1 R R R r2 c1 b2 c d4. c8 b4 c4. b8 a g a2 g 
		r1 r r4 a4 d, d'4. c8 b a b4 g4. fis8 fis4 g2. f4 e2 d4 d a'2 a4 d4. cis8 cis4 
		d2 c! b a4 a e'2 c4 e2 a,2 d c4 b e c d b2 a1 r4 c2 bes4 
		a g a4. g8 f4 g a2 b r4 c2 b4 a2 g2 r4 c c c2 b4 a2. a4 g1\fermata
	}
	\addlyrics {
		A -- gnus __ _ De -- _ _ _ _ _ _ _ i, A -- gnus De -- _ _ _ i,
		qui __ _ _ tol -- lis pec -- ca -- ta mun -- di,
		qui __ _ _ tol -- lis pec -- ca -- ta mun -- di,
		qui tol -- lis pec -- ca -- ta mun -- _ _ di,
		do -- na e -- is re -- _ qui -- _ em, __ _
		do -- na e -- is, do -- na e -- is re -- qui -- em,
	}
}

bass = \new Voice {
	\relative c' {
		\clef "bass"
		g1 fis2 g a4. g8 fis4 g4. fis8 e d e2 d c2. b8 a g4 g' f4. e8 d2 e c r r4 g' 
		f e d2 e4 c e2 d1 g, d'2 g, d'2 a d4 g, a2 d r2
		r1 r1 r1 a'2 d, a' e a4 d, e2 a, f'2. e4 d2 
		c f2. e4 d2 g, r2 r4 g'2 fis4 g2 c, a4. b8 c4 g d'2 d g,1\fermata
	}
	\addlyrics {
		A -- gnus __ _ De -- _ _ _ _ _ _ _ i, A -- _ _ gnus __ _ De -- _ _ _ i,
		A -- _ _ _ gnus __ _ De -- _ i
		qui tol -- lis pec -- ca -- ta mun -- di,
		qui tol -- lis pec -- ca -- ta mun -- di,
		do -- na e -- is re -- qui -- em, __ _
		do -- na e -- is re -- _ _ _ _ qui -- em,
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
	\header {
		piece = \markup \larger \sans { Agnus Dei }
	}
	\layout {
	}
}
