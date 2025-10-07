#import "@preview/glossarium:0.5.9": gls, glspl, make-glossary, print-glossary, register-glossary

// Centralized glossary entries for the IPCD whitepaper
#let entry-list = (
  (
    key: "ipcd",
    short: "IPCD",
    long: "Inter-Planetary Content Delivery",
    description: [Client-driven content delivery protocol in Neova that benchmarks provider nodes and selects optimal paths.],
    group: "Neova",
  ),
  (
    key: "neova",
    short: "Neova",
    long: "Neova Protocol",
    description: [Decentralized cloud ecosystem combining P2P providers, IPFS, and security primitives.],
    group: "Neova",
  ),
  (
    key: "ipfs",
    short: "IPFS",
    long: "InterPlanetary File System",
    description: [Content-addressed, peer-to-peer storage network using CIDs and Bitswap.],
    group: "Protocols",
  ),
  (
    key: "cid",
    short: "CID",
    long: "Content Identifier",
    description: [Cryptographic hash identifying content in IPFS; used for integrity checks.],
    group: "Protocols",
  ),
  (
    key: "bitswap",
    short: "Bitswap",
    long: "IPFS Bitswap protocol",
    description: [Block exchange protocol used by IPFS for content transfer.],
    group: "Protocols",
  ),
  (
    key: "libp2p",
    short: "libp2p",
    long: "libp2p networking stack",
    description: [Modular P2P networking library providing transports, security (Noise/TLS), and ping.],
    group: "Protocols",
  ),
  (
    key: "iaas",
    short: "IaaS",
    long: "Infrastructure as a Service",
    description: [A cloud computing model where virtualized computing resources are provided over the internet.],
    group: "Concepts",
  ),
  (
    key: "staas",
    short: "STaaS",
    long: "Storage as a Service",
    description: [A business model where a company leases or rents its storage infrastructure to another company or individuals.],
    group: "Concepts",
  ),
  (
    key: "peeng",
    short: "peeng",
    long: "peeng (libp2p ping tool)",
    description: [Optimized tool to measure RTT to IPFS/libp2p peers concurrently.],
    group: "Tools",
  ),
  (
    key: "superviseur",
    short: "Superviseur",
    long: "Neova Superviseur service",
    description: [Go service running on provider nodes for monitoring, reporting, and control.],
    group: "Neova",
  ),
  (
    key: "depin",
    short: "DePIN",
    long: "Decentralized Physical Infrastructure Network",
    description: [Networks that incentivize deployment of real-world infrastructure (storage, compute, bandwidth).],
    group: "Concepts",
  ),
  (
    key: "cdn",
    short: "CDN",
    long: "Content Delivery Network",
    description: [Distributed network of servers that deliver content with low latency; typically centralized in Web2.],
    group: "Concepts",
  ),
  (
    key: "rtt",
    short: "RTT",
    long: "Round-Trip Time",
    description: [Latency metric measuring time for a ping to go and back.],
    group: "Metrics",
  ),
  (
    key: "keycloak",
    short: "Keycloak",
    long: "Keycloak",
    description: [Open-source identity and access management used for authentication.],
    group: "Security",
  ),
  (
    key: "hashicorp-vault",
    short: "Hashicorp Vault",
    long: "Hashicorp Vault",
    description: [An enterprise-grade secrets management system used to retrieve decryption keys.],
    group: "Security",
  ),
  (
    key: "evm",
    short: "EVM",
    long: "Ethereum Virtual Machine",
    description: [Runtime environment for smart contracts; provider identities may link to EVM addresses.],
    group: "Security",
  ),
)

// Call during document setup to register the glossary entries
#let setup-glossary = () => {
  register-glossary(entry-list)
}

// Print the glossary with an optional flag to show all entries
#let print-paper-glossary = (show-all: true) => {
  heading(level: 2)[Glossary]
  print-glossary(
    entry-list,
    show-all: show-all,
    disable-back-references: true,
  )
}

// Note: Typst modules export top-level definitions by default; no explicit export directive needed.