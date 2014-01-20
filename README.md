OTS
===

Open Task Standard - Distributed Task Management

## Why OTS

Like iCalender it would be great to be able to send a task to a collegaue or friend. Of course there are propriatary systems, like Basecamp, Things or the Reminder app on your Mac.
But what if you collegaue uses a different task management app then you? Enter OTS. Open Task Standard. It enables you to create a account everywhere and assigns a task to somebody working with a different app or platform.

## Basic flows

### Task assignment flow
1. A task is created on a OTS enabled system
2. It's assigned to an e-mail address
3. The underlying OTS server checks if an OTS account is associated with that e-mail address
4. The assigned user either receives the task via it's selected OTS server. Or he will receive a direct notification via email from the task-creating server.

### Sign up flow
1. Sign up proces is started on a task server/platform that supports OTS
2. An e-mail address of choice is used
3. Server checks if a OTS account is associated with the e-mail address
4. If not, the registration process is finished

### Update existing assigned task flow
1. The task is updated
2. The underlying OTS server sends the updated task object to the server who has created the task
3. The 'owner' server propagates the updated task to all concerned

## The Task Object

* Title
* Notes
* Due date
* Owner
* Assignees
  * User identifier
  * State
* Listeners
* Comments
  * Index
  * Comment
  * Author
  * Date

## User discovery via Webfinger and Webfist
OTS aims to use Webfinger for discovering OTS accounts based on e-mail addresses. With Webfinger a server/domain can be queried if an user exists on that server.
So if the e-mail address is chris@task.af, the OTS server queries the task.af domain to see if a Webfinger profile exists for the user "chris".

If e-mail address used contains a domain that is not Webfinger enabled, we use the Webfist network as a fall back. More info at [Webfist.org](http://webfist.org).

### Creating and updating Webfinger profile
When a user is being created a Webfinger profile will be created or updated. 

## OTS Server discovery
OTS uses XRD for exposing the API endpoints.