% Copyright ©2013 Peter Hilton

\version "2.16.2"
revision = "4"

#(set-global-staff-size 16)
#(set-accidental-style 'forget)


\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 16 20)))
	annotate-spacing = ##f
	two-sided = ##t
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 4) )
	markup-system-spacing = #'( (padding . 6) )
	system-system-spacing = #'( (padding . 1) (basic-distance . 20) (stretchability . 100) )
	indent = 0
	ragged-last-bottom = ##t
	print-all-headers = ##t
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #8 \override #'(font-name . "Source Sans Pro Light") {
		"Madonna mia pietà"
	}
	composer = \markup \sans {
		\column {
			\line { Orlando di Lasso (1532-1594) }
		}
	}
	copyright = \markup \sans \smaller {
		\vspace #3
		\column \center-align {
			\line {
				This edition copyright \year Peter Hilton - based on CPDL "#00229" by Rafael Ornes - 
				Lilypond source at \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music - 
				revision \revision
			}
			\line {
				Licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License - \with-url #"http://creativecommons.org/licenses/by-nc-sa/3.0/" http://creativecommons.org/licenses/by-nc-sa/3.0/
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
		\override BarLine #'transparent = ##t
		\remove "Bar_number_engraver"
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
	}
}


global= { 
	\key f \major
	\tempo 2 = 120
	\time 2/2
	\set Staff.midiInstrument = "Acoustic guitar"
}

showBarLine = { \once \override Score.BarLine #'transparent = ##f }
ficta = { \once \set suggestAccidentals = ##t }


superius = \new Voice {
	\relative c' {
		\repeat unfold 2 {
			e2 e4 e \tieDashed g ~ g fis2 r4 fis g a g g fis4. g8
			a4 bes g g2 fis4
		}
		\alternative {
			{ g2 r }
			{ g2 d }
		}
		\showBarLine \bar "|" 
		e4 e f2. f4 f2 c4 c'2 a4

		a2 fis \showBarLine \bar "|" fis g1 fis2 r4 f? bes2. a4 g g2 fis4 g f!
		bes2. a4 bes c d2 b r4 a
		\repeat unfold 2 {
				a g a a fis2 fis4 a a c c c
				d2 d4 d d c c d g,2 g4 d e g2 fis4
		}
		\alternative {
			{  g2 r4 a }
			{  g1 }
		}
		\showBarLine \bar "|."
	}
	\addlyrics {
		\set stanza = #"1. "
		\repeat unfold 2 {
			Ma -- don -- na "mia, pie" -- tà, ma -- don -- na mia, pie -- tà __ _
			_ chiam’ ed a -- i -- ta,
		}
		ch’io mo -- "ro e" sten -- "to a" tor -- "to e" pur vo -- le -- te,

		\set stanza = #"1-3. "
		io gri -- do, io gri "do e" n’ol sen -- te -- te, io
		gri -- "do e" n’ol sen -- te -- te:

		\set stanza = #"1-4. "
		\repeat unfold 2 {
			“Ac -- qua, ma -- don -- "na, al" fo -- co, ac -- qua, ma -- don -- "na, al" 
			fo -- co ch’io mi sen -- to mo -- ri -- re a po -- "co a" po -- co.”
		}
		\showBarLine \bar "|."
	}
	\addlyrics {
		\set stanza = #"2. "
		\repeat unfold 2 {
			Vo -- "stra al" -- tie -- "ra   bel" -- tà, vo -- "stra al" -- tie -- ra bel -- tà, __ _ _
			so -- "la in" -- fi -- ni -- ta
		}
		é cau -- sa ch’io "me ab" -- bru -- "scia, e’l" con -- sen -- te -- te.
	}
	\addlyrics {
		\set stanza = #"3. "
		\repeat unfold 2 {
			Or -- mai l’è sce -- ma, or -- mai l’è sce -- ma
			l’af -- _ _ fan -- na -- ta vi -- ta.
		}
		No’l cre -- "di e" con vo -- "stri oc" -- chi lo ve -- de -- te.
	}
	\addlyrics {
		\set stanza = #"4. "
		\repeat unfold 2 {
			Di chie -- der -- "vi mer" -- cé, di chie -- der -- vi mer -- 
			cé, __ _ _ son qua -- si ro -- co.
		}
		Sol del -- la pe -- na mia pren -- de -- te gio -- co.

		\set stanza = #"4. "
		Pur gri -- do, pur gri -- "do in" o -- gni lo -- co, pur gri -- "do in" o -- gni lo -- co,
	}
}

altus = {
	\new Voice = "altus" {
		\relative c' {
		\repeat unfold 2 {
				c2 c4 c d d d2 r4 d e f d d d2
				f2 es4 es d2 
			}
			\alternative {
				{ d r }
				{ d b }
			}
			c c d4 d c c f2 e4 d2

			cis4 d2 d d1 d2 r4 d f2. f4 d c d2 d4 d
			f2 f4 f d g2 fis4 g d f f
			\repeat unfold 2 {
				e d e2 d4 a d e f f e2
				d4 g2 fis4 g2 f4 f es2 d4 bes c c d2
			}
			\alternative {
				{ d4 d f f }
				{ f1 }
			}
		}
		\showBarLine \bar "|."
	}
	\addlyrics {
		\set stanza = #"1. "
		\repeat unfold 2 {
			Ma -- don -- na mia, pie -- tà, ma -- don -- na mia, pie -- tà
			chiam’ ed a -- i -- ta,
		}
		ch’io mo -- "ro e" sten -- "to a" tor -- "to e" pur vo -- le -- _ te,
			
		\set stanza = #"1-3. "
		io gri -- do, io gri "do e" n’ol sen -- te -- te, io
		gri -- "do e" n’ol sen -- _ te -- te:
		
		\set stanza = #"1-4. "
		\repeat unfold 2 {
			“Ac -- qua, ma -- don -- "na, al" fo -- co, ac -- qua, ma -- don -- "na, al" 
			fo -- co ch’io mi sen -- to mo -- ri -- re a po -- "co a" po -- co.”
		}
	}
	\addlyrics {
		\set stanza = #"2. "
		\repeat unfold 2 {
			Vo -- "stra al" -- tie -- ra bel -- tà, vo -- "stra al" -- tie -- ra bel -- tà,
			so -- "la in" -- fi -- ni -- ta,
		}
		é cau -- sa ch’io "me ab" -- bru -- "scia, e’l" con -- sen -- te -- _ te.
	}
	\addlyrics {
		\set stanza = #"3. "
		\repeat unfold 2 {
			Or -- mai l’e sce -- _ ma, or -- mai l’è sce -- ma
			l’af -- fan -- na -- ta vi -- ta.
		}
		No’l cre -- "di e" con vo -- "stri oc" -- chi lo ve -- de -- _ te.
	}
	\addlyrics {
		\set stanza = #"4. "
		\repeat unfold 2 {
			Di chie -- der -- vi mer -- cé, di chie -- der -- vi mer -- 
			cé, son qua -- si ro -- co.
		}
		Sol del -- la pe -- na mia pren -- de -- te gio -- _ co.

		\set stanza = #"4. "
		Pur gri -- do, pur gri -- "do in" o -- gni lo -- co, pur gri -- "do in" o -- gni lo -- co,
	}
}

tenor = {
	\new Voice = "tenor" {
		\relative c' {
			\clef "treble_8"
			\repeat unfold 2 {
				g2 g4 g bes bes a2 r4 a c c bes bes a2
				d bes4 c a2
			}
			\alternative {
				{ g r }
				{ g r }
			}
			r4 g a a bes bes a2. a4 g f
			
			e2 d a' bes1 a2 r4 a d2. c4 bes g a2 g4 a
			d2. c4 bes g a2 g r
			\repeat unfold 2 {
				r4 d' d cis d d a2 a r4 g
				bes2 a4 a bes g a bes c2 bes4 g g g a2
			}
			\alternative {
				{ g2 r }
				{ b1 }
			}
			
		}
		\showBarLine \bar "|."
	}
	\addlyrics {
		\set stanza = #"1. "
		\repeat unfold 2 {
			Ma -- don -- na mia, pie -- tà, ma -- don -- na mia, pie -- tà
			chiam’ ed a -- i -- ta,
		}
		ch’io mo -- "ro e" sten -- "to a" tor -- "to e" pur vo -- le -- te, 
		
		\set stanza = #"1-3. "
		io gri -- do, io gri "do e" n’ol sen -- te -- te, io
		gri -- "do e" n’ol sen -- te -- te: 
		
		\set stanza = #"1-4. "
		\repeat unfold 2 {
			“Ac -- qua, ma -- don -- "na, al" fo -- co, al 
			fo -- co ch’io mi sen -- to mo -- ri -- re a po -- "co a" po -- co.”
		}
	}
	\addlyrics {
		\set stanza = #"2. "
		\repeat unfold 2 {
			Vo -- "stra al" -- tie -- ra bel -- tà, vo -- "stra al" -- tie -- ra bel -- tà,
			so -- "la in" -- fi -- ni -- ta,
		}
		é cau -- sa ch’io "me ab" -- bru -- "scia, e’l" con -- sen -- te -- te.
	}
	\addlyrics {
		\set stanza = #"3. "
		\repeat unfold 2 {
			Or -- mai l’e sce -- _ ma, or -- mai l’è sce -- ma
			l’af -- fan -- na -- ta vi -- ta.
		}
		No’l cre -- "di e" con vo -- "stri oc" -- chi lo ve -- de -- te.
	}
	\addlyrics {
		\set stanza = #"4. "
		\repeat unfold 2 {
			Di chie -- der -- vi mer -- cé, di chie -- der -- vi mer -- 
			cé, son qua -- si ro -- co.
		}
		Sol del -- la pe -- na mia pren -- de -- te gio -- co.

		\set stanza = #"4. "
		Pur gri -- do, pur gri -- "do in" o -- gni lo -- co, pur gri -- "do in" o -- gni lo -- co,
	}
}

bassus = {
	\new Voice = "bassus" {
		\relative c {
			\clef "bass"
			\repeat unfold 2 {
				c2 c4 c g g' d2 r4 d c f g g, d'2
				d es4 c d2
			}
			\alternative {
				{ g, r }
				{ g g' }
			}
			c, f  bes,4 bes f'2 f c4 d

			a2 d d g1 d2 r4 d bes2. f'4 g es d2 g,4 d'
			bes2. f'4 g es d2 g,4 g' f d
			\repeat unfold 2 {
				a' bes a2 d,4 d d cis d a c2
				g d' g4 e f d c2 g4 g c es d2
			}
			\alternative {
				{ g,4 g' f d }
				{ g,1 }
			}
		}
		\showBarLine \bar "|."
	}
	\addlyrics {
		\set stanza = #"1. "
		\repeat unfold 2 {
			Ma -- don -- na mia, pie -- tà, ma -- don -- na mia, pie -- tà
			chiam’ ed a -- i -- ta,
		}
		ch’io mo -- "ro e" sten -- "to a" tor -- "to e" pur vo -- le -- te, 
		
		\set stanza = #"1-3. "
		io gri -- do, io gri "do e" n’ol sen -- te -- te, io
		gri -- "do e" n’ol sen -- te -- te: 
		
		\set stanza = #"1-4. "
		\repeat unfold 2 {
			“Ac -- qua, ma -- don -- "na, al" fo -- co, ac -- qua, ma -- don -- "na, al" 
			fo -- co ch’io mi sen -- to mo -- ri -- re a po -- "co a" po -- co.”
		}
	}
	\addlyrics {
		\set stanza = #"2. "
		\repeat unfold 2 {
			Vo -- "stra al" -- tie -- ra bel -- tà, vo -- "stra al" -- tie -- ra bel -- tà,
			so -- "la in" -- fi -- ni -- ta,
		}
		é cau -- sa ch’io "me ab" -- bru -- "scia, e’l" con -- sen -- te -- te.
	}
	\addlyrics {
		\set stanza = #"3. "
		\repeat unfold 2 {
			Or -- mai l’e sce -- _ ma, or -- mai l’è sce -- ma
			l’af -- fan -- na -- ta vi -- ta.
		}
		No’l cre -- "di e" con vo -- "stri oc" -- chi lo ve -- de -- te.
	}
	\addlyrics {
		\set stanza = #"4. "
		\repeat unfold 2 {
			Di chie -- der -- vi mer -- cé, di chie -- der -- vi mer -- 
			cé, son qua -- si ro -- co.
		}
		Sol del -- la pe -- na mia pren -- de -- te gio -- co.

		\set stanza = #"4. "
		Pur gri -- do, pur gri -- "do in" o -- gni lo -- co, pur gri -- "do in" o -- gni lo -- co,
	}
}


\book {
	\score {
		\new Staff {
		\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\global
			\superius
		}
		\header {
			title = {}
			composer = {}
			instrument = \markup \medium \sans { "Superius" }
		}	
	}
}

\book {
	\score {
		\new Staff {
		\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\global
			\altus
		}
		\header {
			title = {}
			composer = {}
			instrument = \markup \medium \sans { "Altus" }
		}	
	}
}

\book {
	\score {
		\new Staff {
		\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\global
			\tenor
		}
		\header {
			title = {}
			composer = {}
			instrument = \markup \medium \sans { "Tenor" }
		}	
	}
}

\book {
	\score {
		\new Staff {
		\set Score.proportionalNotationDuration = #(ly:make-moment 1 8)
			\global
			\bassus
		}
		\header {
			title = {}
			composer = {}
			instrument = \markup \medium \sans { "Bassus" }
		}	
	}
}
