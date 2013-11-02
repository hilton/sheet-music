% Copyright ©2013 Peter Hilton - https://github.com/hilton

\version "2.16.2"
revision = "2"

#(set-global-staff-size 15)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 8) )
	markup-system-spacing = #'( (padding . 8) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #6 \override #'(font-name . "Source Sans Pro Light") {
		"3. Sana me Domine"
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
	\key f \major
	\tempo 2 = 44
	\time 2/2
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t }
squareBracket = {  }


cantus = \new Voice {
	\relative c'' {
		R1 R R R r2 d2 ~ \break d4 c8 bes es4 es4 c2 r R1
		R bes a2 c \break bes4 a8 g a f bes2 a4. g8 g2 fis4 g1 r2
		R1 R \break R g2. f4 bes2 g r d' c f, \break 
		
		c'4 c2 d c4 a2 f r r r4 c'4 es d c2 \break f, r
		R1 d'2 bes1 es,1 c'2 \break bes a1 r2 b4 c2 bes!4 a2 a
		r2 d4. d8 bes1 \break r4 c a g4. a8 bes c d2 d r1 a
		
		 f2 \break r4 c' bes8 c d2 c bes4 g8 a bes c d2 c d g, r \break
		r r4 d4. d8 a'4 a2. f2 es d8 e! f4 d
		f1 ~ \break f2 a2 R1 r4 d g,2 es'1 d \showBarLine \bar "|."
	}
	\addlyrics {
		Do -- _ _ _ mi -- ne,
		Sa -- na me Do -- _ _ _ _ _ _ _ _ mi -- ne
		et sa -- na -- bor: sal -- vum me

		fac et sal -- vus e -- ro, et sal -- vus e -- ro,
		sal -- vum me fac, me fac, et sal -- vus e -- ro
		quo -- ni -- am sa -- lus me -- _ _ _ _ a tu
		
		es, tu es, __ _ _ sa -- lus me -- _ _ _ _ a tu es,
		quo -- ni -- am sa -- lus me -- _ _ _ a
		tu es, tu es, tu es.
	}
}

sextus = \new Voice {
	\relative c' {
		R1 R f2. es8 d a'4 a2 bes4 g2 r r g bes a4 g r2 d'
		es4 c a4. f8 es2 r r4 d'2 ~ d8 es d1 c R R
		R f,4 e a2 e r r r4 d' c bes f2 g r g2. c,4
		
		bes8 c d2 e4 f2 c bes bes'8 a16 g a8 f f2 e8 d c4 g' bes g8 f16 e d8 c bes2. r4
		R1 a'4 f2 e4 es d2 c4 g'2 g d d1 r2 r c4 c c2. d4
		cis2 r r \ficta c'!4. c8 f2 f,8 g a bes c2 f, f8 d e f g4 g d2 cis
		
		R1 R r2 r4 c'4. c8 c4 g8 a16 bes c8 d f2 g, c r
		R1 R r2 r4 bes8 es d c16 bes a2 r4
		bes4. a8 a4 g4 ~ g e2 a8 g16 f e2 e'4 a, g f2 r4 r2 f d1
	}
	\addlyrics {
		Do -- _ _ _ mi -- _ ne, sa -- na -- bor, __ _ Sa -- 
		na me Do -- mi -- ne, Sa -- _ na me,
		et sa -- na -- bor, et sa -- _ na -- bor: sal -- vum
		
		me -- _ a fac et sal -- vus e -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ro
		sal -- _ vum me fac et sal -- vus e -- ro, sal -- vus e -- _ 
		ro, quo -- ni -- am sa -- _ lus _ me -- a, sa -- _ lus _ me -- a tu es,

		quo -- ni -- am me -- _ _ _ a tu __ _ es,
		sa -- lus me -- _ _ a,
		quo -- ni -- am sa -- lus me -- _ _ a tu es, tu es, tu es.
	}
}

altus = {
	\new Voice = "altus" {
		\relative c' {
			\clef "treble_8"
			R1 R R d2. c8 bes e4 e d2 ~ d4 d2 c4 g'1 fis4 g2 fis4
			g g2 \ficta f!8 es f4. d8 d2 r es ~ es d f r r d1 f2
			f1 f2. e8 d a'4 a e f2 e4 a2. g4 r2 g f c4 f4. g8 a f
			
			g4 g a f e8 f16 g a8 g f e d4. e8 f2 e4 f2 f bes,4. g8 c2 d4 f2 e4
			d2 d R1 d1. es2 g fis1 d4 f!2 es4 d2. a4 r2
			r4 a'4. a8 g4 g f d8 e f g a2 a,4 e' d8 d g4 r2 r4 a f d8 e f g a4 a,2.
			
			 a2 f'4 ~ f es4 d2 g,4. g8 c4 f d d2 a'4 f4. f8 a4 f2 es4 d4. e!8
			f e16 d g4 f2. d4 e e4. e8 d4 r2 R1
			r2 r4 f d d4. e8 f g a4 g2 fis4 g1 ~ g\breve
		}
	}
	\addlyrics {
		Do -- mi -- _ _ _ ne et sa -- na -- bor, Sa -- na 
		me Do -- _ _ _ mi -- ne, Sa -- na me, Sa -- na 
		me Do -- _ _ _ mi -- ne et sa -- na -- bor: sal -- vum me fac __ _ _ _ 
		
		_ et sal -- vus e -- _ _ _ _ _ _ _ _ _ _ ro, sal -- vum me fac et sal -- vus 
		e -- ro, sal -- vum me fac et sal -- vus e -- ro,
		quo -- ni -- am sa -- lus me -- _ _ _ _ a, quo -- _ ni -- am sa -- lus me -- _ _ _ _ a,
		
		me -- a tu es, quo -- ni -- am sa -- lus me -- a, quo -- ni -- am sa -- lus me -- _ 
		_ _ _ _ a tu es, quo -- ni -- am 
		sa -- lus me -- _ _ _ _ a tu es.
	}
}

quintus = {
	\new Voice = "quintus" {
		\relative c' {
			\clef "treble_8"
			bes1 g2 bes4 bes2 a8 g c4 c f,2 r4 d'2 c8 bes f'4 f bes,2 r g bes1 a2
			c4 bes8 a g4 g f1 R r4 c'2 bes4 c1 a2 r r r4 f2 
			d4 a'2. g8 f g2 a4 c2 f,4 c'2 c r4 bes2 g c,4 f2 r4 a bes a
			
			g2 f r a2. d,8 d g4 g c bes a g8 f g a bes2 a4 ~ a g8 f c'4 c
			r d, d' bes a2 g bes g1. g2 a2. a4 bes a g2 f4. d8 a'2. f4
			e2 d d4. d8 f2 f2. e4 g4. a8 bes c d2 a4 r2 f4. f8 e2
			
			r a4. a8 c4 g4. g8 bes4 es2. d4 d,8 \ficta e!16 f g4 f f c' a4. a8 d,4 g2 f4 f ~
			f es4 d4. e!8 f g a4 a2 r4 d,4. d8 es4 f2 d1
			 r4 a'4 f d8 e f g a4 a2 a g d' g,\breve
		}
	}
	\addlyrics {
		Sa -- na me Do -- _ _ _ mi -- ne, Do -- _ _ _ mi -- ne, Sa -- na me 
		Do -- _ _ _ mi -- ne et sa -- na -- bor, et 
		sa -- na -- _ _ _ bor, et sa -- na -- bor: sal -- vum me fac et sal -- vus 
		
		e -- ro, sal -- vum me fac et sal -- vus e -- _ _ _ _ _ _ _ _ _ ro,
		et sal -- vus e -- ro, sal -- vum me fac et sal -- vus e -- ro, et sal -- vus 
		e -- ro, quo -- ni -- am sa -- lus me -- _ _ _ _ a, quo -- ni -- am,
		
		quo -- ni -- am, quo -- ni -- am sa -- lus me -- _ _ _ a tu es, quo -- ni -- am sa -- lus, sa -- 
		lus me -- _ _ _ _ a, quo -- ni -- am sa -- lus,
		sa -- lus me -- _ _ _ _ a tu es, tu es.
	}
}

tenor = {
	\new Voice = "tenor" {
		\relative c {
			\clef "treble_8"
			r2 es1 d2 es2. f2 \ficta e!8 d g2. g4 f2 g1 es'2 d4 d2 c8 bes c4 c
			g2 c bes f'4 es8 d c2. g4 R1 r2 es' d bes4 bes2 a8 g d'4 c8 bes
			a g f e f4 f d1 f4 e a2 g r d'2. c4 g2 d'8 e f2 c4 d2
			
			c4 e f f, a2 d,2. a'4 c bes a8 bes16 c d4 c2 r e,4 f ~ f d c2
			d4 a' fis g d'1 es2. g,4 c1 d1. r2 R1 r4 e, c' a
			a2. bes4 d4. d8 bes2 c4 a c4. d8 e! c d2 bes d4 a2 c4. c8 e2
			
			f4 d c8 bes16 c d4 g,2 r c4. c8 f,2 bes2. a2 f f4 c'2 a4 f'
			c c2 bes4 a4. g16 f e2 f4 a bes2. bes4 f2
			r4 d'4. d8 c4 r a2 f4 f' e c8 bes c d es4 d8 c bes4 b! c1 d
		}
	}
	\addlyrics {
		Sa -- na me Do -- _ _ _ mi -- ne, Sa -- na me Do -- _ _ _ mi -- 
		ne et sa -- na -- _ _ _ bor, Sa -- na me Do -- _ _ _ _ _ 
		_ _ _ _ _ mi -- ne et sa -- na -- bor: sal -- vum me fac __ _ _ et sal -- 
		
		vus, et sal -- vus e -- ro, et sal -- vus e -- _ _ _ ro, et sal -- vus e -- 
		ro, sal -- vum me fac, sal -- vum me fac et sal -- vus 
		e -- ro, quo -- ni -- am sa -- lus me -- _ _ _ _ a tu es, quo -- ni -- am 
		
		sa -- lus me -- _ _ _ a, quo -- ni -- am sa -- lus me -- a tu es, tu 
		es, sa -- lus me -- _ _ _ a tu es, tu es,
		quo -- ni -- am sa -- lus, sa -- lus me -- _ _ _ _ _ _ _ a tu es.
	}
}

bassus = {
	\new Voice = "bassus" {
		\relative c {
			\clef "bass"
			c4 bes2 a f' g2. r4 es g,2. a4 bes2. a8 g a2. r4 des2 c es r
			R1 c8 d es f g2 fis1 g R R g,2 a8 bes c d
			e4 f2 g4 d a'2 gis4 a2 r R1 R r2 d,4. c8 bes4 c8 d g2
			
			f2 e8 d4. e f8 g4 c, c2 a d4 bes'8 a g2 bes,8 c16 d es8 f g2 d r
			R1 R R es4 d2 c4 g2 d'1 r2 R1 r4 g e d
			a2 d r c4. c8 bes1 c4 bes a8 g a bes c2 g a e'
			
			a,4. a8 d2 es a,4 g8 a16 bes c2 d R1 es d2 c4 bes
			g' f d8 c16 bes a1 r4 bes' a8 g16 a e8 d c4. c8 d4 c8 bes4 a8
			a' g16 f e2 r4 c8 bes4 a8 g' f16 e d8 c c bes4 bes8 bes2 a f'4 es8 d c1 g'
		}
	}
	\addlyrics {
		Sa -- _ _ na me Do -- _ _ mi -- _ _ ne sa -- na -- bor,
		Do -- _ _ _ _ mi -- ne, Do -- _ _ _ _ 
		mi -- ne et sa -- na -- _ bor: sal -- _ vum me _ fac __
		
		_ _ _ _ et sal -- vus e -- ro, et sal -- _ vus e -- _ _ _ _ _ ro,
		et sal -- vus e -- ro, et sal -- vus 
		e -- ro, quo -- ni -- am sa -- lus me -- _ _ _ _ a tu es,
		
		quo -- ni -- am sa -- lus me -- _ _ _ a tu es, sa -- lus 
		me -- _ _ _ _ a, me -- _ _ _ a, _ quo -- ni -- am sa -- _ lus 
		me -- _ _ a, sa -- _ lus me -- _ _ _ a tu __ _ es, tu es, me -- a _ tu es.
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
	\layout { }
%	\midi { }
}
