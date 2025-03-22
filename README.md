# Ruby on Rails Blog Site(in development)

This is a simple blog application built with Ruby on Rails as part of my internship.

## Features

* **Recent Blog Posts:** Displays a list of recent blog posts on the homepage.
* **Post Titles and Content:** Each post shows its title and a snippet of the content.
* **Author and Timestamp:** Posts include the author's name and the time they were posted.
* **User profiles:** They allow users to manage their own posts.
* **Search Functionality:** Users can search for specific blog posts.
* **User Authentication:** Users can sign up and sign in to the application.
* **Comments and Likes:** Users can add comments and like blog posts.
* **Pagination:** Blog posts are paginated for better navigation.
* **Background Jobs:** Scheduled tasks, like publishing posts at a specific time, are handled by background jobs.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

* Ruby (version specified in `.ruby-version`)
* Rails (version specified in `Gemfile.lock`)
* PostgreSQL (or another database supported by Rails)
* Bundler
* Redis (for background jobs using Sidekiq or similar)

### Installation

1.  **Clone the repository:**

    ```bash
    git clone <repository_url>
    cd <project_directory>
    ```

2.  **Install dependencies:**

    ```bash
    bundle install
    ```

3.  **Set up the database:**

    ```bash
    rails db:create
    rails db:migrate
    ```

4.  **Start Redis (if using background jobs):**

    ```bash
    redis-server
    ```

5.  **Start Sidekiq (or your chosen background job processor):**

    ```bash
    bundle exec sidekiq -q default
    ```

6.  **Start the Rails server:**

    ```bash
    rails server
    ```

7.  **Open the application in your browser:**

    Visit `http://localhost:3000` in your web browser.

## Usage

* **Viewing Posts:** The homepage displays recent blog posts, paginated for easy browsing.
* **Searching Posts:** Use the search bar to find blog posts based on keywords.
* **Signing Up/Signing In:** Click the "Sign up" or "Sign in" links to create an account or log in.
* **Commenting and Liking:** Viewers can add comments and like posts when logged in.
* **Background Jobs:** scheduled posts will be published automatically.

## Contributing

Feel free to contribute to this project by submitting pull requests. Please ensure your code follows the existing style and includes appropriate tests.

## Future Enhancements

* Improve search functionality with more advanced filtering options.
* Add categories/tags for posts.
* Implement image uploads for posts.
