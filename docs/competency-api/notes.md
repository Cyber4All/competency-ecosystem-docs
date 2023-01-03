---
layout: default
title: Notes
nav_order: 8
parent: Competency API
---
# Notes

## Update Notes

### Description
This route is used to update the Notes section of a competency with any additional information that the author would like to include.

#### Patch
```http
https://api.competency-constructor.clark.center/competencies/:competencyId/notes
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
| notes | false | string | Any notes related to the competency |

<details closed markdown="block">
  <summary>
    Example
  </summary>

### Example Http request body
```json
{
    body: {
        notes: "This competency is meant for students with a Cyber Security track only."
    }
}
```

### Example Curl request
```bash
curl -X PATCH \
  -H "Content-Type: application/json" \
  -H "Authorization": "Bearer Example.bearer.token" \
  -d '{
        notes: "This competency is meant for students with a Cyber Security track only."
    }' \
  -L "https://api.competency-constructor.clark.center/competencies/6112745b84804cf5833aa94c/behavior"
```
</details>

### Response

| Name | Description |
|:----:|----|
| 200 | Notes updated successfully |
| 400 | Competency is deprecated, rejected, or published and cannot be updated. Or body is incorrectly formatted. |
| 401 | Not Authenticated  |
| 403 | User does not have permissions to update fields of the competency |
| 404 | Competency not found |