---
layout: default
title: Documentation
nav_order: 1
parent: Condition
grand_parent: Competency API
---
# Documentation

## Description

### Headers for all requests
```json
{
    Bearer: "Bearer Example.bearer.token"
}
```

### Create

#### post:
```http
https://api.competency-constructor.clark.center/competencies/:competencyId/documentation
```

### Request

| Name | Required | Type | Description |
|:----:|:-----:|:----:|-----|
| description | false | string | Description of the resource being linked too |
| uri | false | string | Uri where the resource can be found |
| userId | true | Object Id: string | The userId matching the Bearer token |

<details closed markdown="block">
  <summary>
    Example
  </summary>
```json
{
    body: {
        description: "This is an example of a website.",
        uri: "https://www.example.com"
        userId: "aposjdfnpouapuofaou"
    }
}
```
</details>

### Response

| Name | Description |
|:----:|----|
| 201 | Documentation created successfully |
| 400 | Competency is deprecated, rejected, or published and cannot be updated. Or body is incorrectly formatted. |
| 401 | Not Authenticated  |
| 403 | User does not have permissions to update fields of the competency |
| 404 | Competency not found |