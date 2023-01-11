---
layout: default
title: Actor
nav_order: 2
parent: Competency API
---
# Actor
## Update Actor

### Definition
```http
https://api.competency-constructor.clark.center/competencies/:competencyId/actor
```

## Headers
```json
{
    "Authorization": "Bearer Example.bearer.token"
}
```

### Route Parameters
| Name | Description | Type | Example |
| ----------- | ----------- | ----------- | ----------- |
| competencyId | The ObjectId of the competency for the actor | ObjectId as string | 507f1f77bcf86cd799439011 |


### Body Parameters

| Name | Description | Type | Example |
| ----------- | ----------- | ----------- | ----------- |
| type | The type of actor for the competency | string | The undergraduate student |
| details | Any details necessary about the actor of the competency | string | who has completed basic networking |

### Responses

| Code | Description |
| ----------- | ----------- |
| 204 | Actor updated successfully |
| 400 | Competency is deprecated, rejected, or published and cannot be updated. |
| 400 | Body is incorrectly formatted. |
| 401 | Not Authenticated  |
| 403 | User does not have permissions to update fields of the competency |
| 404 | Competency not found |

### Example

```
curl -X PATCH \
  -H "Content-Type: application/json" \
  -H "Authorization": "Bearer Example.bearer.token" \
  -d '{ "type": "The undergraduate student", "details": "who has completed basic networking" }' \
  -L "https://api.competency-constructor.clark.center/competencies/:competencyId/actor"
```

