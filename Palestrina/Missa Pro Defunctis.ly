% CPDL #33475
% Copyright ©2013 Peter Hilton - https://github.com/hilton

\version "2.14.2"

\header {
	title = "Missa Pro Defunctis"
	composer = \markup { \column {
		\line { " " }
		\line { G.P. da Palestrina }
	} }
	poet = \markup { \column {
		\line { " " }
		\line { Transcribed by Maarten Michielsen }
		\line { Typeset by Peter Hilton }
	} }
	tagline = \markup \small { "24 October 2011 - revision 9. Copyright ©2011 Cappella Gabrieli - www.cappellagabrieli.nl" }
}

\paper {
	annotate-spacing = ##f
	top-margin = #7
	bottom-margin = #10
	top-markup-spacing =  #'(
		(padding . 3)
	)
	top-system-spacing =  #'(
		(basic-distance . 8)
	)
	markup-markup-spacing =  #'(
		(padding . 4)
	)
	markup-system-spacing =  #'(
		(padding . 2)
	)
	system-system-spacing #'padding = #3
	last-bottom-spacing =  #'(
		(minimum-distance . 12)
	)

	ragged-last-bottom=##t
} 

\layout {
	indent = #0
   	ragged-right = ##f
   	ragged-last = ##f
	\context { 
		\Score
		\override BarNumber #'transparent = ##t
	}
	\context { 
		\Voice 
		\override NoteHead #'style = #'baroque
	} 
	\context {
		\VaticanaStaff
		fontSize = #4
		\override StaffSymbol #'staff-space = #1.5
	}
}

\include "Missa Pro Defunctis - symbols.ly"

\markuplines {
	\column \larger {
		\vspace #1
		\line \bold { Introïtus }
		\vspace #0.5
		\line { Requiem æternam dona eis, Domine, }
		\line { et lux perpetua luceat eis. }
		\line { Te decet hymnus Deus, in Sion, }
		\line { et tibi reddetur votum in Ierusalem. }
		\line { Exaudi orationem meam; }
		\line { ad te omnis caro veniet. }
		\line { Requiem æternam dona eis, Domine, }
		\line { et lux perpetua luceat eis. }
	}
}

\include "Missa Pro Defunctis - Kyrie.ly"

\markuplines {
	\column \larger {
		\line \bold { Graduale }
		\vspace #0.5
		\line { Requiem æternam dona eis, Domine : }
		\line { et lux perpetua luceat eis. }
		\line { In memoria æterna erit iustus, }
		\line { ab auditione mala non timebit. }
		\vspace #2
		\line \bold { Tractus }
		\vspace #0.5
		\line { Absolve, Domine, }
		\line { animas omnium fidelium defunctorum }
		\line { ab omni vinculo delictorum }
		\line { et gratia tua illis succurente }
		\line { mereantur evadere iudicium ultionis, }
		\line { et lucis æternae beatitudine perfrui. }
	}
}

\include "Missa Pro Defunctis - Offertorium.ly"

\include "Missa Pro Defunctis - Sanctus.ly"

\include "Missa Pro Defunctis - Benedictus.ly"

\include "Missa Pro Defunctis - Agnus Dei 1.ly"

\include "Missa Pro Defunctis - Agnus Dei 2.ly"

\pageBreak

\include "Missa Pro Defunctis - Agnus Dei 3.ly"

\markuplines {
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

