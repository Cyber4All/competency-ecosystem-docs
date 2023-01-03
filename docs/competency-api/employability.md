---
layout: default
title: Employability
nav_order: 6
parent: Competency API
---
# Employability

## Update Employability

### Description
This route is used to update the employability section of a competency with details. Both details are required.

#### patch:
```http
https://api.competency-constructor.clark.center/competencies/:competencyId/employability
```

### Headers
```json
{
    Authorization: "Bearer Example.bearer.token"
}
```

### Request

| Name | Required | Type | Description |
|:----:|:-----:|:----:|-----|
| details | true | string | Any performance factors which are important to the competency and not otherwise specified |

<details closed markdown="block">
  <summary>
    Example
  </summary>

### Example Http request body
```json
{
    body: {
        details: "The student works well on a team, to achieve an exemplary end result.",
    }
}
```

### Example Curl request
```bash
curl -X PATCH \
  -H "Content-Type: application/json" \
  -H "Authorization": "Bearer Example.bearer.token" \
  -d '{ details: "The student works well on a team, to achieve an exemplary end result." }' \
  -L "https://api.competency-constructor.clark.center/competencies/6112745b84804cf5833aa94c/employability"
```

</details>

### Response

| Name | Description |
|:----:|----|
| 204 | Employability updated successfully |
| 400 | Competency is deprecated, rejected, or published and cannot be updated. Or body is incorrectly formatted. |
| 401 | Not Authenticated  |
| 403 | User does not have permissions to update fields of the competency |
| 404 | Competency not found |
