flowchart TD
  A[Collect coursebooks + .tex] --> B[Extract LOs per module]
  B --> C[Map LOs → study‐guide sections]
  C --> D{Any LO gaps?}
  D -- yes --> D1[Create missing-content TODOs]
  D -- no --> E[Deep fact‐check v.s.\\ coursebook + DAU]
  E --> F[Cross‐check Navy overlays (SECNAV/OPNAV/NAVSEA)]
  F --> G{Flow/logic issues?}
  G -- yes --> G1[Propose re-sequencing & edits]
  G -- no --> H[Compile defect log + coverage matrix]
  H --> I[Return fixes + citations package]
