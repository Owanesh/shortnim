const provider_domain = "https://rel.ink/"
const api_path = "api/links/"
import httpclient, json

proc relink*(url: string) = 
  let client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/json" })
  let body = %*{
      "url": url
  }
  let response = client.request((provider_domain&api_path), httpMethod = HttpPost, body = $body)
  echo "✂️  Your link now is avaiable at ", (provider_domain & parseJson($response.body){"hashid"}.getStr())