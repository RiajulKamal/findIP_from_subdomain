# findIP.sh

Resolve a list of sub-domains to their first IPv4 address and save the results to `iplist.txt`.

---

## 📑 What this script does
1. **Validates input** – Requires a text file containing sub-domain (or URL) per line.  
2. **Cleans the domain** – Strips any leading `http://` or `https://`.  
3. **Performs DNS look-ups** – Uses `dig` to grab the first A record (IPv4).  
4. **Stores the output** – Writes every successfully-resolved IP to `iplist.txt`.

---

## 🛠 Prerequisites
| Tool | Why you need it | Install (Linux) |
|------|-----------------|-----------------|
| `bash` | Script runtime | _Usually pre-installed_ |
| `dig`  | DNS queries    | `sudo apt install dnsutils` <br>or<br> `sudo dnf install bind-utils` |

---

# 🚀 Usage

## 1. Save the script
###
    curl -O https://raw.githubusercontent.com/RiajulKamal/findIP_from_subdomain/refs/heads/main/findIP.sh

## 2. Make it executable
###
    chmod +x findIP.sh

## 3. Run it with a file that lists your sub-domains
###
    ./findIP.sh YourSubdomainList.txt
