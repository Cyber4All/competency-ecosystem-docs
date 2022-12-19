---
layout: default
title: Degree
nav_order: 5
parent: Competency API
---
# Degree

## Update Degree

### Description

#### patch: 
```http
https://api.competency-constructor.clark.center/competencies/:competencyId/degree
```

### Request

| Name | Required | Type | Description |
|:----:|:-----:|:----:|-----|
| complete | false | string | What it means for the competency to be completed |
| correct | false | string | What it means for this competency to be adequately correct |
| time | false | string | How much time is allowed for the competency to be completed |
| userId | true | Object Id: string | The userId matching the Bearer token |

<details closed markdown="block">
  <summary>
    Example
  </summary>
```json
{
    body: {
        complete: "Given 5 dummy network requests from a tool like wireshark
        the student should be able to correcly identify and categorize 4.",
        correct: "Of the dummy network requests given, student must correctly 
        identify the port, protocol and likely purpose of the request.",
        time: "5 minutes",
        userId: "aposjdfnpouapuofaou"
    }
}
```
</details>

### Response

| Name | Description |
|:----:|----|
| 200 | Degree updated successfully |
| 400 | Competency is deprecated, rejected, or published and cannot be updated. Or body is incorrectly formatted. |
| 401 | Not Authenticated  |
| 403 | User does not have permissions to update fields of the competency |
| 404 | Competency not found |