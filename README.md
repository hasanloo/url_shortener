# UrlShortener

A URL shortener implemented with Elixir and Phoenix framework.

## Installation

To setup this application you need to have `docker` and `docker-compose` installed.

* Build containers with `docker-compose build`
* Run containers with `docker-compose up`

And now you can use the application at `localhost:4000`.

## Usage

Available routes:

HTTP method | Route                  | Description
----------- | ---------------------- | -------------------------
POST        | /api/link              | Create short code for URL
GET         | /r/:short_code         | Redirect to url

#### Examples

##### Request

```
curl -X POST -H "Content-Type: application/json" -d '{"url":"http://example.com/about/index.html?uid=123"}' 'http://127.0.0.1:4000/api/link'
```

##### Response
```
200 OK
{"link":"http://localhost:4000/r/N1B173c1", "status":"success"}
```

##### Request

```
curl -X GET 'http://127.0.0.1:4000/r/N1B173c1'
```

##### Response
```
302 Found
location: http://example.com/about/index.html?uid=123
```


