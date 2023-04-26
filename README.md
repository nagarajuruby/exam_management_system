# Exam Management System

This is a Exam Management System Ruby on Rails API project that provides an endpoint for creating and associating users with exams.

## Requirements

- Ruby 3.1.0
- Rails Gem 7.0.4.3
- Postgres Gem 1.5.1

## Installation

1. Unzip this project
2. Go to project directory: `cd exam_management_system`
3. Install the required gems: `bundle install`
4. Create the database: `rails db:create`
5. Run the database migrations: `rails db:migrate`
6. Seed the database with sample data: `rails db:seed`
7. Start the Rails server: `rails s`

The server should now be running at `http://localhost:3000`.

## API Usage

### `POST /api/v1/users`

This endpoint allows you to create and associate users with exams. The request must include the following parameters in JSON format:

{
"first_name": "John",
"last_name": "Doe",
"phone_number": "123-456-7890",
"college_id": 1,
"exam_id": 1,
"start_time": "2023-05-01T09:30:00-04:00"
}

The endpoint returns a JSON object containing the user, exam, and exam window data if the request is successful. If there is an error processing the request, a bad request (400) response will be returned with an appropriate error message.
