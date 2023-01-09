---
layout: default
title: Degree
nav_order: 5
parent: Competency API
---
# Degree

## Update Degree

### Description
This route is used to update the Degree section of a competency with information on what constitutes complete, correct, and any time constraints.

#### patch: 
```http
https://api.competency-constructor.clark.center/competencies/:competencyId/degree
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
| complete | false | string | What it means for the competency to be completed |
| correct | false | string | What it means for this competency to be adequately correct |
| time | false | string | How much time is allowed for the competency to be completed |

<details closed markdown="block">
  <summary>
    Example
  </summary>

### Example Http request body
```json
{
    body: {
        complete: "Given 5 dummy network requests from a tool like wireshark
        the student should be able to correcly identify and categorize 4.",
        correct: "Of the dummy network requests given, student must correctly 
        identify the port, protocol and likely purpose of the request.",
        time: "5 minutes",
    }
}
```

### Example Curl request
```bash
curl -X PATCH \
  -H "Content-Type: application/json" \
  -H "Authorization": "Bearer Example.bearer.token" \
  -d '{
        complete: "Given 5 dummy network requests from a tool like wireshark
        the student should be able to correcly identify and categorize 4.",
        correct: "Of the dummy network requests given, student must correctly 
        identify the port, protocol and likely purpose of the request.",
        time: "5 minutes",
    }' \
  -L "https://api.competency-constructor.clark.center/competencies/6112745b84804cf5833aa94c/degree"
```
</details>

### Response

| Name | Description |
|:----:|----|
| 200 | Degree updated successfully |
| 400 | Competency is deprecated, rejected, or published and cannot be updated. |
| 400 | Body is incorrectly formatted. |
| 401 | Not Authenticated  |
| 403 | User does not have permissions to update fields of the competency |
| 404 | Competency not found |
