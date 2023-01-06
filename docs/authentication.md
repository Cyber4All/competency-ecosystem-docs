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
Bearer tokens are Json Web Tokens (JWTs) that are generated when you [login](). Here is an example of what a JWT look like: 
```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
```

JWTs are valid for 24 hours, after this time, a new one will need to be generated.
## API Keys
TODO

## Routes