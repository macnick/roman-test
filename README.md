# Rails 6 API

This is a small Rails API with three resources: User, Post, Comment.

Relations: User can have many Posts and Comments. Post have many Comments.
All fields are validated

Authentication is implemented using JSON Web Token. Implemented versioning so new version can be created without breaking the old ones. Also implemented data serialization. The serializer allows returning all the related data in an organized format. Consequently, front-end apps do not have to make extra API requests to get the relevant data.

Wrote tests for model, and requests.

The user has to create an account to get access to the API and be able to create a post. The following endpoints are implemented:

### Signup

- POST: `http://localhost:3000/api/v1/users`
- Parameters: `{first_name: string, last_name: string, email: string, password: string}`

### Authenticate user

- GET: `http://localhost:3000/api/v1/authenticate`
- Parameters: `{ email: string, password: string }`

returns a JWT token

### Get a list of posts

- GET: `http://localhost:3000/api/v1/posts`

Also support pagingation

### Create a new post

- POST: `http://localhost:3000/api/v1/posts/new`
- Parameters: `{ title: string, post_text: string, user_id: integer, }`
- Headers: `{ Authorization: 'Bearer ${token}'`

[Up](#Table-of-Contents)

## Technologies Used

- Ruby on Rails 6
- JWT

[Up](#Table-of-Contents)

## Setup and Run in Your Computer

Use your terminal and run the commands after each instruction.

| Command                                               | Description                                      |
| ----------------------------------------------------- | ------------------------------------------------ |
| `git clone https://github.com/macnick/roman-test.git` | Clone the repository to you computer             |
| `cd bookaduc-api`                                     | Navigate to the newly created folder             |
| `bundle install`                                      | Install gem dependencies                         |
| `rails db:create` followed by `rails db:migrate`      | Setup the database                               |
| `rails server`                                        | Starts the development server                    |
|                                                       | Press `Ctrl + c` to kill **http-server** process |
| `rails db:seed`                                       | Fill the db with the required Bike data          |
| `http://localhost:3000`                               | Visit this link in your browser to use it        |

[Up](#Table-of-Contents)

## 👤 Author

## Nick Haralampopoulos

- Github: [@macnick](https://github.com/macnick)
- Twitter: [@mac_experts](https://twitter.com/mac_experts)
- Linkedin: [Nick Haralampopoulos](https://www.linkedin.com/in/nick-haralampopoulos/)
- AngelList: [Nick Haralampopoulos](https://angel.co/u/nick-haralampopoulos)
