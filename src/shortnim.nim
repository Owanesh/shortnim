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
import regex
import docopt
import providers/[cleanuriProvider, relinkProvider]

let args = docopt(doc, version = "shortnim 0.1")
let supported_provider = ["relink","cleanuri"]
var url_pattern = re"((([A-Za-z]{3,9}:(?:\/\/)?)(?:[\-;:&=\+\$,\w]+@)?[A-Za-z0-9\.\-]+|(?:www\.|[\-;:&=\+\$,\w]+@)[A-Za-z0-9\.\-]+)((?:\/[\+~%\/\.\w\-_]*)?\??(?:[\-\+=&;%@\.\w_]*)#?(?:[\.\!\/\\\w]*))?)" 

if args["<url>"] and not match($args["<url>"], url_pattern) :
  echo "[ERR] Your url ", $args["<url>"], " does not appear correct for shortnim, make shure you have (http | https)"

elif args["--provider"] and ($args["--provider"] notin supported_provider):
  echo "[WARN] Provider ", $args["--provider"], " isn't supported yet"

elif args["relink"]:
  relink($args["<url>"])

elif args["cleanuri"]:
  cleanuri($args["<url>"])

elif args["--provider"] and ($args["--provider"] in supported_provider):
  case $args["--provider"]:
    of "relink":
      relink($args["<url>"])
    of "cleanuri":
      cleanuri($args["<url>"])

else:
  echo doc


