# AirInfo

A modern airport flight information board built with Ruby on Rails.

## Features
- View all current-day flights in a clean, real-time board
- Add, edit, and delete flights with full validation
- Prevents past dates/times for STD and ETD
- Logical, real-world flight status options (On Time, Delayed, Boarding, etc.)
- Modern, responsive UI with clear error and notice messages
- Consistent, accessible design

## Requirements
- Ruby 3.2+
- Rails 7.1+
- SQLite (default) or PostgreSQL/MySQL

## Setup
1. **Clone the repository:**
   ```sh
   git clone https://github.com/pramoditagi
   cd air-info
   ```
2. **Install dependencies:**
   ```sh
   bundle install
   ```
3. **Set up the database:**
   ```sh
   rails db:setup
   ```
4. **Start the Rails server:**
   ```sh
   rails server
   ```
5. **Visit the app:**
   Open [http://localhost:3000](http://localhost:3000) in your browser.

## Running Tests
```sh
rails test
```

## Usage
- **Add a flight:** Click "Add New Flight" and fill out the form.
- **Edit/Delete:** Click a flight number, then use the Edit or Delete buttons.
- **Statuses:** Choose from real-world statuses (On Time, Delayed, Boarding, etc.)
- **Validation:** Past dates/times are not allowed for STD/ETD.

## Customization
- Update flight statuses in `app/views/flights/_form.html.erb` as needed.
- UI styles in `app/assets/stylesheets/flights.css`.

## Contributing
Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](LICENSE)
