---
layout: default
title: Condition
nav_order: 4
parent: Competency API
has_children: true
has_toc: false
---
# Condition
## Update Condition

### Definition
```http
https://api.competency-constructor.clark.center/competencies/:competencyId/condition
```

### Headers
```json
{
    "Authorization": "Bearer Example.bearer.token"
}
```
### Route Parameters 

| Name | Description | Type | Example |
| ----------- | ----------- | ----------- | ----------- |
| competencyId | The ObjectId of the competency the condition belongs to | ObjectId as a string | 6112745b84804cf5833aa94c |

### Body Parameters

| Name | Description | Type | Example |
| ----------- | ----------- | ----------- | ----------- |
| work_role | The ObjectId of the workrole form the NICE database | ObjectId as a string | 6112745b84804cf5833aa94c |
| tech | Tech that is used for the competency | string [] | [ "SEED Labs", "Hack the Box"] |
| limitations | Any limitations for successful completion of the competency | string | without the use of the internet |
| competencyId | The ObjectId of the competency the condition belonged to | ObjectId as a string | 6112745b84804cf5833aa94c |

### Responses

| Code | Description |
| ----------- | ----------- |
| 204 | Condition updated successfully |
| 400 | Competency is deprecated, rejected, or published and cannot be updated. |
| 400 | Body is incorrectly formatted. |
| 401 | Not Authenticated |
| 403 | User does not have permissions to update fields of the competency |
| 404 | Competency or work_role not found |

### Example

```
curl -X PATCH \
  -H "Content-Type: application/json" \
  -H "Authorization": "Bearer Example.bearer.token" \
  -d '{ "work_role": "6112745b84804cf5833aa94c", "tech": [ "SEED Labs", "Hack the Box"], "limitations": without the use of the internet, "competencyId" : "6112745b84804cf5833aa94c" }' \
  -L "https://api.competency-constructor.clark.center/competencies/:competencyId/condition"
  ```
