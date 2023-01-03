---
layout: default
title: Behavior
nav_order: 3
parent: Competency API
---
# Behavior

## Update Behavior

### Description 

This route is used to update the behavior section of a competency with a task, details, and a work role. Only the task and userId which matches the bearer token is required.

#### patch:
```http
https://api.competency-constructor.clark.center/competencies/:competencyId/behavior
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
| task | true | string | The task to be carried out by the student |
| details | false | string | Any details related to how the task should be completed |
| work_role | false | Object Id: string | Work role in which this task could be performed (limited to one) |
| userId | true | Object Id: string | The userId matching the Bearer token |

<details closed markdown="block">
  <summary>
    Example
  </summary>

### Example Http request body
```json
{
    body: {
        task: "Google it",
        details: "student must figure it out themselves",
        work_role: "6112745b84804cf5833aa94c",
        userId: "6112745b84804cf5833aa94c"
    }
}
```

### Example Curl request
```bash
curl -X PATCH \
  -H "Content-Type: application/json" \
  -H "Authorization": Bearer Example.bearer.token \
  -d '{ task: "Google it", details: "student must figure it out themselves", work_role: "6112745b84804cf5833aa94c", userId: "6112745b84804cf5833aa94c" }' \
  -L "https://api.competency-constructor.clark.center/competencies/6112745b84804cf5833aa94c/behavior"
```
</details>

### Response

| Name | Description |
|:----:|----|
| 204 | Behavior updated successfully |
| 400 | Competency is deprecated, rejected, or published and cannot be updated. Or body is incorrectly formatted. |
| 401 | Not Authenticated  |
| 403 | User does not have permissions to update fields of the competency |
| 404 | Competency not found |


