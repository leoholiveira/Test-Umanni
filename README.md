
# Ruby on Rails Test Umanni

This project is a Ruby on Rails that leverages the Devise framework for authentication for secure user authentication.

## Environment Variables

To run this project, you will need to add the following environment variables to your .env file

`DB_USER`
`DB_PASS`
`DB_HOST`
`DB_PORT`
`DB_NAME`

## Environment Setup

Initialize docker:

```bash
  docker-compose build
  docker-compose up
```

Ensure you have Ruby and Rails installed on your system. Install project dependencies using the following command:

```bash
  bundle install
```

Additionally, configure the database by running the following commands:

```bash
  rails db:create
  rails db:migrate
```

### Start the project:

```bash
  rails s
```

### Run test:

```bash
  rspec
```

### File example to upload csv:

```bash
  /public/testRails.csv
```

### Creating user:

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `fullname` | `string` | **Required** |
| `email` | `string` | **Required** |
| `avatar_image` | `string` | **Required** |
| `user_type` | `integer` | **Required** |
| `password` | `string` | **Required** |
| `password_confirmation` | `string` | **Required** |

## Contributions

Contributions are always welcome!

## Support

For support, email contatos_leo@hotmail.com.

## Tech Stack

**Client:** Stimulus, Bootstrap. 

**Server:** Ruby, Rspec, Docker.

## License

This project is licensed under the [MIT License](https://choosealicense.com/licenses/mit/).

## Authors

- [@leoholiveira](https://github.com/leoholiveira)