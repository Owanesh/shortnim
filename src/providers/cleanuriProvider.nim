const url_provider = "https://cleanuri.com/api/v1/shorten"
import httpclient, json

proc cleanuri*(url: string) = 
  let client = newHttpClient()
  client.headers = newHttpHeaders({ "Content-Type": "application/json" })
  let body = %*{
      "url": url
  }
  let response = client.request(url_provider, httpMethod = HttpPost, body = $body)
  echo "✂️  Your link now is avaiable at ", parseJson($response.body){"result_url"}.getStr()