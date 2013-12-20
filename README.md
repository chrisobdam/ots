OTS
===

Open Task Standard - Distributed Task Management

Task Scheme

{
  "id": "opentaskstandard.com@25892e17-80f6-415f-9c65-7395632f0223",
  "title": "Can you get me a Snickers?",
  "notes": "The store is around the corner \nI'll give you the cash later :)",
  "due_date": "2014-01-23T04:56:22Z",
  "owner": "chris@opentaskstandard.com",
  "assignees": [
    {
      "id": "johan@holder.nl",
      "status": "pending"
    }
  ],  
  "listeners": [
    "john@doe.com", "janine@example.com"
  ],
  "comments": [
    {
      "index": "1",
      "comment": "Why do I have to do this?",
      "author": "johan@holder.nl",
      "date": "2014-01-12T08:56:22Z"
    }
  ]
}

## End points

* GET /users

* POST /users/{identifier}/tasks/{identifier}/assign
* POST /tasks/{identifier}


## assign task on different ots server

* call assign endpoint
* ots server fetches task from server
* 

## Assignee statuses
* pending
* accepted
* denied

## Syncing
Each task has a ETAG, which changes on each change, also if comments changes gets added