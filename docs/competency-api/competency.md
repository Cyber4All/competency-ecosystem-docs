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

### Header
```json
{
    Authorization: "Bearer Example.bearer.token"
}
```

### Response

| Name | Description |
|:----:|----|
| 201 | Competency created successfully |
| 400 | Competency cannot be created due to bad request body |
| 401 | Authentication required |
| 403 | User not authorized |
| 404 | JWT or Api Key not valid |
| 404 | Api key or user was not found |
| 500 | Issue with the server |

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

### Response

| Name | Description |
|:----:|----|
| 204 | Competency deleted successfully |
| 400 | Competency cannot be deleted |
| 401 | Authentication required |
| 403 | User not authorized |
| 404 | JWT or Api Key not valid |
| 404 | Api key or user was not found |
| 500 | Issue with the server |
| 500 | Issue with the formatting of request body |