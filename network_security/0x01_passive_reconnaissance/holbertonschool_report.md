# Holberton School – Shodan Passive Reconnaissance Report

**Date of Scan:** 2025-08-12  
**Search Engine:** [Shodan](https://www.shodan.io/)  
**Search Query:** `holbertonschool.com`  
**Total Results Found:** 2

---

## 1. IP Ranges / Hosts Found

| IP Address      | Hostnames                                                                                       | Organization                    | Country | City  |
|-----------------|-------------------------------------------------------------------------------------------------|---------------------------------|---------|-------|
| 35.180.27.154   | `ec2-35-180-27-154.eu-west-3.compute.amazonaws.com`                                             | Amazon Data Services France     | France  | Paris |
| 52.47.143.83    | `ec2-52-47-143-83.eu-west-3.compute.amazonaws.com`, `yriry2.holbertonschool.com`                | Amazon Data Services France     | France  | Paris |


**IP Ranges:**  
Both IPs are hosted in AWS' `eu-west-3` (Paris) region. Likely range:  
- `52.47.0.0/16` (AWS Paris)  
- `35.180.0.0/16` (AWS Paris)  

---

## 2. Ports & Services

| Port | Count | Protocol | Notes                    |
|------|-------|----------|--------------------------|
| 80   | 1     | HTTP     | Redirects to main domain |
| 443  | 2     | HTTPS    | SSL/TLS present          |
---

## 3. Technologies & Frameworks Detected

### 3.1 Web Server
- **nginx** (on multiple hosts)
- Version observed: `nginx/1.18.0 (Ubuntu)`

### 3.2 Operating System
- **Ubuntu**

### 3.3 SSL/TLS
- **Issuer:** Let's Encrypt
- **Issued To:** `yriry2.holbertonschool.com`
- **Supported Versions:** TLSv1.3

### 3.4 Tags from Shodan
- `eol-product` (End-of-life software detected on some hosts)

---

## 4. HTTP Banners

**Host:** `52.47.143.83:443`  
```
HTTP/1.1 200 OK
Server: nginx
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 0
X-Content-Type-Options: nosniff
X-Download-Options: noopen
```
**Host:** `35.180.27.154:443`  
```
HTTP/1.1 301 Moved Permanently
Server: nginx/1.18.0 (Ubuntu)
Location: [http://holbertonschool.com](http://holbertonschool.com)
```
**Host:** `35.180.27.154:80`  
```
HTTP/1.1 301 Moved Permanently
Server: nginx/1.18.0 (Ubuntu)
Location: [http://holbertonschool.com](http://holbertonschool.com)
```

---

## 5. Observations

- AWS EC2 instances in **Paris, France** (Amazon Data Services France).
- SSL certificates configured with modern TLS versions (v1.3).
- `eol-product` tag indicates potential outdated software (nginx or Ubuntu version might be at end-of-life).
- Multiple subdomains point to the same AWS infrastructure.

---

## 6. Recommendations

- Upgrade any **end-of-life software** to maintain security.
- More shodan analysis to avoid exposure.
- HTTP Requests to modify for more security
---
