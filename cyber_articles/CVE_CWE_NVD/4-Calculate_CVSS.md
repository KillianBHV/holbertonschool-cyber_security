# Calculate and Interpret a CVSS v3.1 Base Score (RCE in Web Server)

## Scenario Summary

A **remote code execution (RCE)** vulnerability exists in a widely used web server. An attacker can **execute arbitrary code remotely** and **does not need authentication**.

This is typically one of the most severe vulnerability types because it can lead to full system compromise.

## Relevant CVSS v3.1 Base Metrics (from the scenario)

- **Attack Vector (AV):** Network (N)  
- **Attack Complexity (AC):** Low (L)  
- **Privileges Required (PR):** None (N) *(no authentication required)*  
- **User Interaction (UI):** None (N)  
- **Scope (S):** Unchanged (U) *(impact remains within the same security authority)*  

Impact metrics (required to compute the Base Score):
- **Confidentiality (C):** High (H)  
- **Integrity (I):** High (H)  
- **Availability (A):** High (H)  

> Note: The provided “example” metrics mention PR/UI as “Required”, but that conflicts with the scenario (“without requiring authentication”). The calculation below follows the scenario’s details.

## CVSS v3.1 Vector String

`CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H`

## Base Score Calculation (CVSS v3.1)

Using the CVSS v3.1 Base Score formula and metric weights from the official documentation: :contentReference[oaicite:0]{index=0}

### 1) Exploitability Sub-Score

Exploitability = `8.22 × AV × AC × PR × UI`

- AV:N = 0.85
- AC:L = 0.77
- PR:N (Scope Unchanged) = 0.85
- UI:N = 0.85

Exploitability ≈ `8.22 × 0.85 × 0.77 × 0.85 × 0.85` ≈ **3.89**

### 2) Impact Sub-Score

ISS = `1 − (1 − C) × (1 − I) × (1 − A)`

- C:H = 0.56
- I:H = 0.56
- A:H = 0.56

ISS ≈ `1 − (0.44 × 0.44 × 0.44)` ≈ **0.9148**

Impact (Scope Unchanged) = `6.42 × ISS` ≈ `6.42 × 0.9148` ≈ **5.87**

### 3) Base Score

Base Score (S:U) = `RoundUp( min(Impact + Exploitability, 10) )`

Impact + Exploitability ≈ `5.87 + 3.89` ≈ **9.76**  
RoundUp to one decimal → **9.8**

## Severity Level

A CVSS Base Score of **9.8** corresponds to **Critical** severity (9.0–10.0). :contentReference[oaicite:1]{index=1}

## Implications for an Organization’s Security Posture

A **Critical, unauthenticated network RCE** implies:

- High likelihood of **rapid compromise** at scale (internet-facing targets are especially exposed)
- Potential for **full takeover**, data theft, service disruption, and lateral movement
- Strong justification for **emergency change windows** and accelerated patch cycles

## Recommended Mitigation Strategies (aligned to the metrics)

Given AV:N, AC:L, PR:N, UI:N (easy remote exploitation):

- **Immediate patching / upgrade** to a fixed version (highest priority)
- **Reduce exposure**: restrict access (firewall/ACLs), remove public access if not required
- **Compensating controls (short-term)**:
  - WAF or reverse-proxy rules to block exploit patterns (virtual patching)
  - Disable the vulnerable feature/module if possible
- **Detection and response**:
  - Add monitoring for exploitation attempts (logs, IDS/IPS signatures)
  - Hunt for indicators of compromise if the service was exposed
- **Hardening**:
  - Least privilege for the service account
  - Segmentation to limit post-exploitation impact

## Reference

You can verify the same score using the official :contentReference[oaicite:2]{index=2} CVSS v3.1 calculator. :contentReference[oaicite:3]{index=3}
