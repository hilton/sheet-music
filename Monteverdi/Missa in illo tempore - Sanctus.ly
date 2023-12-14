% Copyright ©2023 Peter Hilton - https://github.com/hilton
% Based on CPDL #55912 by Oscar Smith

\version "2.24.2"
revision = "1"
%\pointAndClickOff

#(set-global-staff-size 15)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 15\mm
	inner-margin = 15\mm
	outer-margin = 10\mm
	bottom-margin = 10\mm
	markup-system-spacing = #'( (padding . 8) )
	system-system-spacing = #'( (basic-distance . 20) (stretchability . 100) )
  	ragged-bottom = ##f
	ragged-last-bottom = ##t
	indent = 0
} 

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	title = \markup \medium \fontsize #6 \override #'(font-name . "Source Sans Pro Light") {
		"Missa In illo tempore"
	}
	piece = \markup \larger \sans { Sanctus }
	composer = \markup \sans {
		\vspace #2
		\column {
			\line { \with-url #"http://en.wikipedia.org/wiki/Claudio_Monteverdi" "Claudio Monteverdi" (1567 – 1643) }
		}
	}
	copyright = \markup \sans {
		\vspace #6
		\column \center-align {
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
		\override SpanBar #'transparent = ##t
		\override BarLine #'transparent = ##t
		\override VerticalAxisGroup #'staff-staff-spacing = #'((basic-distance . 10) (stretchability . 100))
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
	\context {
		\Score
		proportionalNotationDuration = #(ly:make-moment 1 4)
      \override SpacingSpanner #'uniform-stretching = ##t
	}
}


global= { 
	\key bes \major
	\time 4/2
	\set Staff.midiInstrument = "choir aahs"
	\accidentalStyle "forget"
}

showBarLine = {
	\once \override Score.BarLine #'transparent = ##f
	\once \override Score.SpanBar #'transparent = ##f 
}
ficta = { \once \set suggestAccidentals = ##t }


sopranoA =  \relative bes' {
  \clef "treble" | % 1
  bes1 a | % 2
  g1  f2 bes | % 3
  c2 a bes g | % 4
  a2 f bes1 | % 5
  a1 g  | % 6
  f2 f' es1 | % 7 
  \break d1 c  | % 8
  bes1 r2 f'2. es4 es2. d4
  d2. c4 c2. bes4
  bes1 a2  bes f' | % 12
  g2 es f d | % 13
  es2 c d2. f4 | % 14
  es1  d2 bes2. a4 a2 bes d | % 16
  c2. c4 bes1 | % 17
  r2 c d bes | % 18
  c2  a r bes ~ \break | % 19
  bes4 a a2 bes1. d2 c2. c4 | % 21
  c2 f2. es4 d2. c4 bes1 a4 g | % 23
  a4 bes c a d2.
  es4 \break | % 24
  f1  f | % 25
  f2 f2. es4 d2. c4 bes1 a4 g | % 27
  a4 bes c a d1  | % 28
  d2 d c1 | % 29
  c2 f2.
  es4 d2. c4 bes2  f' c
  | % 31
  f2. es4 d c
  bes2. a4 g2  c c | % 33
  d2. c4 bes c d
  bes4 | % 34
  c1  a2 a | % 35
  bes2. a4 g a bes
  g4  | % 36
  a1 f2 f' | % 37
  g1  es2 es | % 38
  f1 d | % 39
  r1 r2 f | \barNumberCheck #40
  g4 f es d es2
   es2 | % 41
  f4 es d c d2
   d2 | % 42
  es4 d c bes c1  | % 43
  d4 c bes a bes2
   d2 | % 44
  c2 d1  c2 | % 45
  bes2 c1  bes2 | % 46
  a2 bes1 a2 | % 47
  g2 a2. bes4 c
  a4 | % 48
  d\breve | % 49
  c2 bes c1 | \barNumberCheck #50
  bes1. a4 g | % 51
  c2  f, f'1 | % 52
  es\breve | % 53
  d\breve | % 54
  c\breve | % 55
  bes\breve | % 56
  a2. g4 f2 f'2. es4 d2. c4
  bes2 | % 58
  c\breve  | % 59
  d\breve \showBarLine \bar "|."
}

sopranoALyrics =  \lyricmode {
  \set
  ignoreMelismata = ##t Sanc -- _ _ tus Sanc -- _
  _ _ _ _ _ _ _ _ tus Sanc --
  _ _ _ tus Sanc -- _ _ _ _ _ _ _ _ _ tus
  Sanc -- _ _ _ _ _ _ _ _
  _ tus "Do" -- mi -- nus De -- us Sa -- ba -- oth Sanc --
  _ _ _ tus Do -- _ mi -- nus De -- us Sa
  -- ba -- oth Ple -- _ _ _ _ _ _ _
  _ _ _ _ _ _ ni sunt coe  -- _ _ _ _ _ _ _ 
  _ _ _ _ li et ter -- ra glo --
  _ _ _ _ ri -- a tu -- _ _ _
  _ _ _ a glo -- _ _ _ _
  _ _ _ ri -- a tu -- _ _ _ _
  _ _ a glo -- _ ri -- a tu -- a O -- san -- _
  _ _ _ na "in " __ _ _ _ _ ex --
  cel -- _ _ _ _ "sis " __ _ _ _
  _ O -- san -- _ na "in " __ _ ex -- cel --
  _ _ _ _ _ _ _ _ _
  _ _ _ _ _ _ sis O -- san -- na in ex
  -- cel -- _ _ _ _ _ _ _ _ "sis."
}


sopranoB =  \relative bes' {
  \clef "treble" | % 1
  r2 bes c a | % 2
  bes2 g a f | % 3
  g2 f4 es f es d
  es4 | % 4
  f1  d2 bes' | % 5
  c2 a bes g | % 6
  a2 f g es  | % 7
  f1. c'2 | % 8
  d2 bes c a | % 9
  bes2 g a4 f f'2 |
  \barNumberCheck #10
  g2 es f d | % 11
  es2 c d2. f4 | % 12
  es1 d4 c d bes | % 13
  c1  f,2 f' | % 14
  g2 es f d | % 15
  es2 c d2. es4 | % 16
  f1  d2 bes2. a4 a2 bes d | % 18
  c2. c4 d1 | % 19
  r2 f2. es4 d2. c4 bes1 a4 g | % 21
  a4 bes c a d2.
  es4 | % 22
  f1  f | % 23
  f2 f2. es4 d2
  ~ | % 24
  d4 c bes1 a4 g | % 25
  a4 bes c a d1  | % 26
  d2 d c1 | % 27
  c2 f2. es4 d2. c4 bes2  f' c
  | % 29
  f2. es4 d c
  bes2. a4 g2  c1 | % 31
  r2 f2. es4 d2. c4 bes2  f' c
  | % 33
  f2. es4 d c
  bes2  | % 34
  f'1 f | % 35
  g2. f4 es f g
  es4 | % 36
  f1  d2 d | % 37
  es2. d4 c d es
  c4 | % 38
  d2. c4 bes1  | % 39
  c2 d c d1 c2 bes c1 bes2 a bes1 a2 g\breve  f1 ~ | % 44
  f1 f' | % 45
  es\breve | % 46
  d\breve | % 47
  c\breve | % 48
  bes\breve | % 49
  f'1 f1. es2 d es1 d2 c d1 c2 bes c1 bes2 a bes ~ | % 54
  bes2 a g a1 g2 f g1 f2 f'2. es4 | % 57
  d2. c4 bes1. a4 g a1  | % 59
  bes\breve \bar "|."
}

sopranoBLyrics =  \lyricmode {
  \set
  ignoreMelismata = ##t Sanc -- _ _ _ _ _
  _ _ _ _ _ _ _ _ _ ctus
  Sanc -- _ _ _ _ _ _ _ _ tus
  Sanc -- _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _ _
  _ _ _ _ _ _ tus Sanc -- _ _
  _ _ _ _ _ _ _ tus Do -- mi -- nus De -- us Sa -- ba -- oth Ple -- _ _ _ _
  _ _ _ _ _ _ _ _ _ ni sunt coe -- _ _ _ _ _
  _ _ _ _ _ _ _ li et ter --
  ra glo -- _ _ _ _ ri -- a tu -- _ _ _ _ _ _ a glo _ _ _ _ ri -- a tu -- _ _ _
  _ a glo -- _ _ _ _ _ _ _ ri
  -- a tu -- _ _ _ _ _ _ _ _ a
  O -- san -- _ na "in " __ _ ex -- cel -- _ _ _ "sis " __ _ O -- san -- na in
  ex -- cel -- sis O -- san -- _ na in ex -- cel -- _ _ _ _
  _ _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ _
  "sis."
}


alto =  \relative f' {
  \clef "treble" \key bes \major | % 1
  r1 r2 f | % 2
  g2 es f d | % 3
  es2 c d g2. f4 f1 e2  | % 5
  f2 f g es ? | % 6
  f2 d es c | % 7
  d2. es4 f1 | % 8
  d2 es c d | % 9
  bes1 a | \barNumberCheck #10
  g1  f2 f' | % 11
  g2 es f d | % 12
  es2 c d2. f4 | % 13
  es1  d2 bes2. a4 a2 bes d | % 15
  c2. c4 bes1 | % 16
  f'\breve | % 17
  f1. f2 | % 18
  f\breve | % 19
  f\breve | \barNumberCheck #20
  f2. g4 a2. bes4 | % 21
  c1  bes2 bes, | % 22
  f'2. g4 a2. bes4 | % 23
  c1  bes2 bes, | % 24
  f'2. g4 a2. bes4 | % 25
  c1  bes2 f | % 26
  bes1 f\breve r1 | % 28
  d2. es4 f2. g4 | % 29
  a1  f2 f | \barNumberCheck #30
  g1 f  | % 31
  f1 r | % 32
  d2. es4 f2. g4 | % 33
  a1  d,2 d | % 34
  f\breve | % 35
  bes,\breve | % 36
  f'\breve | % 37
  es\breve | % 38
  d1 r2 bes' | % 39
  a2 bes1  a2 | \barNumberCheck #40
  g2 as1  g2 | % 41
  f2 g1 f2 | % 42
  es2 f1 es2 | % 43
  d2 es2. d4 d c8
  bes8 | % 44
  c4 f, bes c d es
  f2  | % 45
  bes2 as2. es4 g2 
  | % 46
  d2 g2. d4 f2  | % 47
  c2 f1 f2 | % 48
  f\breve | % 49
  f\breve | \barNumberCheck #50
  R1*2 | % 51
  r2 bes a bes1 as2 g as1 g2 f g ~ | % 54
  g2 f es f1 es2 d es1 d2 c1 | % 57
  f\longa  | % 59
  f\breve \bar "|."
}

altoLyrics =  \lyricmode {
  \set
  ignoreMelismata = ##t Sanc -- _ _ _ _ _
  _ _ _ _ _ _ _ tus Sanc -- _
  _ _ _ _ _ _ _ _ _
  _ _ _ _ _ tus Sanc -- _ _
  _ _ _ _ _ _ _ tus Do -- mi
  -- nus De -- us Sa -- ba -- oth Ple -- ni sunt coe -- li Ple --
  _ _ _ _ ni sunt coe -- _ _ _
  _ li et ter -- _ _ _ _ ra et ter --
  ra glo -- _ _ _ _ ri -- a tu -- _ a
  glo -- _ _ _ _ ri -- a tu -- a O -- san -- na O
  -- san -- _ na "in " __ _ ex -- cel -- _ _
  _ _ _ _ _ _ _ _ _
  _ _ _ _ _ _ _ sis "in " __
  _ _ ex -- cel -- _ _ sis in ex -- cel --
  sis O -- san -- _ na "in " __ _ ex -- cel --
  _ _ _ _ _ _ _
  _ _ _ _ "sis."
}

tenorA =  \relative f' {
  \clef "treble_8" \key bes \major
  \transposition c | % 1
  r1 f | % 2
  es1 d | % 3
  c1 bes2  bes | % 4
  c2 a bes g | % 5
  a2 f bes4 g c2  | % 6
  f,1 r | % 7
  bes1 a | % 8
  g1 f | % 9
  bes2  c1 a2 | \barNumberCheck #10
  bes2 g a f | % 11
  c'1  f,2 bes2. a4 a2 bes d | % 13
  c2. c4 bes1 | % 14
  r1 r2 f' | % 15
  g2 es f  d | % 16
  r2 c d2. bes4 | % 17
  c2  a r bes2. a4 a2 bes d | % 19
  c2. c4 bes2. c4 |
  \barNumberCheck #20
  d2. es4 f1  | % 21
  c1 d | % 22
  bes1 c2 c  | % 23
  a2 a bes2. c4 | % 24
  d1  f  | % 25
  c1 d2. c4 | % 26
  bes4 c d bes c1 | % 27
  a2  a bes2. a4 | % 28
  g4 a bes g a1  | % 29
  f2 c' bes\breve a g f2 f'2. f4 f2 bes,1 | % 34
  a\breve | % 35
  g\breve | % 36
  f\breve | % 37
  c'\breve | % 38
  f,\breve | % 39
  R1*10 | % 44
  r1 r2 f' | % 45
  g4 f es d es2
   es2 | % 46
  f4 es d c d2
   d2 | % 47
  es4 d c bes c1 | % 48
  d4 c bes a bes1 | % 49
  f\breve  | \barNumberCheck #50
  bes1 r | % 51
  r1 r2 f' | % 52
  g4 f es d es2
   es2 | % 53
  f4 es d c d2
   d2 | % 54
  es4 d c bes c1 | % 55
  d4 c bes a bes1  | % 56
  c2 f,2. g4 a2  | % 57
  f1 bes | % 58
  f4 g a bes c2
  f,2  | % 59
  f\breve \bar "|."
}

tenorALyrics =  \lyricmode {
  \set
  ignoreMelismata = ##t Sanc -- _ _ _ _ tus Sanc
  -- _ _ _ _ _ _ _ _ tus Sanc
  -- _ _ _ _ tus Sanc -- _ _ _
  _ _ tus Do -- mi -- nus De -- us Sa -- ba -- oth
  San -- _ _ _ tus Sanc -- _ _ _ tus Do
  -- mi -- nus De -- us Sa -- ba -- "oth " __ _ _
  _ _ Ple -- ni sunt coe -- _ li et ter -- _
  _ "ra " glo -- _ _ _ _
  _ _ _ ri -- a tu -- _ _ _ _ _
  _ a O -- san -- "na " "in " ex -- cel -- sis O -- san -- na in ex -- cel -- sis O -- san -- _
  _ _ _ na "in " __ _ _ _ _ ex --
  cel -- _ _ _ _ _ _ _ _
  _ _ sis O -- san -- _ _ _ _ na "in "
  __ _ _ _ _ ex -- cel -- _ _ _
  _ _ _ _ _ _ sis "in " __ _
  _ ex -- cel -- _ _ _ _ _ _ "sis."
}


tenorB =  \relative f' {
  \clef "treble_8" \key bes \major
  \transposition c | % 1
  R1*2 | % 2
  r1 f | % 3
  es1 d | % 4
  c1  bes | % 5
  r2 d2. c4 c2. bes4 bes1 a2 | % 7
  bes1  f | % 8
  bes1 a | % 9
  g1  f | \barNumberCheck #10
  r1 f' | % 11
  es1 d | % 12
  c1  bes2 f' | % 13
  g2 es f d | % 14
  es2 c d2. f4 | % 15
  es1  d2 bes2. a4 a2 bes d | % 17
  c2. c4 bes1 | % 18
  R1*2 | % 19
  c1 d | \barNumberCheck #20
  bes1 c | % 21
  a2 a bes2. c4 | % 22
  d1  f | % 23
  c1 d2. c4 | % 24
  bes4 c d bes c1  | % 25
  a2 a bes2. a4 | % 26
  g4 a bes g a1  | % 27
  f2 c' d2. c4 | % 28
  bes4 c d bes c1  | % 29
  a2 a bes2. a4 | \barNumberCheck
  #30
  g4 a bes g a1  | % 31
  f2 c' bes\breve a g1 | % 34
  f1 c' | % 35
  es2 es1 bes2 | % 36
  d1 a | % 37
  r2 c1 g2 | % 38
  bes1 f' | % 39
  f\breve | \barNumberCheck #40
  es\breve | % 41
  d\breve | % 42
  c\breve | % 43
  bes\breve | % 44
  f'1 f | % 45
  R1*8 | % 49
  r1 f | \barNumberCheck #50
  g1. es2 | % 51
  f1. d2 | % 52
  es1. c2 | % 53
  d1. bes2 | % 54
  c1. a2 | % 55
  bes1. g2 | % 56
  a1. f1 f'2. es4 d2 | % 58
  c\breve  | % 59
  bes\breve \bar "|."
}

tenorBLyrics =  \lyricmode {
  \set
  ignoreMelismata = ##t Sanc -- _ _ _ tus Sanc --
  _ _ _ _ _ _ tus Sanc --
  _ _ tus Sanc -- _ _ _ tus Sanc -- _
  _ _ _ _ _ _ _ _ tus Do --
  mi -- nus De -- us Sa -- ba -- oth Ple -- ni sunt coe -- li
  et ter -- _ _ ra glo -- _ _ _ _ _
  _ _ ri -- a tu -- _ _ _ _ _
  _ a glo -- _ _ _ _ _ _ _ ri
  -- a tu -- _ _ _ _ _ _ a O -- san -- na in ex -- cel -- sis in ex -- cel -- sis in ex
  -- cel -- sis O -- san -- na in ex -- cel -- sis O -- san -- na in
  ex -- cel -- _ _ _ _ _ _
  _ _ _ _ _ _ _ "sis."
}


bass =  \relative bes {
  \clef "bass" \key bes \major | % 1
  R1*4 | % 3
  r1 bes | % 4
  a1 g | % 5
  f2  f es1 | % 6
  d1 c  | % 7
  bes2 bes' c a | % 8
  bes2 g a f | % 9
  g2 es  f f |
  \barNumberCheck #10
  es1 d | % 11
  c1  bes | % 12
  r1 r2 bes' ~ | % 13
  bes4 a a2 bes d
  | % 14
  c2. c4 bes1 | % 15
  R1*2 | % 16
  f1 bes, | % 17
  f'1 bes | % 18
  f1 bes, | % 19
  f'1 bes | \barNumberCheck #20
  r1 f\breve bes, f' bes1 ~ | % 24
  bes1 f\breve bes, f' bes\breve  f1  | % 29
  c'1 d2. c4 | \barNumberCheck #30
  bes4 c d bes c1  | % 31
  a2 a bes2. a4 | % 32
  g4 a bes g a2.
  g4 | % 33
  f4 g a f g1  | % 34
  c1 f, | % 35
  es\breve | % 36
  d\breve | % 37
  c\breve | % 38
  bes\breve | % 39
  f'1 f | \barNumberCheck #40
  R1*6 | % 43
  r1 r2 bes | % 44
  a2 bes1  a2 | % 45
  g2 as1  g2 | % 46
  f2 g1 f2 | % 47
  es2 f2. g4 a2
  | % 48
  bes1. a4 g | % 49
  a4 f bes1 a2 | \barNumberCheck #50
  g2. a4 bes2 c  | % 51
  a2 bes f bes  | % 52
  g2 as es as  | % 53
  f2 g d g  | % 54
  es2 f c f  | % 55
  d2 es bes es  | % 56
  c2 d a1 | % 57
  bes\breve | % 58
  f'\breve  | % 59
  bes,\breve \bar "|."
}

bassLyrics =  \lyricmode {
  \set
  ignoreMelismata = ##t Sanc -- _ _ _ tus Sanc --
  _ _ tus Sanc -- _ _ _ _ _ _
  _ _ tus Sanc -- _ _ _ tus Do -- _ mi
  -- nus De -- us Sa -- ba -- oth Ple -- ni sunt coe -- li et ter --
  ra Ple -- "ni " "sunt " coe -- _ li -- "et " ter -- _ ra glo --
  _ _ _ _ _ _ _ ri -- a tu --
  _ _ _ _ _ _ _ _ _
  _ _ _ a O -- san -- na -- in -- ex -- cel -- sis O --
  san -- _ na "in " __ _ ex -- cel -- _ _
  _ _ _ _ _ _ _ _ _
  _ _ _ _ _ _ sis O -- _ _ san
  -- _ _ _ "na " __ _ _ _ "in " __ _
  _ _ ex -- _ _ _ cel -- _ _ _
  _ "sis."
}



% The score definition
\score {
  \transpose bes as {
  <<

    \new StaffGroup
    <<
      \new Staff
      <<
        \set Staff.instrumentName = "S1"
        \context Staff <<
          \context Voice = "sopranoA" {  \global \sopranoA }
          \new Lyrics \lyricsto "sopranoA" { \sopranoALyrics }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "S2"
        \context Staff <<
          \context Voice = "sopranoB" {  \global \sopranoB }
          \new Lyrics \lyricsto "sopranoB" { \sopranoBLyrics }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "A"
        \context Staff <<
          \context Voice = "alto" { \global \alto }
          \new Lyrics \lyricsto "alto" { \altoLyrics }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "T1"
        \context Staff <<
          \context Voice = "tenorA" { \global \tenorA }
          \new Lyrics \lyricsto "tenorA" { \tenorALyrics }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "T2"
        \context Staff <<
          \context Voice = "tenorB" { \global \tenorB }
          \new Lyrics \lyricsto "tenorB" { \tenorBLyrics }
        >>
      >>
      
      \new Staff
      <<
        \set Staff.instrumentName = "B"
        \context Staff <<
          \context Voice = "bass" { \global \bass }
          \new Lyrics \lyricsto "bass" { \bassLyrics }
        >>
      >>

    >>

  >>
  }
  \layout {}
  \midi {\tempo 2 = 100 }
}
