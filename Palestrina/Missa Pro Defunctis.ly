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
		proportionalNotationDuration = #(ly:make-moment 1 4)
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
		\consists "Horizontal_bracket_engraver"
		\remove "Forbid_line_break_engraver"
	}
}

\include "Missa Pro Defunctis - symbols.ly"

\markup {
	\column \larger {
		\vspace #1
		\line \bold { Introïtus }
		\vspace #0.5
		\line { Requiem æternam dona eis, Domine, et lux perpetua luceat eis. }
		\line { Te decet hymnus Deus, in Sion, et tibi reddetur votum in Ierusalem. }
		\line { Exaudi orationem meam; ad te omnis caro veniet. }
		\line { Requiem æternam dona eis, Domine, et lux perpetua luceat eis. }
		\vspace #1
	}
}

\include "Missa Pro Defunctis - Kyrie.ly"

\markup {
	\column \larger {
		\line \bold { Graduale }
		\vspace #0.5
		\line { Requiem æternam dona eis, Domine: et lux perpetua luceat eis. }
		\line { In memoria æterna erit iustus, ab auditione mala non timebit. }
		\vspace #2
		\line \bold { Tractus }
		\vspace #0.5
		\line { Absolve, Domine, animas omnium fidelium defunctorum }
		\line { ab omni vinculo delictorum et gratia tua illis succurente }
		\line { mereantur evadere iudicium ultionis, et lucis æternae beatitudine perfrui. }
		\vspace #2
	}
}

\include "Missa Pro Defunctis - Offertorium.ly"

\include "Missa Pro Defunctis - Sanctus.ly"

\include "Missa Pro Defunctis - Benedictus.ly"

\include "Missa Pro Defunctis - Agnus Dei 1.ly"

\include "Missa Pro Defunctis - Agnus Dei 2.ly"

\pageBreak

\include "Missa Pro Defunctis - Agnus Dei 3.ly"

\markup {
	\column \larger {
		\vspace #2
		\line \bold { Communio }
		\vspace #0.5
		\line { Lux æterna luceat eis, Domine, }
		\line { cum sanctis tuis in æternum, }
		\line { quia pius es. }
		\line { Requiem æternam dona eis, Domine; }
		\line { et lux perpetua luceat eis; }
		\line { cum Sanctis tuis in æternum, }
		\line { quia pius es. }
		\vspace #2
		\line { Requiescat in pace. Amen. }
	}
}
