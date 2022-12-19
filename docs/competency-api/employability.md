---
layout: default
title: Employability
nav_order: 6
parent: Competency API
---
# Employability

## Update Employability

### Description

#### patch:
```http
https://api.competency-constructor.clark.center/competencies/:competencyId/employability
```

### Headers
```json
{
    Bearer: "Bearer Example.bearer.token"
}
```

### Request

| Name | Required | Type | Description |
|:----:|:-----:|:----:|-----|
| details | true | string | Any performance factors which are important to the competency and not otherwise specified |
| userId | true | Object Id: string | The userId matching the Bearer token |

<details closed markdown="block">
  <summary>
    Example
  </summary>
```json
{
    body: {
        details: "The student works well on a team, to achieve an exemplary end result.",
        userId: "aposjdfnpouapuofaou"
    }
}
```
</details>

### Response

| Name | Description |
|:----:|----|
| 200 | Behavior updated successfully |
| 400 | Competency is deprecated, rejected, or published and cannot be updated. Or body is incorrectly formatted. |
| 401 | Not Authenticated  |
| 403 | User does not have permissions to update fields of the competency |
| 404 | Competency not found |