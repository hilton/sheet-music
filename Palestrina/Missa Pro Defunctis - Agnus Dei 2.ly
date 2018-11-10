soprano = \new Voice {
	\relative c'' {
		R1 g fis2 g g1 a4 a b c2 b8 a b2 c1. r2 
		r1 c2 c a4 g a b c b a g2 f4 g1 r2 r1 r r 
		g a2 b g a2. a4 \bar "" g1 c2. c4 b8 c d b c2 d4 g,2 fis8 e fis4 fis g1\fermata \showBarLine \bar "||"
	}
	\addlyrics {
		A -- gnus __ _ De -- i,
		A -- gnus De -- _ _ _ i,
		qui tol -- lis pec -- ca -- ta mun -- _ _ _ _ di,
		do -- na e -- is re -- qui -- em,
		do -- na e -- _ _ _ _ is re -- _ _ _ qui -- em,
	}
}

alto = \new Voice {
	\relative c' {
		r2 d1 cis2 d d e r4 d d4. c8 b g g'4 g1 e4 c c2 a4 c d e 
		f e8 d c4 f2 e4 f2 e2 e e2. d4 e c d2 e e fis g e c4. b8 a4 a b2 
		e1 fis2 g2. e4 f2. e4 d2 e r4 e2 fis4 g2. e4 d1 d2 d1\fermata
	}
	\addlyrics {
		A -- gnus __ _ De -- i,
		A -- gnus __ _ _ _ _ De -- i,
		qui tol -- lis pec -- ca -- ta mun -- _ _ _ _ _ di,
		qui tol -- lis pec -- ca -- ta mun -- di,
		do -- na e -- is re -- _ _ qui -- em,
		do -- na e -- is re -- _ qui -- em,
		do -- na e -- is re -- qui -- em,
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		R1 R R g fis2 g g1 a2 r4 a a2 a2 ~ 
		a4 g4 a f g2 a r1 r4 g a b c a g2 r4 g2 a b g2 a4. g8 g4 g4 fis4 g2 
		c1 a2 g c f, f g g1 a2 b g1 a2 a g1\fermata
	}
	\addlyrics {
		A -- gnus __ _ De -- i,
		qui tol -- lis pec -- ca -- ta mun -- di, pec -- ca -- ta mun -- _ di,
		do -- na e -- is re -- _ _ qui -- _ em,
		do -- na e -- is re -- qui -- em,
		do -- na e -- is re -- qui -- em,
	}
}

baritone = \new Voice {
		\relative c' {
		\clef "treble_8"
		d1 b2 g a b c2. b4 a d2 e4 d1 c4 a a2 c4 f,8 g a b c4 
		b b a2 c r4 c c2 a4 g a b c d4. c8 c2 b4 c1 r2 b c e4 e d4. d8 d2 
		r c1 d2 e4 c2 d4. c8 c2 b4 c2 r c d e4 c4. b8 b4 a2 d b1\fermata
	}
	\addlyrics {
		A -- gnus __ _ De -- _ _ _ i,
		A -- gnus De -- i,
		qui tol -- lis pec -- _ _ _ _ ca -- ta mun -- di,
		qui tol -- lis pec -- ca -- ta mun -- _ _ _ _ di,
		do -- na e -- is re -- qui -- em,
		do -- na e -- is re -- _ _ qui -- em,
		do -- na e -- _ _ is re -- qui -- em,
	}
}

bass = \new Voice {
	\relative c' {
		\clef "bass"
		r2 g1 e2 d g c, g d' r r1 r2 f f d4 c 
		d e f4. e16 d c2 f r1 r r c d2 e c1 d4. d8 g,2 
		r1 r r r2 r c1 a2 g c g d'2. d4 g,1\fermata
	}
	\addlyrics {
		A -- gnus De -- _ _ _ i,
		qui tol -- lis pec -- ca -- ta mun -- _ _ _ di,
		do -- na e -- is re -- qui -- em,
		do -- na __ _ e -- is re -- qui -- em,
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
		ragged-right = ##f
		ragged-last = ##f
		\context {
			\Score
			proportionalNotationDuration = #(ly:make-moment 1 4)
		}
	}
}
