% CPDL #33475
% Copyright ©2013 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "10"

#(set-global-staff-size 15.0)

\paper {
	#(define fonts (make-pango-font-tree "Century Schoolbook L" "Source Sans Pro" "Luxi Mono" (/ 15 20)))
	annotate-spacing = ##f
	two-sided = ##t
	top-margin = 8\mm
	bottom-margin = 10\mm
	inner-margin = 15\mm
	outer-margin = 15\mm
	top-markup-spacing = #'( (basic-distance . 4) )
	markup-system-spacing = #'( (padding . 4) )
	system-system-spacing = #'( (basic-distance . 15) (stretchability . 100) )
	ragged-bottom = ##f
	ragged-last-bottom = ##t
}

year = #(strftime "©%Y" (localtime (current-time)))

\header {
	tagline = ##f
}

\layout {
	indent = #0
	ragged-right = ##t
	ragged-last = ##t
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
		\consists "Custos_engraver"
	}
	\context {
		\Voice
		\override NoteHead #'style = #'baroque
		\consists "Horizontal_bracket_engraver"
		\remove "Forbid_line_break_engraver"
	}
}

\include "Missa Pro Defunctis - symbols.ly"

\score {
	\new Staff <<
		\key f \major
		\new Voice = "tenor" {
			\relative c {
				\clef "treble_8"
				\cadenzaOn \override Stem #'transparent = ##t
				f8^"solo" f g s4 f8 s4 f8 s4. f8^"tutti" g a s4 a8 g g f g s4 g2 f \breathe \bar ""
				f8 g a s4 a8 g s4. a8 s4 a8 c a g \grace a bes a g s4. f8 s4 f8 g a g f g s4 g2 f s \showBarLine \bar "|"
				a8 g s4. a8 g f s4. a8 s4 g8 a s4 g8 f s4 f2 \breathe \bar ""
				a8 g s4 a s a8 c a g \grace a bes a g s4. f8 g a g f g s4 g2 f \showBarLine \bar "|"
				f8^"solo" g s4. g8 f s4 g8 a s4. a8 a s4. a8 a s4. a8 s4. g4 a2 \breathe \bar ""
				f8 s4. g8 s4 a8 s4. a8 a a s4. a8 a s4. a8 s4. g8 bes g a2 \showBarLine \bar "|"
				f8^"tutti" s4 g8 a s4 a8 s4. a4 a a a a s4. a8 a2 \breathe \bar ""
				a4 s a4 s a8 a s4. f8 s4 g8 a s4. g8 s4 f f2 \showBarLine \bar "|"
				f8 f g s4 f8 s4 f8 s4.  \bar "" f8 g a s4 a8 g g f g s4 g2 f \breathe \bar ""
				f8 g a s4 a8 g s4. a8 s4 a8 c a g \grace a bes a g s4. f8 s4 f8 g a g f g s4 g2 f \showBarLine \bar "|"
				a8 g s4. a8 g f s4. a8 s4 g8 a s4 g8 f s4 f2 \breathe \bar ""
				a8 g s4 a s a8 c a g \grace a bes a g s4. f8 g a g f g s4 g2 f \showBarLine \bar "||"
		  }
		}
		\addlyrics {
			Ré -- _ _ qui -- em æ -- _ _ tér -- _ _ _ _ nam __ _ dó -- _ _ na __ _ é -- is, __ _ _ _ _ _ _
			Dó -- mi -- _ _ _ _ _ ne, __ _ 
			et __ _ lux __ _ _ per -- pé -- _ tu -- _ a lú -- _ ce -- at __ _ _ _ _ _ _ é -- _ _ _ _ _ is. __ _
			Te __ _ dé -- _ cet __ _ hym -- nus Dé -- us, in Sí -- on, 
			et tí -- bi red -- dé -- tur vó -- tum in Je -- rú -- sa -- lem.
      Ex -- áu -- _ di o -- ra -- ti -- ó -- nem mé -- am; ad te óm -- nis cá -- ro __ _ vé -- ni -- et.
			Ré -- _ _ qui -- em æ -- _ _ tér -- _ _ _ _ nam __ _ dó -- _ _ na __ _ é -- is, __ _ _ _ _ _ _
			Dó -- mi -- _ _ _ _ _ ne, __ _ 
			et __ _ lux __ _ _ per -- pé -- _ tu -- _ a lú -- _ ce -- at __ _ _ _ _ _ _ é -- _ _ _ _ _ is. __ _
		}
	>>
	\header {
		piece = \markup \larger \sans { Introitus }
	}
	\layout {
		ragged-right = ##t
	}
}
