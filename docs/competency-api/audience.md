---
layout: default
title: Audience
nav_order: 2
parent: Competency API
---
# Audience
## Update Audience

### Definition
```
http://api.competency-constructor.clark.center/competencies/:competencyId/audience
```

## Headers
```
{
    Bearer: $BEARER-TOKEN
}
```

### Body Parameters

| Name | Description |
| ----------- | ----------- |
| type | The type of audience for the competency |
| details | Any details necessary about the audience of the competency |
| userId | The ObjectId of the user |

### Responses

| Code | Description |
| ----------- | ----------- |
| 204 | Audience updated successfully |
| 400 | - Competency is deprecated, rejected, or published and cannot be updated. - Body is incorrectly formatted. |
| 401 | Not Authenticated  |
| 403 | User does not have permissions to update fields of the competency |
| 404 | Competency not found |


