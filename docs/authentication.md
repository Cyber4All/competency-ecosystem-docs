---
layout: default
title: Authentication/Authorization
nav_order: 2
---
# Authentication/Authorization
{: .no_toc}
## Table of contents
{: .no_toc .text-delta }
1. TOC
{:toc}
---

Authentication and Authorization are done with two different methods:
1. Bearer tokens (JWTs)
2. API Keys

## Bearer Tokens
Bearer tokens are Json Web Tokens (JWTs) that are generated when you [login]() or [register](). Here is an example of what a JWT look like: 
```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
```

JWTs are valid for 24 hours, after this time, a new one will need to be generated.

{: .note}
> It is recommended to use API Keys if you plan on hitting the competency api as Bearer tokens are invalid after 24 hours.
> If you would like an API Token please contact the SecurEd Team.


## API Keys
TODO

## Routes

### Login
This route logs a user in and returns the user object and a Bearer token.

```http
POST https://api.competency-constructor.clark.center/auth/login
```
#### Request Body

| Name | Required | Type | Description |
|:----:|:-----:|:----:|-----|
| email | true | string | Email of your account |
| password | true | string | Password of your account |

##### Request Body Example
```
{
    email: competencies@secured.com,
    password: verySecurePassword123!
}
```

#### Response Body

| Name | Type | Description |
|:----:|:----:|-----|
| user | object | The user object containing the name, email, and username |
| bearer | string | The bearer token, valid for 24 hours |

##### Request Body Example
```
{
    user: {
        _id: 63b878895a22ca3e0796c4e5
        name: Clark,
        email: competencies@secured.com,
        username: clark
    },
    bearer: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
}
```
#### Error Codes

| Name | Description |
|:----:|----|
| 200 | Success |
| 400 | Request body is incorrectly formatted |
| 400 | Email or Password is incorrect |

#### Example

```sh
curl -L -X POST 'https://api.competency-constructor.clark.center/auth/login' \
-H 'Content-Type: application/json' \
--data-raw '{
    "email": "competencies@secured.com",
    "password": "verySecurePassword123!"
}'
```
### Register
This route registers a new user onto the competency ecosystem

```http
POST https://api.competency-constructor.clark.center/auth/register
```
#### Request Body

| Name | Required | Type | Description |
|:----:|:-----:|:----:|-----|
| email | true | string | Email of your account |
| password | true | string | Password for your account |
| username | true | string | Username for your account |
| name | true | string | Your full name |
| organization | false | objectId | The object id of the organization you belong to, defaults to other |

{: .note}
> Password must: Contain a special character, number, capital letter, and a lower case letter and must be at least 8 characters

##### Request Body Example
```
{
    email: competencies@secured.com,
    password: verySecurePassword123!,
    name: Clark Can,
    username: clark
}
```

#### Response Body

| Name | Type | Description |
|:----:|:----:|-----|
| user | object | The user object containing the name, email, and username |
| bearer | string | The bearer token, valid for 24 hours |

##### Request Body Example
```
{
    user: {
        _id: 63b878895a22ca3e0796c4e5
        name: Clark,
        email: competencies@secured.com,
        username: clark
    },
    bearer: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
}
```
#### Error Codes

| Name | Description |
|:----:|----|
| 200 | Success |
| 400 | Request body is incorrectly formatted |
| 400 | Email or username already exists |

#### Example

```sh
curl -L -X POST 'https://api.competency-constructor.clark.center/auth/register' \
-H 'Content-Type: application/json' \
--data-raw '{
    "email": "competencies@secured.com",
    "password": "verySecurePassword123!",
    "name": "Clark Can",
    "username": "clark"
}'
```