---
layout: post
title: "Working with groups and the API"
id: rest_apis-learn-groups-and-api
categories: Learn REST groups
toc: True
---

Using Learn ULTRA on Ultra Course view on Release 3900.34.0-rel.24+41a9160

On a course, it is possible to create groups to divide students according to the study plan, we have APIs available to perform this task, although this document is written thinking in differentiating Ultra and Original, all group set endpoints work with original, even thought it is displayed in a different way.

# Groups in Ultra Experience (C.R.U.D)

This is how the group manager looks like in ultra. The groups displayed here are group sets:

![How group sets look in the GUI](/assets/img/rest-api-groups-1.png)

And this is how groups look on the GUI within the "New group set 2/18/222":

![How groups look withing a group set](/assets/img/rest-api-groups-2.png)

## Group sets
### Creating Group sets

It is possible to create a new set sending:

POST {{baseUrl}}/learn/api/public/v2/courses/:courseId/groups/sets

And using body (You can use BBML, more about it here https://docs.blackboard.com/rest-apis/learn/advanced/bbml ):

``` json
{
    "name": "GroupSetFromAPI",
    "externalId": "enim Duis ea non exercitation",
    "description": "A description that can use BBML",
    "availability": {
        "available": "No"
    },
    "enrollment": {
        "type": "InstructorOnly",
        "limit": 6,
        "signupSheet": {
            "name": "SignUpSheet Name",
            "description": "signUpSheet description that can use BBML",
            "showMembers": true
        }
    }
}
```

Returns when 201 - Created:
``` json
{
    "id": "_875_1",
    "externalId": "enim Duis ea non exercitation",
    "name": "GroupSetFromAPI",
    "description": "A description that can use BBML",
    "availability": {
        "available": "No"
    },
    "enrollment": {
        "type": "InstructorOnly",
        "limit": 6
    },
    "uuid": "c2a6b04e187646e79c64e740a32d8c5a",
    "created": "2022-03-01T19:31:27.840Z",
    "modified": "2022-03-01T19:31:27.840Z"
}
``` 

## Reading group sets

You can read them by sending:

GET {{baseUrl}}/learn/api/public/v2/courses/:courseId/groups/sets

And, since we already have 3 sets it returns:

``` json
{
    "results": [
        {
            "id": "_875_1",
            "externalId": "enim Duis ea non exercitation",
            "name": "GroupSetFromAPI",
            "description": "A description that can use BBML",
            "availability": {
                "available": "No"
            },
            "enrollment": {
                "type": "InstructorOnly",
                "limit": 6
            },
            "uuid": "c2a6b04e187646e79c64e740a32d8c5a",
            "created": "2022-03-01T19:31:27.840Z",
            "modified": "2022-03-01T19:31:27.840Z"
        },
        {
            "id": "_866_1",
            "externalId": "7af727199eb941daa96d75f1163b2a89",
            "name": "New Group Set 2/18/22",
            "availability": {
                "available": "No"
            },
            "enrollment": {
                "type": "InstructorOnly",
                "limit": 0
            },
            "uuid": "b5ff482694114dd7b81df921b9a7ff90",
            "created": "2022-02-18T20:29:41.965Z",
            "modified": "2022-02-18T20:29:41.965Z"
        },
        {
            "id": "_870_1",
            "externalId": "89d999d600814e6db5df26214843b405",
            "name": "New Group Set 2/28/22",
            "availability": {
                "available": "No"
            },
            "enrollment": {
                "type": "InstructorOnly",
                "limit": 0
            },
            "uuid": "958d29cc470045709dd3bacdacb55ae6",
            "created": "2022-02-28T20:51:06.986Z",
            "modified": "2022-02-28T20:51:06.986Z"
        }
    ]
}
``` 

It is also possible to get all the groups, including sets using (check the parents to know which one is a set and which one is a child of that parent, if parentId is null, is because the group is a set.):

GET {{baseUrl}}/learn/api/public/v1/courses/:courseId/groups

Returns when 200: 

```json
{
    "results": [
        {
            "id": "_875_1",
            "externalId": "enim Duis ea non exercitation",
            "parentId": null,
            "name": "GroupSetFromAPI",
            "description": "A description that can use BBML",
            "isGroupSet": true,
            "availability": {
                "available": "No"
            },
            "enrollment": {
                "type": "InstructorOnly",
                "limit": 6
            },
            "uuid": "c2a6b04e187646e79c64e740a32d8c5a"
        },
        {
            "id": "_867_1",
            "externalId": "2f77cf366064488a94d6778a133c2ba6",
            "parentId": "_866_1",
            "name": "New Group 1",
            "isGroupSet": false,
            "availability": {
                "available": "No"
            },
            "enrollment": {
                "type": "InstructorOnly",
                "limit": 0
            },
            "uuid": "de138f580ef34edb8531d48d04e2b0e7"
        },
        {
            "id": "_871_1",
            "externalId": "fa87d1ca21ae4eee92a1b1a73db9c189",
            "parentId": "_870_1",
            "name": "New Group 1",
            "isGroupSet": false,
            "availability": {
                "available": "No"
            },
            "enrollment": {
                "type": "InstructorOnly",
                "limit": 0
            },
            "uuid": "e546b01898f34d1aad8a05d615e9e53f"
        },
        {
            "id": "_868_1",
            "externalId": "3fec1b86660541d2982c93fe5b51c24f",
            "parentId": "_866_1",
            "name": "New Group 2",
            "isGroupSet": false,
            "availability": {
                "available": "No"
            },
            "enrollment": {
                "type": "InstructorOnly",
                "limit": 0
            },
            "uuid": "6e311e235d474e0abd82284a61c5c3f1"
        },
        {
            "id": "_872_1",
            "externalId": "169b1d4ede8343f6b7ed2e2c93646013",
            "parentId": "_870_1",
            "name": "New Group 2",
            "isGroupSet": false,
            "availability": {
                "available": "No"
            },
            "enrollment": {
                "type": "InstructorOnly",
                "limit": 0
            },
            "uuid": "ac3e3617a1a84d1ab7dcb8803d0b671c"
        },
        {
            "id": "_873_1",
            "externalId": "0ee40767726a4c87875ee7243205dd32",
            "parentId": "_870_1",
            "name": "New Group 3",
            "isGroupSet": false,
            "availability": {
                "available": "No"
            },
            "enrollment": {
                "type": "InstructorOnly",
                "limit": 0
            },
            "uuid": "8fb901da7cac4f04a19c6721790d7ec1"
        },
        {
            "id": "_866_1",
            "externalId": "7af727199eb941daa96d75f1163b2a89",
            "parentId": null,
            "name": "New Group Set 2/18/22",
            "isGroupSet": true,
            "availability": {
                "available": "No"
            },
            "enrollment": {
                "type": "InstructorOnly",
                "limit": 0
            },
            "uuid": "b5ff482694114dd7b81df921b9a7ff90"
        },
        {
            "id": "_870_1",
            "externalId": "89d999d600814e6db5df26214843b405",
            "parentId": null,
            "name": "New Group Set 2/28/22",
            "isGroupSet": true,
            "availability": {
                "available": "No"
            },
            "enrollment": {
                "type": "InstructorOnly",
                "limit": 0
            },
            "uuid": "958d29cc470045709dd3bacdacb55ae6"
        }
    ]
}

``` 

In the GUI it looks like this:

![How groups look withing a group set](/assets/img/rest-api-groups-3.png)

To add groups to a set:

POST {{baseUrl}}/learn/api/public/v2/courses/:courseId/groups/sets/:groupId/groups

And in the body:

``` json
{
    "name": "GroupSetFromAPI First Child",
    "externalId": "",
    "description": "BBML CAPABLE",
    "availability": {
        "available": "No"
    },
    "enrollment": {
        "type": "InstructorOnly",
        "limit": -11076931,
        "signupSheet": {
            "name": "SignupSheet name",
            "description": "SignUpSheet description",
            "showMembers": true
        }
    }
}
```

Returns

201

```json
{
    "id": "_876_1",
    "externalId": "b8c68679be084e1581ff3c3f9490f473",
    "groupSetId": "_875_1",
    "name": "GroupSetFromAPI First Child",
    "description": "BBML CAPABLE",
    "availability": {
        "available": "No"
    },
    "enrollment": {
        "type": "InstructorOnly",
        "limit": -11076931
    },
    "uuid": "a30a62775ae749a884022f2ffc1bf0b5",
    "created": "2022-03-02T20:34:46.308Z",
    "modified": "2022-03-02T20:34:46.500Z"
}
```

To get the group set children of a specific parent:

GET {{baseUrl}}/learn/api/public/v2/courses/:courseId/groups/sets/:groupId/groups

Returns when 200:

```json
{
    "results": [
        {
            "id": "_876_1",
            "externalId": "b8c68679be084e1581ff3c3f9490f473",
            "groupSetId": "_875_1",
            "name": "GroupSetFromAPI First Child",
            "description": "BBML CAPABLE",
            "availability": {
                "available": "No"
            },
            "enrollment": {
                "type": "InstructorOnly",
                "limit": -11076931
            },
            "uuid": "a30a62775ae749a884022f2ffc1bf0b5",
            "created": "2022-03-02T20:34:46.308Z",
            "modified": "2022-03-02T20:34:46.500Z"
        }
    ]
}
```

