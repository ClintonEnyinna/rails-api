# TODO API

Steps to run locally

- `bundle install`
- `rails db:create && rails db:migrate && rails db:seed`
- `rails s`

## Endpoints

### User
#### Create User
    url: http://localhost:3000/api/v1/users

    body: {"user": { "email": "user@email.com", "password": "foobar", "password_confirmation": "foobar" }}
    
#### Login User
    url: http://localhost:3000/api/v1/login

    body: { "email": "user@email.com", "password": "foobar" }
    
### Task
Set **Authorization** header to **auth_token** gotten from login to use endpoints below. The default query limit is set to 20. You can override this default by passing a query param `http://localhost:3000/api/v1/tasks?limit=30`
    
#### Create Task
    url: http://localhost:3000/api/v1/tasks

    body: {"task": { "title": "Hamlet", "note": "A book by Shakespear", "user_id": "1" }}
    
#### Update Task
    url: http://localhost:3000/api/v1/tasks/1

    body: { "task": { "completed": true } }
    
#### Delete Task
    url: http://localhost:3000/api/v1/tasks/1
    
#### Get Tasks
    url: http://localhost:3000/api/v1/tasks
    
#### Get Completed Tasks
    url: http://localhost:3000/api/v1/tasks?completed=true

#### Get Uncompleted Tasks
    url: http://localhost:3000/api/v1/tasks?completed=false
