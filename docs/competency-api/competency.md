---
layout: default
title: Competency
nav_order: 1
parent: Competency API
---
# Competency

## Create Competency

### Description
This route is used to create a competency.

#### Post: 
```http
https://api.competency-constructor.clark.center/competencies
```

### Headers
```json
{
    Authorization: "Bearer Example.bearer.token"
}
```

### Response

| Name | Description |
|:----:|----|
| 201 | Competency created successfully |
| 401 | User does not have the proper permissions |
| 403 | Request not authenticated |
| 500 | Issue with the server or formatting of request body |

## Delete Competency

### Description
This route is used to delete a competency.

#### Delete:
```http
https://api.competency-constructor.clark.center/competencies/:competencyId
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
| competencyId | true | string | The id of the competency |

<details closed markdown="block">
  <summary>
    Example
  </summary>

### Example Http request body
```json
{
    body: {
        competencyId: "ABCD1234"
    }
}
```

### Example Curl request
```bash
curl -X PATCH \
  -H "Content-Type: application/json" \
  -H "Authorization": "Bearer Example.bearer.token" \
  -d '{
        competencyId: "ABCD1234"
    }' \
  -L "https://api.competency-constructor.clark.center/competencies/6112745b84804cf5833aa94c/notes"
```
</details>

### Response

| Name | Description |
|:----:|----|
| 204 | Competency deleted successfully |
| 400 | Competency cannot be deleted |
| 401 | User does not have the proper permissions |
| 403 | Request not authenticated |
| 500 | Issue with the server or formatting of request body |