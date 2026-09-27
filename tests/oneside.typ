#import "../lib.typ": timeline

#set page(margin: 2cm)
#set text(font: "New Computer Modern")

= Single-Sided Timeline Test

== Left Spine (Events on Right)

#let events = (
  (date: "Jan 1", desc: "First event description. Notice how this sentence can now stretch across the entire width of the page instead of being confined to just half of it."),
  (date: "Jan 2", desc: "Second event description. Sentences can be significantly longer before hitting a line wrap."),
  (date: "Jan 3", desc: "Third event description with final details."),
)

#timeline(events, side: "left")

#v(2em)

== Right Spine (Events on Left)

#timeline(events, side: "right")
