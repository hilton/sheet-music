\version "2.24.2"
revision = "2"
% \pointAndClickOff

#(set-global-staff-size 15)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 5\mm
	inner-margin = 15\mm
	outer-margin = 10\mm
	bottom-margin = 10\mm
	markup-system-spacing = #'( (padding . 4) )
	system-system-spacing = #'( (basic-distance . 6) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
	indent = 0
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	tagline = ##f
}

\layout {
  	ragged-right = ##f
  	ragged-last = ##f
	\context {
		\Score
      \remove "Metronome_mark_engraver"
		\override BarNumber.self-alignment-X = #CENTER
		\override BarNumber.break-visibility = #'#(#f #t #t)
		\override VerticalAxisGroup.staff-staff-spacing = #'((basic-distance . 0) (stretchability . 90))
		\override VerticalAxisGroup.remove-empty = ##t
		\override VerticalAxisGroup.remove-first = ##t		
		\override SpanBar.transparent = ##t
		\override BarLine.transparent = ##t
	}
	\context {
		\Staff
	}
	\context { 
		\Voice 
		\override NoteHead.style = #'baroque
		\consists "Horizontal_bracket_engraver"
		\consists "Ambitus_engraver"
	}
	\context {
		\Score
		proportionalNotationDuration = #(ly:make-moment 1 8)
		\override SpacingSpanner.uniform-stretching = ##t
	}
}


global = {
	\key f \major
	\omit Staff.TimeSignature
	\time 4/4
	\set Staff.midiInstrument = "drawbar organ"
	\accidentalStyle "forget"
	\set melismaBusyProperties = #'()
}

showBarLine = {
	\once \override Score.BarLine.transparent = ##f
	\once \override Score.SpanBar.transparent = ##f 
}

italicas=\override LyricText.font-shape = #'italic
rectas=\override LyricText.font-shape = #'upright
ss=\once \set suggestAccidentals = ##t
mtempo={\tempo 4 = 100}
mtempob={\tempo 4 = 50}


cantus={
	r1*4/4 |
	r1*4/4 |
	r4 a'4 a'4 a'4 |
	g'4 f'4 bes'2 |
%5
	a'1 |
	r4 f'4 g'2. f'8 e'8 f'8 g'8 a'8 f'8 | \break
	bes'4 a'4 g'4 f'4. d'8 f'4 e'4 d'4 |
%10
	g'2. f'4 |
	e'2 f'2 |
	g'4 a'2 g'4 |
	a'4 f'4 a'2. bes'4 a'4 g'4 ~ |
%15
	g'4 \ss fis'8 e'8 fis'2 |
	r4 f'4 f'4 f'4 |
	%\break
	g'4 a'2 g'4 |
	f'2. e'4 |
	d'4 f'2 e'4. d'8 d'2 cis'4 |
	d'2 r4 a'4 |
	a'4 e'4 f'4 a'4. g'8 bes'4. a'8 a'4 |
	g'4 a'2 g'4 |
%25
	f'4 d'4 g'2. f'8 e'8 f'1 r2 |
	r4 a'4 a'4 e'4 |
	f'4 g'4 a'2 |
%30
	d'2 r4 f'4 |
	d'4 e'4 f'4 d'8 e'8 |
	f'8 g'8 a'4 g'4 bes'2 a'4 g'2. \ss fis'8 e'8 \mtempob fis'\breve*1/4
	\showBarLine \bar "||"
	\override Score.RehearsalMark.self-alignment-X = #right
	\mark \markup{"Hosanna ut supra"}
}

altus={
	r1*4/4 |
	d'1 |
	f'1 |
	e'4 c'4 d'4 e'4 |
%5
	f'2. d'4 |
	e'4 d'4. c'8 c'4 |
	d'1 ~ |
	d'1 |
	r4 a4 a4 bes4 |
%10
	g4. a8 bes8 a8 d'2 \ss cis'4 d'1 r2 |
	r4 d'4 d'4 d'4 |
	c'4 bes4 \ss ees'2 |
%15
	d'2 r4 d'4 |
	d'4 a4 bes4 d'2 e'4 f'4 e'4. d'8 d'2 c'4 |
	bes4 a8 g8 f4 g4 |
%20
	r4 a4 a4 e4 |
	f4.  g8 a8 d8 d'4 ~ |
	d'4 c'4 d'4 f'4. e'8 d'8 c'8 bes4 c'4 |
	d'4 e'4 f'4 e'4. d'8 d'2 c'4 |
	r4 d'4 d'4 a4 |
	bes4 f'2 e'4 |
	d'2 c'2 |
	d'4 bes4 a2 |
%30
	r4 d'4 d'4 a4 |
	bes4 c'4 d'4 f'4. e'8 c'4 r4 d'4 |
	d'4 a4 bes8 g8 bes2 a8 g8 a\breve*1/4
}

tenor={
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
	r1*4/4 |
%5
	r1*4/4 |
	r1*4/4 |
	r4 a4 a4 a4 |
	g4 f4 bes2 |
	a2 r4 d'4 |
%10
	bes4 c'4 d'4 d4 |
	a2 d2 |
	r4 d'4 d'4 d'4 |
	c'8 bes8 a8 g8 f4 f'4. e'8 d'4 c'2 |
%15
	bes4 a8 g8 a2 |
	r4 d'4 d'4 a4 |
	bes4 c'4 f4 g4 |
	a1 |
	r4 a4 a4 e4 |
%20
	f2 e4 a4. g8 f8 e8 f4 d4 |
	a2 d2 |
	r4 d'4 d'4 a4 |
	bes4 c'4 f4 g4 |
%25
	a4 bes4 g2 |
	a2 r4 d'4 |
	d'4 a4 bes4 c'4 |
	bes4 a8 g8 a2 |
	r4 d'4 d'4 a4 |
%30
	bes2. c'4 |
	bes4 g4 a4 d'4 |
	d'4 a4 bes4 g4 |
	d'1 |
	d'\breve*1/2
}

bassus={
	a2 a4 a4 |
	g4 f4 bes2 |
	a4 d8 e8 f8 g8 a8 bes8 |
	c'4 a4 g2 |
%5
	r4 d4 d4 d4 |
	c4 bes,4 \ss ees2 |
	d1 |
	r2 r4 d4 |
	d4 d4 c4 bes,4 |
%10
	\ss ees2 d2 |
	r4 a4 a4 a4 |
	g4 f4 bes2 |
	a4 d4 d4 d4 |
	f4 g4 c2 |
%15
	d\breve |
	r1*4/4 |
	r4 d4 d4 a,4 |
	bes,4 d2 c4 |
%20
	d2 a,2 |
	d1 |
	r1*4/4 |
	r1*4/4 |
	r4 a4 a4 e4 |
%25
	f4 g4 e2 |
	d1 |
	r4 d4 d4 a,4 |
	bes,8 c8 d8 e8 f8 g8 a4 |
	d4 g2 f4 |
%30
	g2. f4 |
	g4 e4 d4. c8 |
	bes,4 f4 g2. \ss fis4 g2 |
	d\breve*1/2
}

textocantus=\lyricmode{
Be -- ne -- di -- ctus qui ve -- nit
\italicas
be -- ne -- _ _ di -- _ _ _ _ _ ctus qui __ _ ve -- _ _ _ _ _ _ _ _ _ nit,
\rectas
be -- ne -- di -- ctus qui _ ve -- _ nit
\italicas
in no -- mi -- ne __ _ _ _ _ _ Do -- mi -- _ _ _ ni
\rectas
in no -- mi -- ne Do -- _ _ _ _ _ _ _ _ _ mi -- _ _ ni
\italicas
in no -- mi -- ne Do -- mi -- ni
\rectas
in no -- mi -- ne Do -- _ _ _ _ _ _ _ _ mi -- _ ni.
}

textoaltus=\lyricmode{
Be -- ne -- di -- ctus qui __ _ ve -- _ _ _ _ _ nit _
\italicas
be -- ne -- di -- ctus __ _ qui _ ve -- _ nit
be -- ne -- di -- ctus qui ve -- nit
\rectas
in no -- mi -- ne Do -- _ _ _ _ mi -- _ ni __ _ _ _ _ 
\italicas
in no -- mi -- ne __ _ _ _ Do -- _ mi -- ni,
in _ _ _ _ no -- mi -- ne Do -- mi -- _ _ ni
in no -- mi -- ne Do -- _ _ _ mi -- _ ni
\rectas
in no -- mi -- ne Do -- mi -- ni __ _ _
\italicas
in no -- mi -- ne _ Do -- mi -- _ ni.
}

textotenor=\lyricmode{
Be -- ne -- di -- ctus qui ve -- nit
\italicas
be -- ne -- di -- ctus qui ve -- nit 
be -- ne -- di -- ctus __ _ _ _ _ qui __ _ _ ve -- nit __ _ _ _ 
\rectas
in no -- mi -- ne __ _ Do -- mi -- ni
\italicas
in no -- mi -- ne __ _ Do -- _ _ _ _ _ mi -- ni
in no -- mi -- ne __ _ Do -- mi -- ni __ _ _ _ 
in no -- mi -- ne __ _ Do -- mi -- _ ni
in no -- mi -- ne Do -- mi -- _ ni,
\rectas
in no -- mi -- ne Do -- mi -- ni.
}

textobassus=\lyricmode{
Be -- ne -- di -- ctus qui ve -- _ _ _ _ _ _ _ _ _ nit
\italicas
be -- ne -- di -- ctus qui ve -- nit
be -- ne -- di -- ctus qui ve -- nit
be -- ne -- di -- ctus qui ve -- nit,
be -- ne -- di -- ctus qui ve -- nit
\rectas
in no -- mi -- ne Do -- _ _ mi -- ni
\italicas
in no -- mi -- ne Do -- mi -- ni
in no -- mi -- ne __ _ _ _ _ _ _ _ Do -- mi -- ni,
\rectas
in no -- mi -- ne __ _ _ Do -- _ _ mi -- ni.
}



\score {
  \header {
    piece = \markup \larger \sans { Benedictus }
  }
  
  \transpose f as {
  <<

    \new StaffGroup
    <<
      \new Staff
      <<
        \set Staff.instrumentName = "S2"
        \context Staff <<
          \context Voice = "sopranoA" {  \global \cantus }
          \new Lyrics \lyricsto "sopranoA" { \textocantus }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "A"
        \context Staff <<
          \context Voice = "alto" { \global \altus }
          \new Lyrics \lyricsto "alto" { \textoaltus }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "T"
        \context Staff <<
          \context Voice = "tenorA" { \global \clef "treble_8" \tenor }
          \new Lyrics \lyricsto "tenorA" { \textotenor }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "B1"
        \context Staff <<
          \context Voice = "tenorB" { \global \clef "treble_8" \bassus }
          \new Lyrics \lyricsto "tenorB" { \textobassus }
        >>
      >>
    >>
  >>
  }
  \layout {}
  \midi {\tempo 4 = 100 }
}
