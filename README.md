# Rails API

##Users Sign Up
* Path: `POST '/users/signup'`
* Params:
  * email: a string
  * password: a string
  * user name: a string
  * full name: a string
* Response:
  * Status Code: 201 if successful, 422 if unsuccessful
  * Example success:
  ``` 
    { "user":{
      "id":5,
      "username":"whitney_hoggs",
      "full_name":"Whitney Hoggs",
      "email":"whitney1@gmail.com",
      "access_token":"03c0b80efbe2b23a2c0764599ad60015"}
    }
   ```
  * Example Failure:
  ```{"errors":["Email has already been taken"]}```

##Users Login
* Path: `POST '/users/login'`
* Params:
  * password: a string
  * user name: a string
* Response:
  * Status Code: 201 if successful
  * Example success:
  ``` 
  { "user": {
    "id": 5,
    "username": "whitney_hoggs",
    "full_name": "Whitney Hoggs",
    "email": "whitney1@gmail.com",
    "access_token": "03c0b80efbe2b23a2c0764599ad60015"
  }
}
  ```

##Show Individual User info
* Path: `GET '/user/:id'`
* Params:
  *User id you want to retrieve: an integer
* Response:
  *Example success: 
  ``` 
  { "user": {
    "id": 6,
    "username": "whitney_hoggs2",
    "full_name": "Whitney Hoggs",
    "email": "whitney2@gmail.com",
    "access_token": "d28faf6ea06d1636fe6cebf0196c2b1d"
  }
}
  ```

##Show All Users
* Path: `GET '/users'`
* Params: none
* Response
  *Example Response:
  ``` 
  { "users": [
    {
      "id": 2,
      "username": "arfranco",
      "full_name": "Anthony Franco",
      "email": "brit@gmail.com"
    },
    {
      "id": 3,
      "username": "tterris",
      "full_name": "Trevor Terris",
      "email": "trevor@gmail.com"
    }
  ]
}
  ```

## Show User Scoreboard
* Path: `GET 'users/scoreboard'`
* Params: none
* Response:
	*Example Success: 
	``` 
	[
  { "username": "arfranco",
    "total_points": 9
  },
  { "username": "tterris",
    "total_points": 5
  },
  { "username": "whitney_hoggs",
    "total_points": 3
  },
  { "username": "whitney_hoggs2",
    "total_points": 2
  }
] 
	```

##Delete particular User
* Path `DELETE 'user/:id'`
* Params: 
  *Particular User ID: A string

*Response
  *Example Response:


##To post guesses for a particular post(i.e image) for particular user
* Path  POST 'post/:id/guesses'
* Params:
  * guess

Ex/ If a guess of "apple" is made (for user_id 2 post_id 3) and assuming "apple" is NOT the answer, then the json will appear as:

{"guess":{"guess":"apple","points":0,"post_id":3,"user_id":2,"created_at":"2015-06-19T14:15:46.795Z","updated_at":"2015-06-19T14:15:46.795Z"}}

Ex/ If a guess of "apple" is made (for user_id 2 post_id 3) and assuming "apple" IS the right answer, then the json will appear as (note that points will be changed to 1 if guessed correctly):

{"guess":{"guess":"apple","points":1,"post_id":3,"user_id":2,"created_at":"2015-06-19T14:15:46.795Z","updated_at":"2015-06-19T14:15:46.795Z"}}

##To get individual user's total score
* Path GET 'user/:id/score'

Ex/ For a specific user, who has a total of 2 points, the json will appear as:

{"user":{"score":2,"email":"test@gmail.com"}}



## Create a Post (re: Image)

* Path: ` POST 'posts/new' ` 
* Params: 
  * image_url: "string"
  * answer: "string"
* Response:
  * Status Code: 200 if successful, 422 if unsuccessful
  * Example success: 
``` 
{
  "post": {
    "id": 1,
    "image_url": "http://blog.ghost.org/content/images/2015/03/markdown-guide-1.jpg",
    "answer": "markdown",
    "solution": false,
    "created_at": "2015-06-19T15:12:38.162Z",
    "updated_at": "2015-06-19T15:12:38.162Z"
  }
}
```
  * Example failure:
```
{
  "message": "Access Token not found."
}
```

## Show a Post (re: Image)

* Path: ` GET 'post/:id' `
* Params: 
  * id: "integer"
* Response:
  * Status Code: 200 if successful
  * Example success:
```
{
  "id": 1,
  "image_url": "http://blog.ghost.org/content/images/2015/03/markdown-guide-1.jpg",
  "user_id": 2,
  "answer": "markdown",
  "solution": false,
  "created_at": "2015-06-19T15:12:38.162Z",
  "updated_at": "2015-06-19T15:12:38.162Z"
}
```

## Posts Index (re: This will show all Images)

You will probably not want to use this route, but it's there if you need.

* Path: ` GET 'posts' `
* Params: none
* Response
    * Status Code: 200 if successful
    * Example success:
```
  [
  {
    "id": 1,
    "image_url": "http://blog.ghost.org/content/images/2015/03/markdown-guide-1.jpg",
    "user_id": 2,
    "answer": "markdown",
    "solution": false,
    "created_at": "2015-06-19T15:12:38.162Z",
    "updated_at": "2015-06-19T15:12:38.162Z"
  },
  {
    "id": 2,
    "image_url": "http://blog.ghost.org/content/images/2015/03/markdown-guide-1.jpg",
    "user_id": 2,
    "answer": "markdown",
    "solution": false,
    "created_at": "2015-06-19T15:23:00.907Z",
    "updated_at": "2015-06-19T15:23:00.907Z"
  },
  {
    "id": 3,
    "image_url": "blog.ghost.org/content/images/2015/03/markdown-guide-1.jpg",
    "user_id": 2,
    "answer": "markdown",
    "solution": false,
    "created_at": "2015-06-19T15:23:50.954Z",
    "updated_at": "2015-06-19T15:23:50.954Z"
  } ]
```
## Unsolved Images
*