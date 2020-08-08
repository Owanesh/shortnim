let doc = """
Shortnim ✂️ 🔗                                


Usage:
  shortnim relink <url>
  shortnim cleanuri <url>
  shortnim --provider <service> <url>
  shortnim [options]

Options:
  -p --provider Define which provider you want use.
  -h --help     Show this screen.
  -v --version  Show version.
"""

import strutils, sequtils
import docopt
import providers/[cleanuriProvider, relinkProvider]

let args = docopt(doc, version = "shortnim 0.1a")
let supported_provider = ["relink","cleanuri"]

 

if args["--provider"] and ($args["--provider"] in supported_provider):
  case $args["--provider"]:
    of "relink":
      relink($args["<url>"])
    of "cleanuri":
      cleanuri($args["<url>"])

elif args["--provider"] and ($args["--provider"] notin supported_provider):
  echo "Sorry, provider ", $args["--provider"], " isn't supported yet"


