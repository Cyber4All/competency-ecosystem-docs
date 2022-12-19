---
layout: default
title: Behavior
nav_order: 3
parent: Competency API
---
# Behavior

## Update Behavior

### Description 
```http
https://api.competency-constructor.clark.center/competencies/:competencyId/behavior
```

### Headers

```json
{
    Bearer: "Bearer Example.bearer.token"
}
```

### Request

| Name | Required | Type | Description |
|----|:-----:|:----:|-----|
| task | true | string | The task to be carried out by the student |
| details | false | string | Any details related to how the task should be completed |
| work_role | false | string | Work role(s) in which this task could be performed |
| userId | true | Object Id: string | The userId matching the Bearer token |

<details closed markdown="block">
  <summary>
    Example
  </summary>
```json
{
    body: {
        task: "Google it",
        details: "student must figure it out themselves",
        work_role: "Software Engineer",
        userId: "aposjdfnpouapuofaou"
    }
}
```
</details>

### Response

| Name | Description |
|----|----|
| 200 | Behavior updated successfully |
| 400 | Competency is deprecated, rejected, or published and cannot be updated. Or body is incorrectly formatted. |
| 401 | Not Authenticated  |
| 403 | User does not have permissions to update fields of the competency |
| 404 | Competency not found |


