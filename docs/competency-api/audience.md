---
layout: default
title: Audience
nav_order: 2
parent: Competency API
---
# Audience
## Update Audience

### Definition
```HTTP
https://api.competency-constructor.clark.center/competencies/:competencyId/audience
```

## Headers
```JSON
{
    Bearer: Bearer.Example.bearer.token
}
```

### Body Parameters

| Name | Description | Type | Example |
| ----------- | ----------- | ----------- | ----------- |
| type | The type of audience for the competency | string | The undergraduate student |
| details | Any details necessary about the audience of the competency | string | who has completed basic networking |
| userId | The ObjectId of the user | ObjectId as a string | 6112745b84804cf5833aa94c |

### Responses

| Code | Description |
| ----------- | ----------- |
| 204 | Audience updated successfully |
| 400 | - Competency is deprecated, rejected, or published and cannot be updated. - Body is incorrectly formatted. |
| 401 | Not Authenticated  |
| 403 | User does not have permissions to update fields of the competency |
| 404 | Competency not found |

### Example

```CURL
curl -X PATCH \
  -H "Content-Type: application/json" \
  -H "Bearer: Bearer.Example.bearer.token" \
  -d '{ "type": "The undergraduate student", "details": "who has completed basic networking", "userId": ObjectId() }' \
  -L "https://api.competency-constructor.clark.center/competencies/:competencyId/audience"
```

