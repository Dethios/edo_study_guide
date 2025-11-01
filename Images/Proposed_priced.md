```mermaid
%%{init: {
  "theme":"base",
  "themeVariables":{
    "primaryColor":"#E6F2FA",
    "primaryTextColor":"#0A2A43",
    "primaryBorderColor":"#1F6AA5",
    "lineColor":"#1F6AA5",
    "tertiaryColor":"#F4F7FA",
    "fontSize":"14px"
  }
}}%%
flowchart TD
  classDef title     fill:#CFE8FF,stroke:#1F6AA5,stroke-width:2px,color:#0A2A43,rx:6,ry:6;
  classDef group     fill:#E6F2FA,stroke:#1F6AA5,stroke-width:2px,color:#0A2A43,rx:6,ry:6;
  classDef leaf      fill:#FFFFFF,stroke:#6AA2D9,stroke-width:1.5px,color:#0A2A43,rx:6,ry:6;
  classDef diamond   fill:#FFF9E6,stroke:#C99500,stroke-width:2px,color:#0A2A43;

  A["**Proposed Price = Cost + Profit (or Fee)**"]:::title
  B["**Cost**<br/><span style='font-size:12px'>(Cost Elements)</span>"]:::title
  C{"**Profit (or Fee)**"}:::diamond

  A --> B
  A --> C

  %% Left column: Cost breakdown
  subgraph DC[ ]
    direction TB
    D["**Direct Costs**<span style='font-size:12px'> *</span>"]:::group
    E["<div style='text-align:left'><b>Direct Material</b><br/>– Raw Material<br/>– Purchased Parts<br/>– Subcontracts</div>"]:::leaf
    F["<div style='text-align:left'><b>Direct Labor</b><br/>– Engineering<br/>– Manufacturing</div>"]:::leaf
    G["<div style='text-align:left'><b>Other Direct Costs (ODCs)</b><br/>– Travel<br/>– Tooling</div>"]:::leaf
    D --> E & F & G
  end

  subgraph IC[ ]
    direction TB
    H["**Indirect Costs**<span style='font-size:12px'> **</span>"]:::group
    I["<div style='text-align:left'><b>Overhead (OH)</b><br/>– Material Handling<br/>– Engineering<br/>– Manufacturing</div>"]:::leaf
    J["<div style='text-align:left'><b>General &amp; Administrative (G&amp;A)</b><br/>Expenses</div>"]:::leaf
    H --> I & J
  end

  B --> D
  B --> H

  %% Right column: Profit v.s.\\ Fee
  K["**Profit**<br/><span style='font-size:12px'>DFARS 215.404-70 to -73<br/>Application of the DoD Weighted Guidelines</span>"]:::leaf
  L["**Fee**<br/><span style='font-size:12px'>DFARS 215.404-74 &amp; -75</span>"]:::leaf
  C --> K
  C --> L

  %% Footnotes (as small notes at bottom)
  M["<span style='font-size:12px'>* Direct Cost: Any cost identified with a particular final cost objective.</span>"]:::leaf
  N["<span style='font-size:12px'>** Indirect Cost: Any cost not identified with a single final objective, but with two or more final cost objectives.</span>"]:::leaf

  %% Layout: place footnotes below left column
  G --- M
  M --- N
