# e-Learnio App

## Requirements

* Docker
* Docker Compose

## Setup

Create local environment if not already created.

```
POSTGRES_PASSWORD=$(openssl rand -hex 32)

cat > .postgres.env <<_EOF
POSTGRES_PASSWORD=$POSTGRES_PASSWORD
_EOF

cat > .app.env <<_EOF
DB_DEV_URL=postgres://postgres:$POSTGRES_PASSWORD@postgres/elearnio-app-dev
DB_TEST_URL=postgres://postgres:$POSTGRES_PASSWORD@postgres/elearnio-app-test
_EOF
```

Start containers

```
docker-compose up
```

## Usage

List courses

```
curl http://localhost:3000/api/v1/courses | jq .
curl http://localhost:3000/api/v1/courses/4 | jq .
```

List courses with filter

```
curl 'http://localhost:3000/api/v1/courses?filter\[self_assignable\]=true' | jq .
```

Create a resource

```
curl -i -H "Accept: application/vnd.api+json"
  -H 'Content-Type:application/vnd.api+json'
  -X POST -d '{"data": {"type":"courses", "relationships": { "coach": { "data": { "type": "coaches", "id": "1" }}}, "attributes":{"name":"Test Course", "self_assignable": true}}}' http://localhost:3000/api/v1/courses

```
