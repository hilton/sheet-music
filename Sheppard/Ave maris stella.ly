\version "2.10.33"

\header {
	title = "Ave maris stella"
	composer = "John Sheppard"
	tagline = ##f 
}

global= { 
	\key f \minor
	\time 2/2
	\tempo 4 = 100
	\set Score.timing = ##f 
	\set Staff.midiInstrument = "Harpsichord"
	#(set-global-staff-size 15) 
	#(set-accidental-style 'forget)
}

\paper {
%	annotate-spacing = ##t
%	page-top-space = 0
%	between-system-padding = 5\mm
%	between-system-space = 5\mm
%	ragged-bottom = ##t 
%	bottom-margin = 5\mm
%	ragged-last = ##t
	ragged-last-bottom = ##t
} 


% 1.
\score {
	\relative c {
		\key f \minor
		\clef bass \once \override Staff.TimeSignature #'stencil = ##f
		\cadenzaOn bes8 f' ~ f es f g bes8. as g8 f es \bar "|" f8 ~ f f bes, c es d8. c8 bes8. \bar "|" 
		d8 c es f f8. bes, \bar "|" c8 es c d c8. bes8 as bes8. \bar "||"
	}
	\addlyrics {
		\set stanza = "1."
		Av -- ve __ mar -- is__ _ stel -- la __ _ _ _ De -- i mar -- _ ter al -- _ ma at -- que sem -- per vir -- go fe -- lix cœ -- li por -- _ _ ta
	}
	\layout {
		indent = #0
	}
}

% 2.
treble = \new Voice {
	\relative c'' {
		\override NoteHead #'style = #'baroque
		r1 r2 es4 e as2 g1 f4. f8   g4 g as2 g f4 as4. g8 f4. es8 f4 des4. des8 es4 f 
		ges2 f \bar "" \break es r4 bes f'2 es1 r4 as2 as4 g? f   es2 g r1 as2 g4 f2 bes,4 es2 d1 \fermata \bar "||"
	}
	\addlyrics {
		\set stanza = "2."
		Su -- mens il -- lud __ a -- ve   Ga -- bri -- e -- lis o -- _ _ _ re,__ _ a --  ve Ga -- bri -- 
		e -- lis __ _ o --  _ re __ fun -- da nos in   pa -- ce mu -- tans no -- men E -- æ
	}
}

mean = \new Voice {
	\relative c'' {
		\override NoteHead #'style = #'baroque
		r1 r c4 c es1 as,4 c4.   bes8 c4 as2 r as4. as8 bes4 c des c bes2 as
		r4 c2 bes4 c c d2 as4. bes8 c4 as bes es, as4. bes8 c4 as bes2   r4 es2 bes4 c as bes c as2 des4. des8 c4 f,8 bes as g f es bes'1 \fermata
	}
	\addlyrics {
		\set stanza = "2."
		Su -- mens il --  _ _    _ _ lud a -- ve Ga -- bri -- e -- lis o -- re
		fun -- da nos in pa -- _ _ _ _ _ _ _ _ _ _ ce   mu -- tans no -- men E -- _ væ, mu -- tans no -- men E -- _ - _ _ væ
	}
}

altoI = \new Voice {
	\relative c' {
		\override NoteHead #'style = #'baroque
		r4 f2 f4 as2 g f bes,4 es4. f8 g4 c, f2   es4 des c es2 c des4 c bes as bes2 r
		es4. es8 f4 g as2 ges4 f2 des4 r es2 es4 des des c2 bes   as'2 g f4 es des bes c2 des4. es8 f4 es8 des des4 c f1 \fermata
	}
	\addlyrics {
		\set stanza = "2."
		Su -- mens il -- _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ lud
		a -- ve Ga -- bri -- e -- lis o -- re fun -- da nos in pa -- ce   mu -- tans no -- men E -- _ _ _ _ _ _ _ _ _ væ
	}
}

altoII = \new Voice {
	\relative c' {
		\override NoteHead #'style = #'baroque
		r2 r4 c2 c4 es4. des8 c4 bes8 as bes2 g c1 f4. f8 g4 g as f2 as4. g8 as4 ges4 f es des2
		c4 des2 es des r4 as'2 as4 g? g f2. c4 des bes2 as4 bes2 as' g4 f2 es4 des bes c bes2 
			\once \set suggestAccidentals = ##t a4 bes1 \fermata
	}
	\addlyrics {
		\set stanza = "2."
		Su -- mens il -- _ _ _ _ _ _ lud __ a -- ve Ga -- bri -- e -- lis __ o -- _ _ _ _ _ _ _ _ _
		re fun -- da nos in pa -- _ _ _ _   ce mu -- tans no -- men E -- _ _ _ _ væ
	}
}

tenor = \new Voice {
	\relative c {
		\override NoteHead #'style = #'baroque
		\clef "treble_8"
		r1 r r2 r4 es2 es4 f2   c r bes'4. bes8 as4 c bes as bes c des2 c
		bes4 ges as bes as2 r4 f2 f4 as es bes'2 as r1   r c2 bes as4 es8 f g as bes4 f2 es f1 \fermata
	}
	\addlyrics {
		\set stanza = "2."
		Su -- mens il --   lud a -- ve Ga -- bri -- e -- lis o -- _ _ _
		_ _ _ _ re fun -- da nos in pa -- ce   mu -- tans no -- men E -- _ _ _ _ _ væ
	}
}

bass = \new Voice {
	\relative c {
		\override NoteHead #'style = #'baroque
		\clef bass
		bes2 f'1 es2 f g bes as   g f es f f1 bes,2 c
		es des c bes des c es f f bes,   c es c des c bes as4 bes c2 bes1 \fermata
	}
	\addlyrics {
		\set stanza = "2."
		Su -- mens __ il -- lud __ _ a -- _ _ _ _ _ ve Ga -- bri -- 
		e -- lis o -- re fun -- da nos in pa -- ce   mu -- tans no -- men __ _ E -- _ _ _ væ
	}
}

\score {
	\new StaffGroup << 
		\set Score.proportionalNotationDuration = #(ly:make-moment 1 16)
		\override Score.MetronomeMark #'transparent = ##t
		\new Staff << \global \treble \set Staff.instrumentName = "Treble " >> 
		\new Staff << \global \mean \set Staff.instrumentName = "Mean " >> 
		\new InnerStaffGroup <<
			\set InnerStaffGroup.systemStartDelimiter = #'SystemStartBrace
			\new Staff << \global \altoI \set Staff.instrumentName = "Alto I " >> 
			\new Staff << \global \altoII \set Staff.instrumentName = "Alto II " >> 
		>>
		\new Staff << \global \tenor \set Staff.instrumentName = "Tenor " >> 
		\new Staff << \global \bass \set Staff.instrumentName = "Bass " >> 
	>> 
}

% 3.
\score {
	\relative c {
		\key f \minor
		\clef bass \once \override Staff.TimeSignature #'stencil = ##f
		\cadenzaOn bes8 f' ~ f es f g bes8. as g8 f es \bar "|" f8 ~ f f bes, c es d8. c8 bes8. \bar "|" 
		d8 c es f f8. bes, \bar "|" c8 es c d c8. bes8 as bes8. \bar "||"
	}
	\addlyrics {
		\set stanza = "3."
		Sol -- ve __ vin -- cla __ _ re -- is __ _ _ _ pro -- fer lu -- men cæ -- _ cis
		ma -- la nos -- tra pel -- le bo -- na cun -- cta po -- _ _ sce
	}
	\layout {
		indent = #0
	}
}

