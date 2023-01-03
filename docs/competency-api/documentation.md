---
layout: default
title: Documentation
nav_order: 1
parent: Condition
grand_parent: Competency API
---
# Documentation

## Description
These routes are used to create (post) and update (patch) documentation in the Condition section of a competency. Both routes use the same headers and request body

### Headers for post and patch:
```json
{
    Authorization: "Bearer Example.bearer.token"
}
```

## Create Route

#### post:
```http
https://api.competency-constructor.clark.center/competencies/:competencyId/documentation
```

## Update Route

#### patch:
```http
https://api.competency-constructor.clark.center/competencies/:competencyId/documentation/:documentationId
```

### Request for Create and Update

| Name | Required | Type | Description |
|:----:|:-----:|:----:|-----|
| description | false | string | Description of the resource being linked too |
| uri | false | string | Uri where the resource can be found |

<details closed markdown="block">
  <summary>
    Example
  </summary>

### Example Http request body for Create and Update
```json
{
    body: {
        description: "This is an example of a website.",
        uri: "https://www.example.com"
    }
}
```

### Example Curl request
```bash
curl -X PATCH \
  -H "Content-Type: application/json" \
  -H "Authorization": "Bearer Example.bearer.token" \
  -d '{ description: "This is an example of a website.", uri: "https://www.example.com" }' \
  -L "https://api.competency-constructor.clark.center/competencies/6112745b84804cf5833aa94c/documentation"
```

</details>

### Response codes for Create and Update

| Name | Description |
|:----:|----|
| 201(create) 204(update) | Success |
| 400 | Competency is deprecated, rejected, or published and cannot be updated. Or body is incorrectly formatted. |
| 401 | Not Authenticated  |
| 403 | User does not have permissions to update fields of the competency |
| 404 | Competency not found |


## Delete:

### Description
Delete documentation works differently than most of the other routes. Instead of sending a list of documentation Id's in the request body, you must send them as a list of query parameters

#### delete all:
```http
https://api.competency-constructor.clark.center/competencies/:competencyId/documentation
```

#### delete one:
```http
https://api.competency-constructor.clark.center/competencies/:competencyId/documentation?ids=:documentationId
```

#### delete multiple:
```http
https://api.competency-constructor.clark.center/competencies/:competencyId/documentation?ids=:documentationId,:documentationId,:documentationId
```

### Query Params

| Name | Required | Type | Description |
|:----:|:-----:|:----:|-----|
| ids| false | Object Id: string | Comma separated list of documentation object ids |


{: .warning }
>Sending no query params will delete all documentation associated with this competency

### Response

| Name | Description |
|:----:|----|
| 201 | Documentation Successfully deleted |
| 400 | Competency is deprecated, rejected, or published and cannot be updated. Or body is incorrectly formatted. |
| 401 | Not Authenticated  |
| 403 | User does not have permissions to update fields of the competency |
| 404 | Competency or Documentation not found |