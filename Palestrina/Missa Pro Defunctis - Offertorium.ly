
soprano = \new Voice {
	\relative c'' {
		R1 R1 g2 fis g2. g4 g2 g
		#(define afterGraceFraction (cons 17 32)) \afterGrace a1 \parenthesize a2 
		bes4. a8 g2 f1. bes2 ~
		bes4 a8 g a4 bes4. a8 \afterGrace g2 \parenthesize g4 fis4 g2 r1 r1 r4 d'2 c4 a c2 
		bes4 a2 f4. f8 g4 g a4. a8 g2 ~
		g2 r4 f2 d4 f4. g8 a4 bes2 a4 bes2 r1 r c2 bes2. a4 g2 fis g bes 
		
		bes4 bes, d2 c es4 d2 cis8 b cis4 e4.  e8 f4 g2 a1 r2 r4 g bes a bes d4. c8 bes a g4 a
		g4. a8 bes4 bes4 ~
		bes8 a8 g2 fis4 g1 r r r r r2 a g4 g f e4. d8 d2 cis4
		
		d2 r r1 a'2 bes2. bes4 a bes2 a4 g fis
		g1 r r2 r4 g2 g4 g fis g2 fis
		r1 r2 r4 d e f g8 a bes2 a4 bes bes bes bes c g
		
		a2 g4 bes a8 g g2 fis4 g1 r r2 f
		bes4. bes8 g4 g c4. c8 a2 d4. c8 bes2 a4 g2 fis4 g1\fermata \showBarLine \bar "||"
	}
	\addlyrics {
		Do -- _ _ mi -- ne Je -- \lyricLeft "-               su" Chri -- _ _ ste, 
		Rex __ _ _ _ glo -- _ \lyricLeft "        ri" -- _ æ,
		li -- be -- ra a --
		ni -- mas om -- ni -- um fi -- de -- li -- um de -- func -- to -- _ _ _ _ rum
		de -- poe -- nis in -- fer -- ni, et de pro -- fun -- do la -- _ _ _ cu: li --
		be -- ra e -- as de o -- re le -- o -- _ _ _ _ nis, le -- _ _ o -- _ _ _ nis,
		ne ca -- dant in ob -- _ scu -- _ rum:
		sed sig -- ni -- fer san -- ctus Mi -- cha -- el
		re -- præ -- sen -- tet e -- as
		in lu -- cem san -- _ _ _ ctam.
		Quam o -- lim A -- bra -- hæ pro -- _ mi -- _ si -- _ sti,
		et se -- mi -- ni, et se -- mi -- ni e -- _ _ _ _ _ ius.
	}
}

alto = \new Voice {
	\relative c' {
		R1 r2 d c d2. d4 d2 e1
		e2 f4. e8 d4. c8 bes2 a4 d2 c8 bes c4 d4. c8 bes a g4 a d bes
		d2 d d1 r r r
		r4 g2 f4 d f2 e4 d2 bes4. bes8 c4 c d d d f2 d4
		f1 f2 g f2. e4 d2 c4. d8 es4 d8 c d bes c4
		d es d1 r4 bes d f f,2 f4 c'2 bes4 a2 r4 cis4. 
		cis8 cis4 d2 e f4 a,4. a8 bes4 c2 d1. r4 d
		d2 g, d' d d r4 es2 d4 c2 bes4 c d2
		c4 d2 c8 bes a4 a g g'2 f e8 d e4 d c4. bes8 a4 bes g2
		
		a4 a a g d'2. c4 c2 bes4 g g'4. g8 f4 d 2 es4 d d
		d2 r1 r es2. d4 c a g8 a bes c d4 a
		r f' d d f2 f  r4 c d4. e8 f2 d4 f g f e!8 f g2 
		fis4 g f es c d2 g, r4 g'2 f4 es1 d2
		d4 g2 e4 e2 f4. e8 d\breve d1\fermata
	}
	\addlyrics {
		Do -- _ _ mi -- ne Je -- su Chri -- _ _ _ _ ste, 
		Rex __ _ _ _ glo -- _ _ _ ri -- æ, Rex __ _ glo -- ri -- æ,
		li -- be -- ra a -- ni -- mas om -- ni -- um fi -- de -- li -- um de -- func -- to -- rum
		de -- poe -- nis in -- fer -- _ _ _ _ _ _ _ _ _ ni, et de pro -- fun -- do la -- _ cu: li --
		be -- ra e -- _ as, li -- be -- ra e -- as de o -- re le -- o -- nis, 
		ne ab -- sor -- be -- at e -- as tar -- _ _ _ ta -- rus,
		ne ca -- _ _ dant _ in _ ob -- _ scu -- rum
		ne ca -- dant in ob -- scu -- rum:
		sed sig -- ni -- fer san -- ctus Mi -- cha -- el
		re -- præ -- sen -- tet e -- _ _ _ _ as
		in lu -- cem san -- ctam, in lu -- cem san -- ctam.
		Quam o -- lim A -- bra -- hæ __ _ pro -- _ mi -- _ si -- sti, pro -- mi -- si -- sti,
		et se -- mi -- ni e -- _ _ ius.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8" 
		d2. c4 bes a g2 r a b2. b4 c2. g4 c4. bes8 a2 g1 r4 bes2 a8 g a4 bes4. c8 d4 ~
		d4 d4 a d4. c8 bes4 a4. a8 g2 r4 d'2 c4 a c bes a4. g16 f g4 a4. a8 a2
		d2 d2. d4 c4. bes8 a2 r4 g c, c f4. e8 d4 d'4. c8 bes4
		a8 bes16 c d4 c2 d g, a d,4 e f g c,2 r4 g'2 a4
		b c a2 g4 g d es d2 bes4 bes'2 a4 g4. f8 e1
		
		r2 r4 d'4. cis8 cis4 d2 d r4 g, g fis g bes4. a8 bes c d4 d,
		r g2 bes4 ~
		bes8 c8 d4. c8 a4 b2 r4 c2 d4 es2 d4 g, bes4. a16 g
		a4 bes a4. bes8 c4 d2 cis4 d4. c16 bes a2 r1 r
		
		r4 d c c bes a4. g8 g2 fis4 g g g4. g8 d4 g2 c4 bes a
		g d' es d d es2 d4 c b c4. bes16 a g2 r2 
		r2 r4 d' c a bes8 c d bes c2 d r1 r2 r4 d es d c es
		
		d2 bes4 bes c8 bes a g a2 c4 d es8 d c bes a g a4 g4. a16 bes c2 f,4 d
		g4. g8 e2 a4. g8 f e d e f2 g4 d'4. c8 bes4 a2 g1\fermata
	}
	\addlyrics {
		Do -- _ _ mi -- ne Je -- _ su Chri -- _ _ _ _ ste, 
		Rex __ _ _ _ glo -- ri -- æ, Rex __ _ glo -- ri -- æ, glo -- ri -- æ,
		li -- be -- ra a -- ni -- mas __ _ _ _ om -- ni -- um
		fi -- de -- li -- um __ _ _ fi -- de -- li -- um __ _ _ de -- _ _ func -- _ _ _ to -- rum
		de -- poe -- nis in -- fer -- _ ni in -- _ fer -- _ _ ni, et de pro -- fun -- do la -- _ _ _ cu:
		li -- be -- ra e -- as de o -- re le -- o -- _ _ _ _ nis, le -- o -- _ _ _ _ nis, 
		ne ab -- sor -- be -- at e -- _ _ _ as tar -- _ _ ta -- _ _ _ _ rus,
		ne ca -- dant in ob -- _ scu -- _ rum:
		sed sig -- ni -- fer san -- ctus Mi -- cha -- el, sed sig -- ni -- fer san -- ctus Mi -- cha -- el __ _ _ _
		in lu -- cem san -- _ _ _ _ ctam.
		Quam o -- lim A -- bra -- hæ pro -- mi -- si -- _ _ _ _ sti, pro -- _ _ _ _ _ _ mi -- si -- _ _ _ sti,
		et se -- mi -- ni e -- _ _ _ _ _ _ ius, se -- mi -- ni e -- ius.
	}
}

baritone = \new Voice {
		\relative c' {
		\clef "treble_8" 
		r2 d2. c4 bes a g2 r4 d2 g g4 g4. f8 e4 c'4. 
		bes8 a g f4 f g8 a bes c d2 d r1 g,2 ~ 
		g4 fis8 e fis4 g8 a
		bes c d2 a4 bes bes2 a4 f a2 g4 f2 d4. d8 e2 fis
		g4 g a1 r2 f g2 ~ g2 a2 bes4. c8 d2
		c4 bes c f, r bes bes c d d,8 e f g a2 g fis4 g2 r
		r r4 a bes2 g f d4. e8 f2 r1 r4 a4. 
		
		a8 a4 bes2 a r4 f4. f8 f4 g g r1 r4 g bes a
		bes d4. c8 bes a g a bes g a2 g r4 g2 g4 g2 g4 e f1 
		f1 g4. g8 a4 d2 c bes4 a4. g8 f4 g e2
		
		d2 r4 g g f d e c2 d4 d' d4. d8 d2 r r4 a
		bes2. bes4 a bes2 a4 g f g c2 d4 es d bes8 a g4 a2
		r4 c bes g f2 bes4 d c a bes8 c d bes c2 bes r1
		
		r1 r2 r4 d es d c es d d c bes2 a4 bes2
		r4 g2 c4. c8 a2 d4. c8 bes4. a8 g4 fis g a2 b1\fermata
	}
	\addlyrics {
		Do -- _ _ mi -- ne Do -- _ mi -- ne __ _ _ Je -- _ _ _ _ su Chri -- _ _ _ _ ste,
		Rex __ _ _ _ glo -- _ _ _ _ ri -- æ,
		li -- be -- ra a -- ni -- mas om -- ni -- um fi --
		de -- li -- um de -- func -- to -- _ _ _ _ _ rum __ _
		de -- poe -- nis in -- fer -- _ _ _ _ _ _ ni, et de pro -- fun -- _ _ do li --
		be -- ra e -- as, li -- be -- ra e -- as de o -- re le -- o -- _ _ _ _ _ _ _ _ nis, 
		ne ab -- sor -- be -- at e -- as tar -- ta -- rus,
		ne ca -- dant in _ ob -- _ scu -- rum
		ne ca -- dant in ob -- scu -- rum:
		sed sig -- ni -- fer sed sig -- ni -- fer san -- ctus Mi -- cha -- el
		re -- præ -- sen -- tet e -- _ _ as
		in lu -- cem san -- ctam, in lu -- cem san -- _ _ _ _ ctam.
		Quam o -- lim A -- bra -- hæ pro -- mi -- si -- _ sti,
		et se -- mi -- ni e -- _ _ _ _ _ _ _ ius.
	}
}

bass = \new Voice {
	\relative c' {
		\clef "bass"
		R1 g2. f4 es2 d g, g c1
		a2 d g,4 g4. a8 bes c d4. e8 f2 R1 r4 d2 g,4. 
		a8 bes c d4 d g, g'2 f4 d f2 e4 d2 bes4. bes8 a2 a
		g4 g d'1 r2 d es2 ~ es2 d4. c8 bes1
		f' bes,2 es d2. c4 bes2 a g r
		r d' g, g bes1 f2 g a1. 
		
		r1 r4 d4. d8 d4 es2 d r g g4 fis
		g bes4. a8 g fis g2 d g, r4 c2 b4 c2 g4 c bes2
		f4 bes8 c d e f2 e8 d e4 e d2 r1 r r4 g4 ~ 
		
		g4 f2 e4 d4. c8 bes4 c a2 g1 r r4 d'
		g2. g4 fis g2 f!4 es d c c2 b4 c d es2 d4 d
		e f g8 a bes2 a4 bes2 a g4 g f2 bes, r1
		
		d2 es4 d c es d2 c4 b c2 d es4. d8 c2 bes
		g c4. c8 a2 d4. c8 bes4. a8 g a bes c d1 g,1\fermata
	}
	\addlyrics {
		Do -- mi -- ne Je -- _ su Chri -- ste, Je -- su Chri -- _ _ _ _ _ ste,
		Rex __ glo -- _ _ _ _ ri -- æ,
		li -- be -- ra a -- ni -- mas om -- ni -- um fi
		de -- li -- um de -- func -- to -- _ _ _ rum
		de -- poe -- nis in -- fer -- ni, et de pro -- fun -- do la -- cu:
		li -- be -- ra e -- as de o -- re le -- o -- _ _ _ _ _ nis, 
		ne ab -- sor -- be -- at e -- as tar -- _ _ _ _ _ _ _ ta -- rus,
		ne ca -- dant in __ _ _ ob -- scu -- rum:
		sed sig -- ni -- fer san -- ctus Mi -- cha -- el
		re -- præ -- sen -- tet e -- as
		in lu -- cem san -- _ _ _ ctam, in lu -- cem san -- ctam.
		Quam o -- lim A -- bra -- hæ pro -- mi -- si -- sti, pro -- mi -- si -- sti,
		et se -- mi -- ni e -- _ _ _ _ _ _ _ _ ius.
	}
}

\score {
	<<
		\new ChoirStaff
	  	<< 
			\new Staff << \global \keyF \soprano >> 
			\new Staff << \global \keyF \alto >> 
			\new Staff << \global \keyF \tenor >>
			\new Staff << \global \keyF \baritone >>
			\new Staff << \global \keyF \bass >>
		>>
	>>
	\header {
		piece = \markup { \larger \bold "Offertorium" }
	}
	\layout {
		ragged-last = ##f
		\context {
			\Score
			proportionalNotationDuration = #(ly:make-moment 1 4)
		}
	}
}


%{	██   ██  ██████  ███████ ████████  ██   █████  ███████
		██   ██ ██    ██ ██         ██     ██  ██   ██ ██
		███████ ██    ██ ███████    ██     ██  ███████ ███████
		██   ██ ██    ██      ██    ██     ██  ██   ██      ██
		██   ██  ██████  ███████    ██     ██  ██   ██ ███████  %}

soprano = \new Voice {
	\relative c' {
		f2 g bes2. a4 a2 f g bes a r f2 g4 bes2 a4 g2 f r4 a2 g4 a bes4 ~
		bes8 a8 \afterGrace g2 \parenthesize g4 fis4
		g4 g8 a bes c d c bes4 a8 g a4 a2 g4 a2 fis g4 a bes4. a8 g4 fis
		g2 g r4 g2 g4 a2 a4 g4 ~ 
		g4 fis8 e fis4 g a4. a8 a4 c2 bes8 a bes4 a2 \afterGrace g \parenthesize g4 fis4 g2 r4 g f d f4. g8 a2 g
		g1 r4 bes a f a2 c4. bes8 a4 g f g4. f8 e d e2
		d4 bes' a f a2 c4. bes8 a4 g a bes4. a8 g2 fis4 g1\fermata
		\once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
		\mark "Attacca" \showBarLine \bar "||"
	}
	\addlyrics {
		Ho -- _ _ sti -- as et pre -- _ ces ti -- bi, Do -- _ mi -- ne,
		lau -- dis of -- fe -- _ \lyricLeft "        ri" -- _ mus;
		tu __ _ _ _ _ _ _ _ _ _ su -- sci -- pe pro a -- ni -- ma -- _ _ bus il -- lis,
		qua -- rum ho -- di -- e __ _ _ _ me -- mo -- ri -- am fa -- _ _ _ _ \lyricLeft "         ci" -- _ mus:
		fac e -- _ as, __  _ Do -- mi -- ne, de mor -- te trans -- i -- _ _ re ad vi -- _ _ _ _ tam,
		de mor -- te trans -- i -- _ _ re ad vi -- _ _ _ tam.
	}
}

alto = \new Voice {
	\relative c' {
		d2 bes4. c8 d4 e f2. c4 d8 e f2 e8 d e2 f4 f es d2 c4 bes8 c d bes c2 bes4. c8 d e f4 g f2 es4 d4. c8 bes4 c d1 
		r4 g,8 a bes c d e f2 e4 d e2 r4 d bes a g8 a bes c d4 c
		d e8 d16 c d2 e4 e2 d4 f e d2 ~ 
		d2 d2 f4. f8 f1 f4. e8 d2. d4 bes es d bes d4. c16 bes a8 f f'2 e4 d2
		r4 es d bes4 ~ bes8 c8 d e f2 r4 f f2. e4 c e4. d8 d2 cis4
		d2 r4 d c a f4. g8 a bes c4 c bes d2 d d1\fermata
	}
	\addlyrics {
		Ho -- _ _ _ sti -- as et pre -- _ _ _ _ _ ces ti -- bi, Do -- _ mi -- _ _ _ ne,
		lau -- _ _ _ _ dis, lau -- dis of -- _ fe -- ri -- mus;
		tu __ _ _ _ _ _ su -- sci -- _ pe pro a -- ni -- ma -- _ _ _ _ bus il -- _ _ _ _ lis,
		qua -- rum ho -- di -- e me -- mo -- ri -- am fa -- _ _ ci -- mus:
		fac e -- as, Do -- _ _ _ _ _  mi -- ne, 
		de __ _ mor -- _ _ _ te trans -- i -- re ad vi -- _ _ _ tam,
		de mor -- te trans -- i -- _ _ _ re __ _ ad vi -- tam.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8"
		r2 d bes4. c8 d4 c c a2 d c4 bes2 c4 f, g bes2 
		a4 g2 f r4 d'2 c4 d4. c8 a bes c2 bes8 a g2 a4 a
		g2 r r4 d4. e8 f g a4 d2 cis4 d2 r4 d d d bes a
		g1 c,4 c'2 bes4 a4. g8 f4 g d2. g4 f4. f8 f4. g8
		a4 bes2 f4 g2 d r1 r4 g f d f2 g c,2 g'2 ~ 
		g2 r4 bes a f a2 c4. bes8 a4 g bes2 a
		d,4 g f d f a4. g8 f2 e4 f g4. fis8 g4 d2 g1\fermata
	}
	\addlyrics {
		Ho -- _ _ _ sti -- as et pre -- _ _ ces ti -- bi, Do -- _ mi -- ne,
		lau -- dis, lau -- _ _ _ _ dis _ of -- fe -- ri -- mus;
		tu __ _ _ _ _ su -- sci -- pe pro a -- ni -- ma -- bus il -- lis,
		qua -- rum ho -- _ _ di -- e me -- mo -- ri -- am __ _ _ fa -- ci -- mus: __ _
		fac e -- as, Do -- _ mi -- ne, de mor -- te trans -- i -- _ _ re ad vi -- tam,
		de mor -- te trans -- i -- _ _ re ad vi -- _ _ _ tam.
	}
}

baritone = \new Voice {
	\relative c' {
		\clef "treble_8"
		bes2 g2. g4 f1 d2 g1 f2 r
		r1 r4 f g bes2 a4 g d2 es4 f g4 ~ 
		g4 es4 d2 r4 g4. a8 bes c d1 c4 bes a2 d, g4 fis g2. a4
		b c2 b4 c2 r2 r4 c2 bes4 a4. a8 a4 bes c4. c8 c4 a8 bes
		c a d2 c4. \autoBeamOff bes8 \autoBeamOn bes a16 g a4 a g c bes g bes2 c4 d4. c8 
			\afterGrace c2 \parenthesize c4 b4
		c2 r4 es d bes d2 c f, r1 r
		r2 r4 bes a f a2 c4. bes8 a4 g bes2 a b1\fermata
	}
	\addlyrics {
		Ho -- _ sti -- as et pre -- ces ti -- bi, Do -- mi -- ne,
		lau -- dis of -- fe -- ri -- mus;
		tu __ _ _ _ su -- _ sci -- pe pro a -- ni -- ma -- bus il -- _ _ lis,
		qua -- rum ho -- di -- e me -- mo -- ri -- am fa -- _ _ _ _ _ _ _ _ _ _ ci -- mus:
		fac e -- as, Do -- _ _ _ \lyricLeft "       mi" -- _ ne, de mor -- te trans -- i -- re,
		de mor -- te trans -- i -- _ _ re ad vi -- tam.
	}
}


\score {
	<<
		\new ChoirStaff
	  	<< 
			\new Staff << \global \keyF \soprano >> 
			\new Staff << \global \keyF \alto >> 
			\new Staff << \global \keyF \tenor >>
			\new Staff << \global \keyF \baritone >>
		>>
	>>
	\layout {
		ragged-last = ##f
		\context {
			\Score
			proportionalNotationDuration = #(ly:make-moment 1 4)
		}
	}
}


%{	 ██████  ██    ██   █████   ███    ███      ██████   ██      ██  ███    ███
		██    ██ ██    ██  ██   ██  ████  ████     ██    ██  ██      ██  ████  ████
		██    ██ ██    ██  ███████  ██ ████ ██     ██    ██  ██      ██  ██ ████ ██
		██ ▄▄ ██ ██    ██  ██   ██  ██  ██  ██     ██    ██  ██      ██  ██  ██  ██
		 ██████   ██████   ██   ██  ██      ██      ██████   ███████ ██  ██      ██
		    ▀▀%}

soprano = \new Voice {
	\relative c'' {
		g2 g g1 r r4 a bes a g a c8 bes a g
		\afterGrace a2 \parenthesize a4 g4 bes a8 g g2 fis4 g1 r r2 f
		bes4. bes8 g4 g c4. c8 a2 d4. c8 bes2 a4 g2 fis4 g1\fermata \showBarLine \bar "||"
	}
	\addlyrics {
		Quam o -- lim, Quam o -- _ lim __ _ A -- _ _ _ \lyricLeft "-     bra" -- hæ pro -- mi _ si -- _ sti,
		et se -- mi -- ni, et se -- mi -- ni e -- _ _ _ _ _ ius.
	}
}

alto = \new Voice {
	\relative c' {
		d2 es4 d c es d2 d4. d8 g2 fis r4 f g f e8 f g2 
		fis4 g f es c d2 g, r4 g'2 f4 es1 d2
		d4 g2 e4 e2 f4. e8 d\breve d1\fermata
	}
	\addlyrics {
		Quam o -- lim A -- bra -- hæ pro -- mi -- si -- sti,
		Quam o -- lim A -- _ _ bra -- hæ pro -- mi -- _ si -- sti, pro -- mi -- si -- sti,
		et se -- mi -- ni e -- _ _ ius.
	}
}

tenor = \new Voice {
	\relative c' {
		\clef "treble_8" 
		b2 c4 d es c bes bes2 a4 g2 a r4 d es d c es
		d2 bes4 bes c8 bes a g a2 c4 d es8 d c bes a g a4 g4. a16 bes c2 f,4 d
		g4. g8 e2 a4. g8 f e d e f2 g4 d'4. c8 bes4 a2 g1\fermata
	}
	\addlyrics {
		Quam o -- lim A -- bra -- hæ pro -- mi -- si -- sti,
		Quam o -- lim A -- bra -- hæ pro --mi -- si -- _ _ _ _ sti, pro -- _ _ _ _ _ _ mi -- si -- _ _ _ sti,
		et se -- mi -- ni e -- _ _ _ _ _ _ ius, se -- mi -- ni e -- ius.
	}
}

baritone = \new Voice {
		\relative c' {
		\clef "treble_8" 
		g2 g4 g g4. g8 g4 g bes d4. c16 bes c4 d2 r r1
		r1 r2 r4 d es d c es d d c bes2 a4 bes2
		r4 g2 c4. c8 a2 d4. c8 bes4. a8 g4 fis g a2 b1\fermata
	}
	\addlyrics {
		Quam o -- lim A -- bra -- hæ pro -- mi -- si -- _ _ _ sti,
		Quam o -- lim A -- bra -- hæ pro -- mi -- si -- _ sti,
		et se -- mi -- ni e -- _ _ _ _ _ _ _ ius.
	}
}

bass = \new Voice {
	\relative c' {
		\clef "bass"
		g,2 c4 b c c g g'2 f4 es2 d1 r
		d2 es4 d c es d2 c4 b c2 d es4. d8 c2 bes
		g c4. c8 a2 d4. c8 bes4. a8 g a bes c d1 g,1\fermata
	}
	\addlyrics {
		Quam o -- lim A -- bra -- hæ pro -- mi -- si -- sti, pro -- mi -- si -- sti,
		Quam o -- lim A -- bra -- hæ pro -- mi -- si -- sti,
		et se -- mi -- ni e -- _ _ _ _ _ _ _ _ ius.
	}
}

\score {
	<<
		\new ChoirStaff
	  	<< 
			\new Staff << \global \keyF \soprano >> 
			\new Staff << \global \keyF \alto >> 
			\new Staff << \global \keyF \tenor >>
			\new Staff << \global \keyF \baritone >>
			\new Staff << \global \keyF \bass >>
		>>
	>>
	\layout {
		ragged-last = ##f
		\context {
			\Score
			proportionalNotationDuration = #(ly:make-moment 1 4)
		}
	}
}
