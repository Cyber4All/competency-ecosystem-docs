---
layout: default
title: GraphQL
nav_order: 7
parent: Competency API
---
# GraphQL

## Table of contents
{: .no_toc .text-delta }
1. TOC
{:toc}

## Introduction
The Competency API uses GraphQL to query and retrieve data. [GraphQL](graphql.org) is a query language for APIs that gives clients control over what data is asked for.

To utilize GraphQL in our API, send a POST request to the [GraphQL route](#definition) with a query document attached to the body. The query document tells the API what data should be returned. The data that is returned is read-only, and cannot be used to manipulate data in the server.

Example query document to retrieve a competency by its id with it's details:

```graphql
query {
    competency(competencyId:"nui2n3432iu4n2iuln") { # the query with an argument
        _id                                         # a field that returns a scalar
        status,                                     # a field that returns a scalar
        authorId,                                   # a field that returns a scalar
        version,                                    # a field that returns a scalar
        actor {                                  # a field that returns an object
          type                                      # a field that returns a scalar
          details                                   # a field that returns a scalar
        }
      }
}
```

See the [GraphQL docs](graphql.org/learn) on how to properly format a query.

## Definition

```http
https://api.competency-contructor.clark.center/graphql
```

## Headers
```json
{
  "Authorization": "Bearer Example.bearer.token"
}
```

{: .note}
Authorization is not required for public competencies, workroles, tasks, knowledge units and skills.

## Queries

The following sections provide an in-depth schema of all the potential queries that are provided.

---

### competency
Searches for an individual competency.

<details markdown="block">
  <summary>Example Schema</summary>

  ```graphql
    query {
      competency(competencyId:"abcdefghijklmnop") { # see competencyType for the full schema
        _id
        status
        authorId
        version
        actor {
          _id
          type
          details
        }
      }
    }
  ```
</details>

#### Arguments

| Name | Type | Required? | Description |
|--------------|----------|--------|----------------------------------------|
| competencyId | string | true | The id of the competency to be queried |

#### Responses

| Name | Description                                         |
|------|-----------------------------------------------------|
| 200  | Success                                             |
| 400  | Invalid competency Id                               |
| 400  | Error parsing graph query                           |
| 401  | User has invalid permissions                        |
| 403  | User not authorized to view competency              |
| 403  | JWT or API Key missing or invalid                   |
| 404  | Competency not found                                |

---

### search
Searches for competencies based on a filter provided by the arguments.

<details markdown="block">
  <summary>Example Schema</summary>

  ```graphql
    query {
      search(text:"",          # see searchType for the full schema
             page:1,
             limit:10,
             author:"",
             status:[PUBLISHED, DEPRECATED],
             version:0) {
                competencies { # see competencyType for the full schema
                  _id
                }
                total
                page
                limit
              }
}
  ```
</details>

#### Arguments

| Name    | Type                        | Required? | Description                                                      |
|---------|-----------------------------|-----------|------------------------------------------------------------------|
| text    | string                      | false     | Text to find a competency with                                   |
| page    | int                         | false     | The page number of the competencies to be viewed, based on limit |
| limit   | int                         | false     | Number of competencies per page                                  |
| author  | string                      | false     | The author of the competencies being searched for                |
| status  | An array of [Lifecycle Enums](#lifecyclesenumtype) | false     | The lifecycles of competencies being searched for                |
| version | An array of integers        | false     | The version of competencies being searched for                   |

#### Responses

| Name | Description                            |
|------|----------------------------------------|
| 200  | Success                                |
| 400  | Invalid competency Id                  |
| 400  | Error parsing graph query              |
| 401  | User has invalid permissions           |
| 403  | User not authorized to view competency |

---
### workrole

<details markdown="block">
  <summary>Example Schema</summary>

  ```graphql
    query {
      workrole(workroleId:"abcdefghijklmnop") { # see workroleType for the full schema
        _id,
        work_role,
        work_role_id
      }
    }
  ```
</details>

#### Arguments

| Name | Required | Type | Description |
|--------------|----------|--------|----------------------------------------|
| workroleId | true | string | The id of the workrole to be queried |

#### Responses

| Name | Description               |
|------|---------------------------|
| 200  | Success                   |
| 400  | Error parsing graph query |
| 404  | Workrole not found        |

---
### task

<details markdown="block">
  <summary>Example Schema</summary>

  ```graphql
    query {
      task(taskId:"abcdefghijklmnop") { # see niceElementType for the full schema
        _id,
        element,
        element_id
      }
    }
  ```
</details>

#### Arguments

| Name | Required | Type | Description |
|--------------|----------|--------|----------------------------------------|
| taskId | true | string | The id of the task to be queried |

#### Responses

| Name | Description               |
|------|---------------------------|
| 200  | Success                   |
| 400  | Error parsing graph query |
| 404  | Task not found            |

---
### workroles

Returns a list of all the workroles, attributes depending on the body sent.

<details markdown="block">
  <summary>Example Schema</summary>

  ```graphql
    query {
      workroles { # see workroleType for the full schema
        _id
        work_role
        ksats
      }
    }
  ```
</details>

#### Arguments

No arguments are taken for this query.

#### Responses

| Name | Description               |
|------|---------------------------|
| 200  | Success                   |
| 400  | Error parsing graph query |
| 404  | Workroles not found       |

---
### tasks

Returns a list of all the tasks, attributes depending on the body sent.

<details markdown="block">
  <summary>Example Schema</summary>

  ```graphql
    query {
      tasks { # see niceElementType for the full schema
          _id
          element
          description
        }
    }
  ```
</details>

#### Arguments

No arguments are taken for this query.

#### Responses

| Name | Description               |
|------|---------------------------|
| 200  | Success                   |
| 400  | Error parsing graph query |
| 404  | Tasks not found           |

---
### prereqSuggestions

Returns a list of all the knowledge and skill elements, attributes depending on the body sent.

<details markdown="block">
  <summary>Example Schema</summary>

  ```graphql
    query {
      prereqSuggestions { # see niceElementType for the full schema
        _id
        element
        description
      }
    }
  ```
</details>

#### Arguments

No arguments are taken for this query.

#### Responses

| Name | Description                                   |
|------|-----------------------------------------------|
| 200  | Success                                       |
| 400  | Error parsing graph query                     |
| 404  | Knowledge and skill elements not found        |

---
### dropdownItems
Gets a list of all dropdown items that can be used to populate certain areas of a competency

<details markdown="block">
  <summary>Example Schema</summary>

  ```graphql
    query {
        dropdownItem {
          _id,
          type,
          detail
        }
    }
  ```
</details>

#### Arguments

| Name    | Type                        | Required? | Description                                                      |
|---------|-----------------------------|-----------|------------------------------------------------------------------|
| type    | [DropdownTypeEnum](#dropdowntypeenum)     | false     | Allows for filtering specific types of a dropdown  |


#### Responses

| Name | Description                            |
|------|----------------------------------------|
| 200  | Success                                |
| 400  | Invalid DropdownType                   |
| 400  | Error parsing graph query              |
| 401  | User has invalid permissions           |

---

## Types

GraphQL provides the ability to pick and choose what elements and attributes of those elements are retrieved. The following provides the types used within the schema containing all the elements and their attributes. The types are listed beginning with the root type down by level.

### queryType

Property Name: query

| Field Name        | Field Type                               | Number of Arguments  |
|-------------------|------------------------------------------|----------------------|
| competency        | [competencyType](#competencytype)        | [1](#competency-1)   |
| search            | [searchType](#searchtype)                | [6](#search-1)       |
| workrole          | [workroleType](#workroletype)            | [1](#workrole-1)     |
| task              | [niceElementType](#niceelementtype)      | [1](#task-1)         |
| workroles         | List([workroleType](#workroletype))      | 0                    |
| tasks             | List([niceElementType](#niceelementtype))| 0                    |
| prereqSuggestions | List([niceElementType](#niceelementtype))| 0                    |

#### queryType arguments

##### competency

| Name         | Type   | Required? |
|--------------|--------|-----------|
| competencyId | string | true      |

##### search

| Name    | Type                                            | Required? |
|---------|-------------------------------------------------|-----------|
| text    | string                                          | false     |
| page    | int                                             | false     |
| limit   | int                                             | false     |
| author  | string                                          | false     |
| status  | List([LifecyclesEnumType](#lifecyclesenumtype)) | false     |
| version | List(int)                                       | false     |

##### workrole

| Name         | Type   | Required? |
|--------------|--------|-----------|
| workroleId   | string | true      |

##### task

| Name         | Type   | Required? |
|--------------|--------|-----------|
| taskId       | string | true      |

### competencyType

Property Name: competency

| Field Name    | Field Type                              |
|---------------|-----------------------------------------|
| _id           | string                                  |
| status        | string                                  |
| authorId      | string                                  |
| version       | int                                     |
| actor         | [actorType](#actortype)                 |
| behavior      | [behaviorType](#behaviortype)           |
| condition     | [conditionType](#conditiontype)         |
| degree        | [degreeType](#degreetype)               |
| employability | [employabilityType](#employabilitytype) |
| notes         | [notesType](#notestype)                 |

### searchType

Property Name: search

| Field Name   | Field Type                              |
|--------------|-----------------------------------------|
| competencies | List([competencyType](#competencytype)) |
| total        | int                                     |
| page         | int                                     |
| limit        | int                                     |

### workroleType

Property Name: workrole

| Field Name   | Field Type   |
|--------------|--------------|
| _id          | string       |
| work_role    | string       |
| work_role_id | string       |
| ksats        | List(string) |
| description  | string       |
| special_area | string       |

### niceElementType

Property Name: NiceElement

| Field Name  | Field Type |
|-------------|------------|
| _id         | string     |
| element     | string     |
| element_id  | string     |
| description | string     |

### actorType

Property Name: actor

| Field Name | Field Type |
|------------|------------|
| _id        | string     |
| type       | string     |
| details    | string     |

### behaviorType

Property Name: behavior

| Field Name | Field Type |
|------------|------------|
| _id        | string     |
| tasks      | string     |
| details    | string     |
| work_role  | string     |

### conditionType

Property Name: condition

| Field Name    | Field Type                                    |
|---------------|-----------------------------------------------|
| _id           | string                                        |
| tech          | List(string)                                  |
| documentation | List([documentationType](#documentationtype)) |
| limitations   | string                                        |

### documentationType

Property Name: documentation

| Field Name  | Field Type |
|-------------|------------|
| _id         | string     |
| conditionId | string     |
| description | string     |
| uri         | string     |

### degreeType

Property Name: degree

| Field Name | Field Type |
|------------|------------|
| _id        | string     |
| complete   | string     |
| correct    | string     |
| time       | string     |

### employabilityType

Property Name: employability

| Field Name | Field Type |
|------------|------------|
| _id        | string     |
| details    | string     |

### notesType

Property Name: notes

| Field Name | Field Type |
|------------|------------|
| _id        | string     |
| details    | string     |

---
### LifecyclesEnumType

While the `LifecyclesEnumType` is not an object type like all the types listed above, it is important to distinguish different competencies by their current lifecycle state. The following table maps constants to a string value, to be used to identify a particular lifecycle state.

| Constant   | String Value |
|------------|--------------|
| DRAFT      | "draft"      |
| SUBMITTED  | "submitted"  |
| DEPRECATED | "deprecated" |
| REJECTED   | "rejected"   |
| PUBLISHED  | "published"  |

### DropdownTypeEnum

| Constant   | String Value |
|------------|--------------|
| ACTOR      | "actor"      |
| TIME       | "time"       |