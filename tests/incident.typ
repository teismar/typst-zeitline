#import "../lib.typ": timeline

// Simple demo document
#set page(margin: 2cm)
#set text(font: "New Computer Modern")

= Incident Timeline Demo

This is a demonstration of the chronos timeline package.

#v(1em)

#let events = (
  (date: "April 2024", desc: "Initial compromise reported by researchers. Threat actors claim data theft."),
  (date: "27 May", desc: "'Spiderman' posts alleged database on Exploit Forum."),
  (date: "28 May", desc: "ShinyHunters shares samples on BreachForum. Media picks up the story."),
  (date: "30 May", desc: "VX Underground interviews threat actors; AWS/MSP vector claimed."),
  (date: "31 May", desc: "Hudson Rock report released. Snowflake denies direct breach."),
  (date: "31 May", desc: "Live Nation confirms breach in SEC filing."),
  (date: "1 June", desc: "Class action lawsuit filed against Ticketmaster."),
  (date: "1 June", desc: "Joint statement: Mandiant/Crowdstrike engaged."),
  (date: "2 June", desc: "Santander Bank confirmed as second victim."),
  (date: "3 June", desc: "Pure Storage confirms data workspace intrusion."),
  (date: "4 June", desc: "Advance Auto Parts data appears on dark web markets."),
  (date: "5 June", desc: "Mandiant releases technical details on the infostealer campaign."),
  (date: "6 June", desc: "Snowflake enforces MFA for all accounts."),
  (date: "10 June", desc: "Ticketmaster begins notifying customers formally."),
  (date: "12 June", desc: "Analyzing logs reveals exfiltration window was roughly 2 weeks."),
  (date: "15 June", desc: "Final impact assessment: 165 organizations potentially targeted."),
)

#timeline(events)
