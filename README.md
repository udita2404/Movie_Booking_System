# Movie Ticketing System

This project is a database-driven Movie Ticketing System developed using Oracle SQL. It was designed and implemented by **Udita Srivastava** during my college as part of academic coursework. The system simulates real-world ticket booking functionalities for theaters, including user authentication, movie listings, show scheduling, seat booking, and cancellation.

## Project Overview

The system is built on a relational database model and covers the complete lifecycle of movie ticket booking:

- User login and account creation
- Movie search and listings
- Show date and timing management
- Ticket booking and cancellation
- Feedback submission
- Actor-movie mapping
- Administrative procedures and triggers

## Key Features

- **Relational Database Design** with normalization and foreign key constraints
- **PL/SQL Procedures** for encapsulating core functionalities like login, movie search, booking, cancellation, etc.
- **Triggers** to manage seat updates automatically
- **Sample Data Insertion** for movies, customers, theaters, shows, tickets, and feedback
- **Exception Handling** and user feedback via `DBMS_OUTPUT`

## Tables Defined

- `tbl_customer`: Stores user credentials and personal information
- `tbl_theatre`: Contains theater names and addresses
- `tbl_movie`: Includes movie details like title, genre, duration, etc.
- `tbl_show`: Maps movies to theaters with timing and seat availability
- `tbl_tickets`: Ticket booking data
- `tbl_feedback`: User reviews
- `tbl_actor` & `tbl_movie_actor`: Actor database and movie-cast relationships

## Core Procedures & Triggers

- `login`: User authentication
- `create_account`: New user registration
- `show_films`, `search_movie`: Movie browsing and searching
- `book_ticket`: Ticket booking with pricing and seat check
- `cancel_ticket`: Cancel booked tickets
- `show_feedbacks`, `show_dates_timings`, `get_actors_for_movie`, `print_ticket_details`, `show_bookings_for_customer`: Utility procedures
- `update_seats_left`, `add_seats_back`: Triggers for automatic seat adjustment

## Sample Queries & Test Execution

Test cases are included at the bottom of the file to simulate user login, booking, searching, and feedback management, demonstrating the interaction between database objects and procedures.

## Technologies Used

- Oracle SQL
- PL/SQL (Procedures, Functions, Triggers)
- SQL Developer / TOAD / NetBeans for Oracle (for interaction)

## How to Run

1. Run the SQL script in an Oracle-supported IDE or terminal.
2. Ensure `DBMS_OUTPUT` is enabled to see procedure outputs.
3. Use sample login:  
   - Username: `johndoe`  
   - Password: `password123`

## Acknowledgment

This project was developed solely by **Udita Srivastava** as part of college academic coursework and learning initiatives.
