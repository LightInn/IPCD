#let cover = (
  title: [IPCD - Inter Planetary Content Delivery],
  subtitle: [Technical Whitepaper / Vision Document],
  tagline: [A Paradigm Shift in Decentralized, Client‑Driven Content Distribution],
  logo: none,
  authors: [Neova Protocol],
  date: [September 29, 2024],
  version: [Draft 1.0],
) => {
  v(4cm)
  align(center)[
    // Main title and subtitle
    #set text(size: 22pt, font: ("Noto Sans", "DejaVu Sans"), weight: 700)
    #title \
    #set text(size: 12pt, font: ("Noto Sans", "DejaVu Sans"), weight: 500)
    #subtitle
  ]

  align(center)[
    #line(length: 80%)
  ]


  v(0.8cm)
  align(center)[
    #set text(size: 11pt, font: ("Noto Sans", "DejaVu Sans"), weight: 500)
    #tagline
  ]

  v(2.8cm)
  align(center)[
    // Optional logo
    #if logo != none [
      #image(logo, width: 3cm)
      #v(0.6cm)
    ]
  ]


  v(2.8cm)
  align(center)[
    #strong[Authors:] #authors \
    #strong[Date:] #date \
    #strong[Version:] #version
  ]
}
