% Copyright ©2013 Peter Hilton

\version "2.16.2"
revision = "4"

#(set-global-staff-size 15.5)

\paper {
#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15.5 20)))
	two-sided = ##t
	inner-margin = 15\mm
	outer-margin = 15\mm
	annotate-spacing = ##f
	top-markup-spacing = #'( (basic-distance . 4) )
	markup-system-spacing = #'( (padding . 5) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #6 \override #'(font-name . "Source Sans Pro Light") {
		2. Da pacem Domine
	}
	subtitle = \markup \medium \sans {
		Sacræ cantiones per sei voci - liber secundus
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
			\line { Sextus & bassus copyright ©2005 Joop Voorn }
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
	}
}


global= { 
	\key d \major
	\tempo 2 = 45
	\time 2/2
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t }



cantus = \new Voice {
	\transpose c d \relative c'' {	
		R1 r2 a1 f2 a c2. d4 c2
		bes a2. \ficta b!4 c2. c4 a2 r4 a b c2 b4 a2~
		
		a4 g a1 r2 r e4 fis g1 c4 a2 g4~
		g8 fis16 e \ficta fis!4 g8 \ficta fis! g a b c d2 cis4 d4 d, a'8 a c4. b8 a g f4 a2 a4 g2
		f r R1 r4 d2 f4 g1 ~ g2 r4 g~
		
		g b d2 R1 d2 d b a4 c2 b8 a g fis g e \break
		a4. b8 c4 a r c c a g1 a2 a R1
		e2 f e4 a2 g4 f8 g a b c1 ~ c2 a2 b
		
		g a1 r2 R1 b2 c4 a \break
		f e2 d cis4 d f8 g a b c a e'4 a, d c8 b a g a b \break
		c4 a b c d2 g,4 g b e, fis g a\breve a1 \showBarLine \bar "|."
	}
	\addlyrics {
		Da pa -- cem Do -- mi -- ne,
		da pa -- cem Do -- mi -- ne in di -- e -- bus no --
		
		_ stris, in di -- e -- bus no -- _
		_ _ _ _ _ _ _ _ _ _ _ stris qui -- a non est, __ _ _ _ _ qui -- a non
		est a -- li -- us, __ a --
		
		li -- us, qui pu -- gnet pro no -- _ _ _ _ _ _
		_ _ _ bis, qui pu -- gnet pro no -- bis
		ni -- si tu De -- us no -- _ _ _ _ ster, ni -- 
		
		si tu, ni -- si tu
		De -- us no -- _ ster, De -- _ _ _ _ _ _ us no -- _ _ _ _ _ _
		_ ster, De -- us no -- ster, ni -- si tu De -- us no -- ster.
	}
}

sextus = \new Voice {
	\transpose c d \relative c' {
		R1 r2 d c2 d4 f4. e8 f g a2. f4 g f
		d1 d2 e4 f2 e4 d d2 fis4 g1 f!2
		
		d2. c8 d e2 e r r4 c4 d2 e2. a,4 fis g
		d' a e' e e2 e d c8 b a4 g a bes a8 \ficta b c a d2 cis4
		d2 f4 f e a d, e f8 g a2 d,4 d c2 b4 c d e2
		
		r2 a4 a2 g4 fis g2 fis4 g1 r4 g, c4. d8 e2~
		e4 c f f2 e d4 d c b c4. b8 a g a4. g16 a bes8 a a2 g4
		a e'2 d4 e2 d2. c4 g'1 f r2
		
		R1 e2 fis4 g a g8 \ficta fis e2 e e
		d4 c8 b a g16 a bes2 a a'4 f f e fis g2 c,4 f
		g e2 c b4 e2 e d4 e2 d4 f e2 d cis4 d1
	}
	\addlyrics {
		Da pa -- cem Do -- _ _ _ _ mi -- ne, da
		pa -- cem Do -- _ mi -- ne in di -- e -- bus
		
		no -- _ _ _ stris, in di -- e -- bus, in di -- 
		e -- bus no -- stris qui -- a non est __ _ _ a -- li -- us, a -- _ _ _ _ li -- 
		us, qui -- a non est a -- li -- us, __ _ _ qui -- a non est a -- li -- us,
		
		qui pu -- gnet pro no -- _ bis, pro no -- _ _ 
		bis, qui pu -- gnet, qui pu -- gnet pro no -- _ _ _ _ _ _ _ _ _ _
		bis ni -- si tu De -- us no -- ster,
		
		tu De -- us no -- _ _ _ ster, De -- 
		us no -- _ _ _ _ _ ster, ni -- si tu De -- us no -- ster, ni -- 
		si tu De -- us no -- ster, ni -- si tu De -- us no -- _ ster.
	}
}

altus = {
	\new Voice = "altus" {
		\transpose c d \relative c' {
			\clef "treble_8"
			r2 a1 f2 a2. c2 d4 c d8 e f4 bes,2 a4
			bes a8 g a4 a f2 c'1 r4 f d2. e2 e4 c d
			
			f4 e8 d f4. a,8 a2 g4 a c a e d8 c g'2 g4 g a c2 b4
			a2 g1 r2 f' f e d r g,4 a
			bes a8 g f e f g a2 r r4 a2 a4 g1 ~ g2 e4 e'~
			
			e4 e d2. g,4 b a8 g a4. a8 b2 d4 d2 c4 a2 c4. b8
			c d e2 d4 c c a d, e2 e a4 a f2 d4 f2 e8 d
			e f16 g a4 a a gis a bes2 a g?4 c, c' bes2 a8 g a \ficta b! c a d c16 d e4~
			
			e8 d c b a2 a2. bes4 a \ficta b?2 a gis4 a8 b c b
			a g a4 d,2 R1 R1 d'4 e r a,
			e' c b e r2 c,8 d e fis g e a2 g4 \ficta f!2 c4 e f a4. g8 e4 fis1
		}
	}
	\addlyrics {
		Da pa -- cem Do -- mi -- ne, __ _ _ _ Do -- mi --
		ne, __ _ _ _ da pa -- cem, da pa -- cem, da pa -- cem
		
		Do -- _ _ _ mi -- ne in di -- e -- bus no -- _ _ _ stris, in di -- e -- bus
		no -- stris qui -- a non est a --  li -- 
		us, __ _ _ _ _ _ _ _ qui -- a non __ est, qui -- 

		a non __ est a -- _ _ _ li -- us, qui pu -- gnet pro no -- _
		_ _ _ bis, qui pu -- gnet pro no -- bis, qui pu -- gnet pro no -- _ _
		_ _ _ _ bis ni -- si tu De -- us no -- ster, De -- us no -- _ _ _ _ _ _ _ _ _
		
		_ _ _ _ ster, ni -- si tu De -- us no -- _ _ _
		_ _ _ ster, ni -- si tu
		De -- us no -- ster, De -- _ _ _ _ _ _ us no -- ster, De -- us no -- _ _ ster.
	}
}

quintus = {
	\new Voice = "quintus" {
		\transpose c d \relative c' {
			\clef "treble_8"
			R1 r r r r
			r r r2 a1 g a2
			
			R1 r2 r4 c2 d4 c2 b1 c2 d~
			d4 c b1 a r2 R1 R
			r2 c c b a r b4 c d2 c c
			
			b2 a b4 c d1 r2 R1 R
			R R e2 e d c d1
			c2 r R1 R r2 c1 b2~

			b2 c1 d c2 b a~
			a r R1 c b2 c~
			c r d c b1 a\breve ~ a1
		}
	}
	\addlyrics {
		Da pa -- cem
		
		Do -- mi -- ne in di -- e -- 
		bus no -- stris
		qui -- a non est a -- li -- us, qui -- a
		
		non est a -- li -- us
		qui pu -- gnet pro no -- 
		bis ni -- si
		
		tu De -- us no -- ster, __
		ni -- si tu
		De -- us no -- ster. __
	}
}

tenor = {
	\new Voice = "tenor" {
		\transpose c d \relative c {
			\clef "bass"
			R1 r r r r
			r2 d1 c d2 R1 r2 r4 f4 ~
			
			f4 g f2 e1 f2 g2. f4 e1 d2~
			d r R1 R r2 f f e
			d r e4 f g2 f f e d e4 f g2~
			
			g2 r2 R1 R R R
			a2 a g f g1 f2 r R1
			R r2 f1 e f g2~
			
			g f e d1 r2 R1
			f1 e2 f1 r2 g f e1 d2 r R1 c'4 a c2 a4 f e2 d1
		}
	}
	\addlyrics {
		Da pa -- cem Do --
		
		mi -- ne in di -- e -- bus no -- stris __
		qui -- a non
		est a -- li -- us, qui -- a non est a -- li -- us __
		
		qui pu -- gnet pro no -- bis
		ni -- si tu De -- 
		
		us no -- ster,
		ni -- si tu De -- us
		no -- ster, ni -- si tu De -- us no -- ster.
	}
}

bassus = {
	\new Voice = "bassus" {
		\transpose c d \relative c {
			\clef "bass"
			d1 c2 d f4. e8 f g a2 f4 f2. d4 e f
			bes,8 c d e f4. g8 a4 g8 f g4 a g2 f4 d2. g4 c,4. d8 e4 f d~
			
			d4 e f8 g a b c4 b8 a b4 e,2 d4 c8 b a4 g g r2 a a'4 d,4~
			d d e4. fis8 g4 \ficta fis!8 g a2 d,4 d8 e f!4 e8 d e d c4 d2 R1
			R a4 a b c d4. e8 f2 r g,4 g c2 c4. d8
			
			e2 f4 f2 e8 e d2 d g, g' f4 e f2 e
			r r4 f4 c2 f R1 r2 r4 a, d4. a8 bes2
			a2 d2. c4 bes4. c8 d e f4 g g c,2 r a' g
			
			e2 r4 a,2 a4 d2 R1 e2 a,
			d r a d4. e8 f g a b c4 b8 a g f e2 d4
			c2 g'4 e f2 g e e a,\breve d1
		}
	}
	\addlyrics {
		Da pa -- cem Do -- _ _ _ _ mi -- ne, da pa -- cem
		Do -- _ _ _ _ _ _ _ _ _ mi -- ne, da pa -- cem Do -- _ mi -- ne, Do -- 
		
		_ _ _ _ _ _ mi -- _ ne in di -- e -- _ bus no -- stris, in di -- e -- 
		bus no -- _ _ _ _ stris qui -- a __ _ non est __ _ a -- _ li -- us,
		qui -- a non est a -- li -- us, a -- li -- us, a -- li -- 
		
		us qui pu -- gnet pro no -- bis, qui pu -- gnet pro no -- bis,
		qui pu -- gnet, qui pu -- _ gnet
		pro no -- bis ni -- si tu __ _ De -- us no -- ster, ni -- si
		
		tu, ni -- si tu, ni -- si
		tu, tu De -- _ _ _ _ _ _ us __ _ no -- _ _ _
		ster, De -- us no -- ster, De -- us no -- ster.
	}
}


\score {
	<<
		\new StaffGroup
	  	<< 
			\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\new Staff \with { instrumentName = #"CANTUS"  shortInstrumentName = #"C " } << \global \cantus >> 
			\new Staff \with { instrumentName = #"SEXTUS"  shortInstrumentName = #"S " } << \global \sextus >> 
			\new Staff \with { instrumentName = #"QUINTUS" shortInstrumentName = #"Q " } << \global \quintus >>
			\new Staff \with { instrumentName = #"ALTUS"   shortInstrumentName = #"A " } << \global \altus >>
			\new Staff \with { instrumentName = #"TENOR"   shortInstrumentName = #"T " } << \global \tenor >>
			\new Staff \with { instrumentName = #"BASSUS"  shortInstrumentName = #"B " } << \global \bassus >>
		>> 
	>>
%	\midi { }
}

