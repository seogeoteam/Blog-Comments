#!/usr/bin/env python3
"""
search_blogs.py
---------------
Harvester for organic Blogspot/Blogger post URLs matching a target service/niche footprint.
Footprint standard: "blogspot" + "<service keyword>"
"""

import sys
import re
import urllib.parse
import urllib.request
import json

USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36"

def build_search_query(service_keyword: str) -> str:
    """Build the required Google search footprint string."""
    return f'"blogspot" + "{service_keyword}"'

def harvest_blogspot_urls(service_keyword: str, max_results: int = 10):
    query = build_search_query(service_keyword)
    print(f"[*] Searching for footprint: {query}")
    
    encoded = urllib.parse.quote_plus(query)
    # Using DuckDuckGo HTML / Bing / Google compatible query endpoint
    url = f"https://html.duckduckgo.com/html/?q={encoded}"
    
    req = urllib.request.Request(url, headers={
        "User-Agent": USER_AGENT,
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
    })
    
    results = []
    try:
        with urllib.request.urlopen(req, timeout=15) as resp:
            html = resp.read().decode("utf-8", errors="ignore")
            # Extract links with blogspot.com
            found = re.findall(r'href="([^"]*blogspot\.com[^"]*)"', html, re.IGNORECASE)
            for link in found:
                # Resolve DDG redirect if present
                if "/l/?uddg=" in link:
                    actual = urllib.parse.unquote(link.split("uddg=")[1].split("&")[0])
                else:
                    actual = link
                
                # Filter for valid blog posts (ending with .html or year/month structure)
                if ".html" in actual and "search" not in actual and actual not in results:
                    results.append(actual)
                    if len(results) >= max_results:
                        break
    except Exception as e:
        print(f"[-] Search error: {e}", file=sys.stderr)
    
    return results

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python search_blogs.py \"<service keyword>\" [max_results]")
        sys.exit(1)
        
    keyword = sys.argv[1]
    limit = int(sys.argv[2]) if len(sys.argv) > 2 else 10
    
    urls = harvest_blogspot_urls(keyword, limit)
    print(f"[+] Found {len(urls)} target Blogspot URLs:")
    for i, u in enumerate(urls, 1):
        print(f"  {i}. {u}")
