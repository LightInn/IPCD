#import "@preview/glossarium:0.5.9": make-glossary, register-glossary
#import "glossary.typ": entry-list, gls, glspl, print-paper-glossary
#show: make-glossary
#register-glossary(entry-list)

#let body-fonts = ("Noto Serif", "DejaVu Serif")
#let heading-fonts = ("Noto Sans", "DejaVu Sans")

#set heading(numbering: "I.1.a -")

#set page(
  paper: "a4",
  margin: 2.5cm,
  footer: context [
    #align(center)[
      #set text(font: heading-fonts, size: 9pt, weight: 500)
      #counter(page).display()
    ]
  ],
)
#set text(font: body-fonts, size: 11pt, lang: "en", hyphenate: true)

#set par(justify: true, first-line-indent: 1.5em)
#set block(spacing: 0.6em)
#set list(spacing: 0.4em, indent: 1.2em)

#show heading.where(level: 1): it => {
  set text(font: heading-fonts, size: 18pt, weight: 700)
  v(1.5em)
  it
  v(0.5em)
}
#show heading.where(level: 2): it => {
  set text(font: heading-fonts, size: 14.5pt, weight: 650)
  v(1em)
  it
  v(0.5em)
}
#show heading.where(level: 3): it => {
  set text(font: heading-fonts, size: 12.5pt, weight: 650)
  v(1em)
  it
  v(0.5em)
}
#show heading.where(level: 4): it => {
  set text(font: heading-fonts, size: 11.5pt, weight: 600)
  v(1em)
  it
  v(0.5em)
}

#let horizontalrule = [
  #line(start: (25%, 0%), end: (75%, 0%), stroke: 0.6pt + gray)
]

// Cover page (moved to separate file)
#import "content/cover.typ": cover
#cover(
  title: [Inter-Planetary Content Delivery],
  subtitle: [Technical Whitepaper],
  tagline: [A Paradigm Shift in Decentralized, Client-Driven Content Distribution],
  // To include logo, set logo to a path like "/assets/image/neova-logo.png"
  logo: "/assets/logo/logo_neova.svg",
  authors: [Bréval LE FLOCH from NEOVA],
  date: [October 7, 2025],
  version: [Draft 1.1],
)
#pagebreak()

// Table of Contents
#outline(title: [Table of Contents], depth: 2)
#pagebreak()


= Part 1: Strategic Context

== Executive Summary

In an era where modern infrastructure is paramount, the chasm between decentralized storage and high-performance content delivery remains a critical bottleneck to mass adoption. This paper introduces #gls("ipcd") (Inter-Planetary Content Delivery), a free and open-source protocol put forward by Neova to bridge this gap. #gls("ipcd") transforms Neova’s robust decentralized storage network into an intelligent, native Content Delivery Network (CDN) by shifting the paradigm of network routing from a centralized server-side model to a dynamic, client-driven one. By allowing clients to algorithmically benchmark and select the optimal data retrieval path in real-time, #gls("ipcd") fundamentally enhances performance, fortifies network resilience, and actualizes the promise of true decentralization. This document elucidates the strategic context, architectural blueprint, and technical specifications of #gls("ipcd") - a core innovation designed to position Neova as the definitive backbone of tomorrow’s verifiable internet.



== Why This Matters <why-this-matters>
The world runs on the cloud. Every photo streamed, every document shared, every video watched depends on infrastructure that has quietly become the backbone of the global economy. By 2032, cloud and storage services will represent a market approaching #emph[\$840 billion].

But today’s cloud comes with a hidden cost: it’s owned and controlled by a handful of giants. Their systems scale, but they also create single points of failure, expose users to censorship and exploitation, and keep true data ownership out of reach.

The internet of the future cannot be built on such a fragile foundation.

== Where Decentralization Stands Today <where-decentralization-stands-today>
Decentralized Physical Infrastructure Networks (DePIN) promise a safer, fairer, more resilient alternative. They already excel at storage: data can be split, encrypted, and distributed globally. But there’s one critical gap that has held them back from competing with Web2: #emph[fast, reliable delivery.]

In other words, getting data into the network is solved. Getting it #emph[out] at high speed - to millions of people, anywhere in the world - is not.

This is the "last-mile problem."

== Neova’s Answer <neovas-answer>
Neova was designed from the ground up to close this gap. It’s more than a protocol - it’s a decentralized cloud ecosystem that blends three powerful elements:

- #emph[Peer-to-Peer Infrastructure:] From enterprise servers to Raspberry Pi devices, anyone can contribute capacity and earn `$NEOV` rewards. The network scales itself.
- #emph[IPFS at the Core:] Every file is secured by cryptographic hashing, content addressing, and end-to-end encrypted, ensuring data integrity and efficiency.
- #emph[Enterprise-Grade Security:] Identity, encryption, and key management are integrated from the start, giving users privacy and sovereignty without extra complexity.

On top of this foundation, Neova already powers products like #emph[NeoDrive] (a decentralized storage alternative to Google Drive) and is soon launching #emph[NeoSign] (a secure signing solution). These tools show how Web3 can feel as simple as Web2 - but without compromise.

#pagebreak()
== The Breakthrough: IPCD <the-breakthrough-ipcd>
The missing piece was delivery. That’s where #gls("ipcd") comes in.

Traditional CDNs work like traffic cops: a central authority decides which server gives you your data. This model is fast, but it’s also a bottleneck, centralized by definition, and reliant on BGP routing controlled by a handful of major players, creating a kind of "BGP mafia".

#gls("ipcd") flips the script. Instead of a server deciding for you, #emph[your device becomes its own intelligent routing agent.]

Here’s the simple version:

+ You request a file. Neova’s backend gives you a list of verified providers that host it.
+ Your device pings them all in real time - like checking which datahouse can ship fastest to your door.
+ It chooses the best route and connects directly. No middleman, no lag.

== Why This Changes the Game <why-this-changes-the-game>
- #emph[Performance that competes with Web2:] Videos can stream instantly. Files open fast. Enterprises can rely on speed.
- #emph[Resilience by design:] If one provider slows down, your client instantly reroutes to another. Outages stop being outages.
- #emph[True decentralization:] Routing decisions happen at the edge, on the client side. No one can censor or intercept.
- #emph[Value that compounds:] Storage alone is passive. With #gls("ipcd"), Neova becomes a living, breathing delivery network. The utility - and thus the value - of the ecosystem and its token grows exponentially.

== The Big Picture <the-big-picture>
With #gls("ipcd"), Neova doesn’t just store data. It delivers it - securely, privately, and at scale.

This elevates Neova from "a decentralized storage solution" to a #emph[complete decentralized cloud platform] ready for enterprise adoption and mass market use.

#horizontalrule
#pagebreak()

= Part 2: Technical Specification

== Overview <overview>
This document provides the technical specification for #gls("ipcd") (Inter-Planetary Content Delivery), a client-driven performance optimization protocol for the Neova network. #gls("ipcd") leverages Neova’s P2P provider network as a decentralized CDN fabric. It defines a protocol wherein a client, upon receiving a candidate set of provider nodes from a central metadata service, executes performance benchmarks (e.g., latency, throughput) to algorithmically determine the optimal data delivery path. This specification details the architecture, protocol flow, cryptographic models, data schemas, and integration with existing Neova components, notably the Go-based `Superviseur` service resident on each provider node. The protocol is designed to be incrementally implementable within the existing Neova ecosystem.

== Architectural Framework & Components <architectural-framework-components>
#gls("ipcd") integrates seamlessly into Neova’s existing microservices architecture, orchestrating three primary actors:

- #emph[Metadata Server (Neova Backend):] A core Neova service that maintains a real-time registry of provider nodes, their cryptographic identities, operational status, reputation scores, and a mapping of the Content Identifiers (CIDs) they host. In the #gls("ipcd") protocol, its function is to serve a filtered, pre-optimized list of candidate nodes to the client.
- #emph[Provider Node (Storage & Distribution Layer):] A P2P network participant running the Neova provider stack, which includes #emph[IPFS Kubo], #emph[IPFS Cluster], and the #emph[`Superviseur`] Go service. Its role within #gls("ipcd") is to store encrypted data blocks, respond to client-initiated performance probes, and serve content requests via IPFS’s Bitswap protocol. Due to the nature of IPFS, content is replicated across multiple nodes, ensuring redundancy and high availability.
- #emph[Smart Client (Intelligence Layer):] A software module (SDK) embedded within Neova’s native applications (e.g., #emph[NeoDrive]) and offered through its IaaS/STaaS API solutions. It is responsible for orchestrating the entire #gls("ipcd") selection process: requesting the candidate list, executing the benchmark, applying the selection algorithm, and managing the resilient data transfer.

#figure(
  image("/assets/schema/image/s1.png"),
  caption: [
    IPCD High-Level Actor Architecture. The Smart Client requests a candidate node list from the Neova Metadata Server, probes provider nodes (IPFS + Superviseur) for performance, and downloads from the optimal node directly.
  ],
)

== Detailed Protocol & Data Flow <detailed-protocol-data-flow>
The end-to-end data retrieval sequence under the #gls("ipcd") protocol is a multi-stage, orchestrated process designed for security and performance.

+ #emph[Authentication & Key Retrieval:] The user authenticates via #emph[Keycloak]. Concurrently, the Smart Client securely fetches the file’s decryption key from a #emph[Hashicorp Vault] instance, ensuring a zero-knowledge architecture from the perspective of the infrastructure.

+ #emph[Candidate Set Acquisition:] The Smart Client issues a secure API call to the Neova Metadata Server (e.g., `GET /api/v1/content/{cid}/nodes`). The server returns a JSON object containing a list of `multiaddrs` for provider nodes known to host the requested content. This list is pre-filtered by the backend based on node reputation, historical uptime, and other metrics reported by each node’s `Superviseur` service.

+ #emph[Client-Side Benchmarking:] The Smart Client initiates parallel performance probes to the candidate nodes.

  - #emph[Primary Mechanism:] The client leverages libp2p’s standard ping protocol (`/ipfs/ping/1.0.0`) to measure round-trip time (RTT). The Neova ecosystem utilizes an optimized tool, `peeng`, for this purpose, designed for efficient, concurrent probing of IPFS peers.
  - #emph[Advanced Mechanism:] For more sophisticated scoring, the client may initiate a "mini-handshake" by requesting a single, small data block to derive a combined metric of latency and initial throughput.

+ #emph[Optimal Node Selection & Load Balancing Strategy:] The client applies a configurable scoring algorithm to rank the nodes.

  - #emph[Latency-First:] Prioritizes the lowest RTT, optimal for small files and interactive applications. Score = 1/RTT.
  - #emph[Hybrid Scoring:] A weighted function balancing latency and throughput for general-purpose use.
  - The node with the highest score is selected as the primary source.

+ #emph[Resilient Data Transfer:] The Smart Client initiates a direct P2P connection to the chosen provider node(s) to fetch the encrypted data blocks via the IPFS #emph[Bitswap] protocol. The process incorporates several resilience mechanisms:

  - #emph[Automatic Fallback:] If the primary node becomes unresponsive, the client seamlessly retries with the next-best node from the ranked list.
  - #emph[Adaptive Switching:] The SDK continuously monitors transfer performance. If conditions degrade, it can migrate the session to a better-performing node mid-transfer.
  - #emph[Multi-Source Fetching:] For large files, the client can segment the download across the top 2-3 performing nodes simultaneously, maximizing bandwidth utilization.

+ #emph[Client-Side Decryption & Verification:] Upon successful download, the Smart Client performs two final actions:

  - #emph[Integrity Verification:] The client cryptographically verifies the integrity of the received (encrypted) data by hashing it and comparing the result to the requested CID. This is an intrinsic security guarantee of IPFS.
  - #emph[Decryption:] The client uses the key retrieved from Hashicorp Vault to decrypt the data locally in memory, making the plaintext file available to the user.

== Cryptographic & Security Architecture <cryptographic-security-architecture>
#gls("ipcd")’s security model is multi-layered, leveraging the cryptographic primitives of the underlying Neova and IPFS architecture.

- #emph[Data Integrity:] Content-addressing via IPFS CIDs provides absolute data integrity. Any alteration of the data in transit would result in a different CID, causing the client-side verification to fail.
- #emph[Data Confidentiality:] End-to-end encryption ensures that all data stored on and traversing the provider network is opaque. Decryption keys are managed by an enterprise-grade secrets management system (#gls("hashicorp-vault")) and are accessible only to the authenticated user, enforcing a zero-knowledge policy for the infrastructure.
- #emph[Provider Authentication & Sybil Resistance:] Each provider node possesses a cryptographic identity tied to its IPFS Cluster private key. This identity is used to sign a registration payload containing its EVM address, proving ownership to the Neova backend. This, combined with Neova’s economic model of rewards and #emph[slashing], creates a strong disincentive for malicious behavior (e.g., Sybil attacks) by enforcing financial penalties for non-compliance.
- #emph[Secure Transport:] All P2P communication is conducted over secure channels established using protocols like Noise or TLS 1.3, as provided by the libp2p stack, protecting against eavesdropping and tampering.

== Node Connectivity & Firewalls <node-connectivity-firewalls>
A significant challenge in P2P networks is ensuring nodes can communicate with each other, especially when they are located behind NATs or firewalls. Neova nodes will incorporate several mechanisms to ensure robust connectivity:

- #emph[UPnP & NAT-PMP:] Nodes will attempt to automatically configure port forwarding on compatible routers using UPnP or NAT-PMP. This allows direct connections from other peers without manual router configuration.
- #emph[Hole Punching:] For situations where automatic port forwarding is not possible, nodes will use STUN servers to discover their public IP and port, and then use "hole punching" techniques to establish direct connections through NATs.
- #emph[Relay Fallback:] When a direct connection cannot be established, communication will be relayed through another publicly reachable peer. While this adds latency, it ensures that even heavily firewalled nodes can participate in the network.

= Conclusion <conclusion>
#gls("ipcd") is more than an optimization; it is a foundational technology that completes Neova’s vision for a fully decentralized cloud. By architecting an intelligent, client-driven CDN layer, Neova solves the critical "last-mile" performance problem that has hindered the widespread adoption of decentralized infrastructure. This innovation not only delivers a superior user experience but also enhances the economic value and technical defensibility of the entire Neova ecosystem. IPCD represents a generalizable paradigm for decentralized content delivery, positioning Neova at the forefront of the next generation of internet infrastructure.

#set heading(numbering: none)
#pagebreak()
#print-paper-glossary(show-all: true)

// Bibliography / References
#pagebreak()
#show outline: set heading(numbering: none)
#outline(title: [List of Figures], target: figure.where(kind: image))
#pagebreak()
#bibliography("references.bib", title: [References], style: "ieee", full: true)
