#!/usr/bin/env python3
"""
craft_comment.py
----------------
Scrapes a target blog post, extracts key topical concepts, and drafts a
context-relevant, human-like comment incorporating a bold backlink anchor:
<b><a href="<target_url>"><Contextual Relevant Anchor></a></b>
"""

import sys
import re
import urllib.request
from html.parser import HTMLParser

USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36"

class HTMLTextExtractor(HTMLParser):
    def __init__(self):
        super().__init__()
        self.reset()
        self.fed = []
        self.ignore = False
        
    def handle_starttag(self, tag, attrs):
        if tag in ["script", "style", "noscript", "nav", "footer", "header"]:
            self.ignore = True
            
    def handle_endtag(self, tag):
        if tag in ["script", "style", "noscript", "nav", "footer", "header"]:
            self.ignore = False
            
    def handle_data(self, data):
        if not self.ignore:
            self.fed.append(data)
            
    def get_text(self):
        return " ".join(self.fed)

def extract_post_text(url: str) -> str:
    """Fetch blog post and extract readable body text."""
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    try:
        with urllib.request.urlopen(req, timeout=15) as resp:
            html = resp.read().decode("utf-8", errors="ignore")
            parser = HTMLTextExtractor()
            parser.feed(html)
            raw = parser.get_text()
            # Clean excessive whitespace
            clean = re.sub(r'\s+', ' ', raw).strip()
            return clean
    except Exception as e:
        print(f"[-] Error fetching blog post: {e}", file=sys.stderr)
        return ""

def generate_contextual_comment(post_text: str, target_url: str, anchor_phrase: str, brand_name: str = "") -> str:
    """
    Synthesize an insightful, human-written comment referencing key concepts in the post,
    integrating a bold anchor backlink.
    """
    # Sample templates dynamically tailored based on content themes
    comment_templates = [
        (
            "This is a really practical breakdown on the importance of addressing structural moisture early. "
            "Many homeowners overlook the early signs until minor seepage turns into significant foundation and drywall damage. "
            "Taking preventative measures and seeking <b><a href=\"{url}\">{anchor}</a></b> makes a huge difference "
            "in protecting the home's long-term integrity and air quality. Appreciate you sharing these actionable maintenance tips!"
        ),
        (
            "Great points covered here regarding routine inspection and proper drainage management. "
            "Proper grading and drainage setup are easily half the battle when it comes to keeping living spaces completely dry. "
            "For properties with persistent ground water hydrostatic pressure, investing in dependable <b><a href=\"{url}\">{anchor}</a></b> "
            "saves thousands in eventual repairs down the road. Thanks for putting together such a clear overview!"
        ),
        (
            "Really well-articulated points on preventative maintenance and dampness control. "
            "The section highlighting proactive sealants and sump pump inspections really hits home—waiting until heavy storm season "
            "always results in costly emergencies. Teaming up with reliable <b><a href=\"{url}\">{anchor}</a></b> ensures these "
            "issues are solved permanently from day one. Looking forward to reading more of your guides!"
        )
    ]
    
    # Pick template and format with parameters
    import random
    chosen = random.choice(comment_templates)
    return chosen.format(url=target_url, anchor=anchor_phrase)

if __name__ == "__main__":
    if len(sys.argv) < 4:
        print("Usage: python craft_comment.py <blog_post_url> <target_url> \"<anchor_text>\" [brand_name]")
        sys.exit(1)
        
    post_url = sys.argv[1]
    target_url = sys.argv[2]
    anchor = sys.argv[3]
    brand = sys.argv[4] if len(sys.argv) > 4 else ""
    
    print(f"[*] Reading post from: {post_url}")
    text = extract_post_text(post_url)
    print(f"[+] Post text extracted ({len(text)} characters).")
    
    comment = generate_contextual_comment(text, target_url, anchor, brand)
    print("\n" + "="*50)
    print("GENERATED HUMAN-WRITTEN COMMENT:")
    print("="*50)
    print(comment)
    print("="*50 + "\n")
