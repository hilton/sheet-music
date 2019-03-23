% CPDL #33475
% Copyright ©2019 Peter Hilton - https://github.com/hilton

\version "2.18.2"
revision = "11"

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
	title = \markup \medium \fontsize #7 \override #'(font-name . "Source Sans Pro Light") {
		\center-column {
			"Missa Pro Defunctis"
			\vspace #1
		}
	}
	composer = \markup \sans \column \right-align { "G.P. da Palestrina" }
	copyright = \markup \sans {
		\vspace #2
		\column \center-align {
			\line {
				Copyright \year \with-url #"http://www.cappellagabrieli.nl" "Cappella Gabrieli"
				"Transcribed by Maarten Michielsen - Typeset by Peter Hilton" -
				"CPDL #33475"
				revision \revision
			}
			\line {
				Lilypond source \with-url #"https://github.com/hilton/sheet-music" https://github.com/hilton/sheet-music
			}
		}
	}
	tagline = ##f
}

\layout {
	indent = #0
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

\include "Missa Pro Defunctis - Introitus.ly"
\include "Missa Pro Defunctis - Kyrie.ly"
\include "Missa Pro Defunctis - Graudale.ly"
\include "Missa Pro Defunctis - Tractus.ly"
\include "Missa Pro Defunctis - Offertorium.ly"
\include "Missa Pro Defunctis - Sanctus.ly"
\include "Missa Pro Defunctis - Benedictus.ly"
\include "Missa Pro Defunctis - Agnus Dei 1.ly"
\include "Missa Pro Defunctis - Agnus Dei 2.ly"
% \pageBreak
\include "Missa Pro Defunctis - Agnus Dei 3.ly"
\include "Missa Pro Defunctis - Communio.ly"
