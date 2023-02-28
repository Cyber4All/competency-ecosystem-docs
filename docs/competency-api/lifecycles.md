---
layout: default
title: Lifecycles
nav_order: 9
parent: Competency API
---

# Lifecycles

## Deprecate Competency

```http
PATCH https://api.competency-constructor.clark.center/competencies/:competencyId/deprecate
```

### Description

This route handles the action of an deprecating a published competency. This action will move the competency to a deprecated status.

### Headers

| Key | Value |
| -- | -- |
| Authorization | `Bearer Example.bearer.token` |

{: .note}
User must have the following actions [`competency:lifecycle:deprecate`]

<details closed markdown="block">
  <summary>
    Example Request
  </summary>
```zsh
curl -X PATCH \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer REPLACE_BEARER_TOKEN" \
  -L "https://api.competency-constructor.clark.center/competencies/:competencyId/deprecate"
```
</details>

### Responses

| Error Code | Description |
| -- | -- |
| 400 | Cannot deprecate a competency that is not published |
| 400 | Cannot change to the same state |
| 404 | Competency not found |
| 403 | Requester does not have the correct action |

## Publish Competency

```http
PATCH https://api.competency-constructor.clark.center/competencies/:competencyId/publish
```

### Description

This route handles the action of publishing a submitted competency. This action will move the competency to a published status.

### Headers

| Key | Value |
| -- | -- |
| Authorization | `Bearer Example.bearer.token` |

{: .note}
User must have the following actions [`competency:lifecycle:approve`]

<details closed markdown="block">
  <summary>
    Example Request
  </summary>
```zsh
curl -X PATCH \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer REPLACE_BEARER_TOKEN" \
  -L "https://api.competency-constructor.clark.center/competencies/:competencyId/publish"
```
</details>

### Responses

| Error Code | Description |
| -- | -- |
| 400 | Cannot publish a competency that is not submitted |
| 400 | Cannot change to the same state |
| 404 | Competency not found |
| 403 | Requester does not have the correct action |

## Reject Competency

```http
PATCH https://api.competency-constructor.clark.center/competencies/:competencyId/reject
```

### Description

This route handles the action of rejecting a submitted competency. This action will move the competency to a rejected status.

### Headers

| Key | Value |
| -- | -- |
| Authorization | `Bearer Example.bearer.token` |

{: .note}
User must have the following actions [`competency:lifecycle:reject`]

<details closed markdown="block">
  <summary>
    Example Request
  </summary>
```zsh
curl -X PATCH \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer REPLACE_BEARER_TOKEN" \
  -L "https://api.competency-constructor.clark.center/competencies/:competencyId/reject"
```
</details>

### Responses

| Error Code | Description |
| -- | -- |
| 400 | Cannot reject a competency that is not submitted |
| 400 | Cannot change to the same state |
| 404 | Competency not found |
| 403 | Requester does not have the correct action |

## Submit Competency

```http
PATCH https://api.competency-constructor.clark.center/competencies/:competencyId/submit
```

### Description

This route handles the action of submitting a draft competency. This action will move the competency to a submitted status.

### Headers

| Key | Value |
| -- | -- |
| Authorization | `Bearer Example.bearer.token` |

{: .note}
User must have the following actions [`competency:lifecycle:submit`]

<details closed markdown="block">
  <summary>
    Example Request
  </summary>
```zsh
curl -X PATCH \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer REPLACE_BEARER_TOKEN" \
  -L "https://api.competency-constructor.clark.center/competencies/:competencyId/submit"
```
</details>

### Responses

| Error Code | Description |
| -- | -- |
| 400 | Cannot submit a competency that is not a draft |
| 400 | Cannot change to the same state |
| 404 | Competency not found |
| 403 | Requester does not have the correct action |
| 403 | Only the author of the competency can submit it |
