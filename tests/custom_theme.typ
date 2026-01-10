#import "../lib.typ": timeline

#set page(margin: 2cm)
#set text(font: "New Computer Modern")

= Custom Theme Demo

This timeline uses a custom theme with blue accents and larger dots.

#let blue-theme = (
  colors: (
    accent: blue,
    line: navy.lighten(40%),
    muted: gray,
  ),
  sizes: (
    dot: 5pt,
    line-width: 3pt,
    date: 10pt,
  ),
  spacing: (
    arm: 10em,
    row: 4em,
  ),
)

#let events = (
  (date: "2024-01-01", desc: "Project Kickoff with custom blue theme."),
  (date: "2024-02-15", desc: "First milestone reached. The dots are larger and the lines are thicker."),
  (date: "2024-03-30", desc: "Beta release. Checking if the custom spacing works."),
)

#timeline(events, theme: blue-theme)
