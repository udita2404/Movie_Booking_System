CREATE TABLE tbl_customer (

    customer_id NUMBER,

    customer_name VARCHAR(64) NOT NULL,

    phone_number NUMBER,

    dob DATE,

    email VARCHAR(32),

    username VARCHAR(64) UNIQUE NOT NULL,

    password VARCHAR(256) NOT NULL,

    CONSTRAINT pk_customer PRIMARY KEY (customer_id)

);





CREATE TABLE tbl_theatre (

    theatre_id NUMBER,

    theatre_name VARCHAR(100),

    address VARCHAR(255),

    CONSTRAINT pk_theatre PRIMARY KEY (theatre_id)

);



CREATE TABLE tbl_movie (

    movie_id NUMBER,

    movie_name VARCHAR(100),

    rating VARCHAR(10),

    release_date DATE,

    director VARCHAR(100),

    description VARCHAR(255),

    duration INTERVAL DAY TO SECOND,

    genre VARCHAR(100),

    CONSTRAINT pk_movie PRIMARY KEY (movie_id)

);









CREATE TABLE tbl_feedback (

    feedback_id NUMBER,

    feedback VARCHAR(500),

    movie_id NUMBER,

    customer_id NUMBER,

    CONSTRAINT pk_feedback PRIMARY KEY (feedback_id),

    CONSTRAINT fk_feedback_customer FOREIGN KEY (customer_id) REFERENCES tbl_customer(customer_id),

    CONSTRAINT fk_feedback_movie FOREIGN KEY (movie_id) REFERENCES tbl_movie(movie_id)

);





CREATE TABLE tbl_show (

    show_id NUMBER,

    theatre_id NUMBER,

    movie_id NUMBER,

    show_time TIMESTAMP,

    show_date DATE,

    seats_left NUMBER,

    language VARCHAR(50),

    CONSTRAINT pk_show PRIMARY KEY (show_id),

    CONSTRAINT fk_show_theatre FOREIGN KEY (theatre_id) REFERENCES tbl_theatre(theatre_id),

    CONSTRAINT fk_show_movie FOREIGN KEY (movie_id) REFERENCES tbl_movie(movie_id)

);







CREATE TABLE tbl_tickets (

    ticket_id NUMBER PRIMARY KEY,

    customer_id NUMBER,

    show_id NUMBER,

    noOfSeats NUMBER,

    CONSTRAINT fk_tickets_customer FOREIGN KEY (customer_id) REFERENCES tbl_customer(customer_id),

    CONSTRAINT fk_tickets_show FOREIGN KEY (show_id) REFERENCES tbl_show(show_id)

);





CREATE TABLE tbl_actor (

    actor_id NUMBER PRIMARY KEY,

    actor_name VARCHAR(100),

    gender CHAR(1)

);



CREATE TABLE tbl_movie_actor (

    movie_id NUMBER,

    actor_id NUMBER,

    CONSTRAINT fk_movie_actor_movie FOREIGN KEY (movie_id) REFERENCES tbl_movie(movie_id),

    CONSTRAINT fk_movie_actor_actor FOREIGN KEY (actor_id) REFERENCES tbl_actor(actor_id),

    PRIMARY KEY (movie_id, actor_id)

);





INSERT INTO tbl_customer VALUES (1, 'John Doe', 1234567890, TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'john@example.com', 'johndoe', 'password123');

INSERT INTO tbl_customer VALUES (2, 'Jane Smith', 9876543210, TO_DATE('1985-10-20', 'YYYY-MM-DD'), 'jane@example.com', 'janesmith', 'password456');

INSERT INTO tbl_customer VALUES (3, 'Alice Johnson', 5551234567, TO_DATE('1995-03-25', 'YYYY-MM-DD'), 'alice@example.com', 'alicej', 'password789');

INSERT INTO tbl_customer VALUES (4, 'Bob Brown', 4447891230, TO_DATE('1982-12-12', 'YYYY-MM-DD'), 'bob@example.com', 'bobbrown', 'passwordabc');

INSERT INTO tbl_customer VALUES (5, 'Emily Davis', 3335557777, TO_DATE('1998-08-08', 'YYYY-MM-DD'), 'emily@example.com', 'emilyd', 'passworddef');



-- Sample records for tbl_theatre

INSERT INTO tbl_theatre VALUES (200, 'Cineplex Cinemas', '123 Main St, Cityville, ABC');

INSERT INTO tbl_theatre VALUES (201, 'Regal Cinemas', '456 Elm St, Townsville, XYZ');

INSERT INTO tbl_theatre VALUES (202, 'AMC Theatres', '789 Oak St, Villageton, LMN');

INSERT INTO tbl_theatre VALUES (203, 'Vue Cinemas', '321 Maple St, Countryside, PQR');

INSERT INTO tbl_theatre VALUES (204, 'Odeon Cinemas', '567 Pine St, Mountainview, STU');





-- Sample records for tbl_movie

INSERT INTO tbl_movie VALUES (501, 'The Shawshank Redemption', 'PG-13', TO_DATE('1994-09-23', 'YYYY-MM-DD'), 'Frank Darabont', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', INTERVAL '2:22:00' HOUR TO SECOND, 'Drama');

INSERT INTO tbl_movie VALUES (502, 'The Godfather', 'R', TO_DATE('1972-03-24', 'YYYY-MM-DD'), 'Francis Ford Coppola', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', INTERVAL '2:55:00' HOUR TO SECOND, 'Crime');

INSERT INTO tbl_movie VALUES (503, 'The Dark Knight', 'PG-13', TO_DATE('2008-07-18', 'YYYY-MM-DD'), 'Christopher Nolan', 'When the menace known as The Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.', INTERVAL '2:32:00' HOUR TO SECOND, 'Action');

INSERT INTO tbl_movie VALUES (504, 'Pulp Fiction', 'R', TO_DATE('1994-10-14', 'YYYY-MM-DD'), 'Quentin Tarantino', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', INTERVAL '2:34:00' HOUR TO SECOND, 'Crime');

INSERT INTO tbl_movie VALUES (505, 'Inception', 'PG-13', TO_DATE('2010-07-16', 'YYYY-MM-DD'), 'Christopher Nolan', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', INTERVAL '2:28:00' HOUR TO SECOND, 'Action');

-- Sample records for tbl_feedback

INSERT INTO tbl_feedback VALUES (1, 'Great movie, highly recommended!', 501, 1);

INSERT INTO tbl_feedback VALUES (2, 'The acting was superb!', 502, 2);

INSERT INTO tbl_feedback VALUES (3, 'Loved the special effects!', 503, 3);

INSERT INTO tbl_feedback VALUES (4, 'The storyline was captivating.', 504, 4);

INSERT INTO tbl_feedback VALUES (5, 'Amazing cinematography!', 505, 5);



-- Sample records for tbl_show

INSERT INTO tbl_show VALUES (300, 200, 501, TO_TIMESTAMP('2024-05-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-09', 'YYYY-MM-DD'), 100, 'English');

INSERT INTO tbl_show VALUES (301, 201, 502, TO_TIMESTAMP('2024-05-10 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-10', 'YYYY-MM-DD'), 150, 'English');

INSERT INTO tbl_show VALUES (302, 202, 503, TO_TIMESTAMP('2024-05-11 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-11', 'YYYY-MM-DD'), 120, 'English');

INSERT INTO tbl_show VALUES (303, 203, 504, TO_TIMESTAMP('2024-05-12 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-12', 'YYYY-MM-DD'), 80, 'English');

INSERT INTO tbl_show VALUES (304, 204, 505, TO_TIMESTAMP('2024-05-13 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-13', 'YYYY-MM-DD'), 90, 'English');





-- Sample records for tbl_tickets

INSERT INTO tbl_tickets VALUES (100, 1, 300, 2);

INSERT INTO tbl_tickets VALUES (101, 2, 301, 1);

INSERT INTO tbl_tickets VALUES (102, 3, 302, 3);

INSERT INTO tbl_tickets VALUES (103, 4, 303, 2);

INSERT INTO tbl_tickets VALUES (104, 5, 304, 4);



-- Sample records for tbl_actor

INSERT INTO tbl_actor VALUES (51, 'Tom Hanks', 'M');

INSERT INTO tbl_actor VALUES (52, 'Marlon Brando', 'M');

INSERT INTO tbl_actor VALUES (53, 'Heath Ledger', 'M');

INSERT INTO tbl_actor VALUES (54, 'John Travolta', 'M');

INSERT INTO tbl_actor VALUES (55, 'Leonardo DiCaprio', 'M');

INSERT INTO tbl_actor VALUES (56, 'Morgan Freeman', 'M');



-- Sample records for tbl_movie_actor

INSERT INTO tbl_movie_actor VALUES (501, 51);

INSERT INTO tbl_movie_actor VALUES (501, 56);

INSERT INTO tbl_movie_actor VALUES (505, 56);

INSERT INTO tbl_movie_actor VALUES (502, 52);

INSERT INTO tbl_movie_actor VALUES (503, 53);

INSERT INTO tbl_movie_actor VALUES (504, 54);

INSERT INTO tbl_movie_actor VALUES (505, 55);





--***********************LOGIN FUNCTION ***********************



CREATE OR REPLACE FUNCTION login(p_username IN VARCHAR2, p_password IN VARCHAR2) 

RETURN number AS

  v_password VARCHAR2(256);

  user_id number;

BEGIN

  SELECT password,customer_id INTO v_password ,user_id

  FROM tbl_customer 

  WHERE username = p_username;



  IF v_password IS NULL THEN

    RETURN -1;--'Username does not exist';

  ELSIF v_password != p_password THEN  -- replace this with your password hash comparison logic

    RETURN -2;-- 'Password does not match';

  ELSE

    RETURN user_id;--'Login successful';

  END IF;

EXCEPTION

  WHEN NO_DATA_FOUND THEN

    RETURN -1;--'Username does not exist';

END login;

/



--***********************CREATE ACCOUNT ***********************

CREATE OR REPLACE FUNCTION create_account(p_username IN VARCHAR2, p_password IN VARCHAR2, p_customer_name IN VARCHAR2, p_phone_number IN NUMBER, p_dob IN DATE, p_email IN VARCHAR2) 

RETURN NUMBER AS

  v_customer_id NUMBER;

BEGIN

  SELECT NVL(MAX(customer_id), 0) + 1 INTO v_customer_id FROM tbl_customer;



  INSERT INTO tbl_customer (customer_id, customer_name, phone_number, dob, email, username, password)

  VALUES (v_customer_id, p_customer_name, p_phone_number, p_dob, p_email, p_username, p_password);



  RETURN v_customer_id;

EXCEPTION

  WHEN DUP_VAL_ON_INDEX THEN

    RETURN -1;  -- return -1 if username already exists

END create_account;

/

--***********************SHOW MOVIES PROCEDURE***********************

    CREATE OR REPLACE PROCEDURE show_films(p_loginFlag IN NUMBER) AS

    CURSOR films_cursor IS

        SELECT * FROM tbl_movie;

    film_row tbl_movie%ROWTYPE;

BEGIN

     IF p_loginFlag = 0 THEN

        dbms_output.put_line('You are not logged in');

        RETURN;

    END IF;

    OPEN films_cursor;

    LOOP

        FETCH films_cursor INTO film_row;

        EXIT WHEN films_cursor%NOTFOUND;

        dbms_output.put_line(film_row.movie_id || ' - ' || film_row.movie_name || ' - ' || film_row.release_date || ' - ' ||film_row.director|| ' - '|| film_row.description || ' - '||film_row.duration ||' - '|| film_row.genre  );

        dbms_output.put_line('Remember Movie Id for booking');



       

    END LOOP;

    CLOSE films_cursor;

END;

/

--***********************SEARCH MOVIES PROCEDURE***********************



    CREATE OR REPLACE PROCEDURE search_movie(title_search IN VARCHAR2,p_loginFlag IN NUMBER) AS

    CURSOR movie_cursor IS

        SELECT * FROM tbl_movie WHERE UPPER(movie_name) LIKE '%' || UPPER(title_search) || '%';

    movie_row tbl_movie%ROWTYPE;

    found BOOLEAN := FALSE;

BEGIN

     IF p_loginFlag = 0 THEN

        dbms_output.put_line('You are not logged in');

        RETURN;

    END IF;

    OPEN movie_cursor;

    LOOP

        FETCH movie_cursor INTO movie_row;

        EXIT WHEN movie_cursor%NOTFOUND;

        

        dbms_output.put_line(movie_row.movie_id||' - '||movie_row.movie_name || ' - ' || movie_row.release_date || ' - ' || movie_row.director || ' - ' || movie_row.description || ' - ' || movie_row.duration || ' - ' || movie_row.genre);

        dbms_output.put_line('Remember Movie Id for booking');

        found := TRUE;

    END LOOP;

    

    IF NOT found THEN

        dbms_output.put_line('NOT FOUND MOVIE WITH THIS NAME');

    END IF;

    

    CLOSE movie_cursor;

END;

/



    --***********************SHOW FEEDBACK PROCEDURE ***********************



    CREATE OR REPLACE PROCEDURE show_feedbacks(movie_id IN NUMBER,p_loginFlag IN NUMBER) AS

    CURSOR feedback_cursor IS

        SELECT * FROM tbl_feedback WHERE movie_id = show_feedbacks.movie_id;

    feedback_row tbl_feedback%ROWTYPE;

BEGIN

     IF p_loginFlag = 0 THEN

        dbms_output.put_line('You are not logged in');

        RETURN;

    END IF;

    OPEN feedback_cursor;

    LOOP

        FETCH feedback_cursor INTO feedback_row;

        EXIT WHEN feedback_cursor%NOTFOUND;

        dbms_output.put_line(feedback_row.feedback);

        -- Add more details as needed

    END LOOP;

    CLOSE feedback_cursor;

END;

/

    

-- ****************Show Dates and Timings****************:

CREATE OR REPLACE PROCEDURE show_dates_timings(p_movie_id IN NUMBER,p_loginFlag IN NUMBER) AS

    CURSOR timing_cursor IS

        SELECT * FROM tbl_show WHERE movie_id = p_movie_id;

    timing_row tbl_show%ROWTYPE;

BEGIN

     IF p_loginFlag = 0 THEN

        dbms_output.put_line('You are not logged in');

        RETURN;

    END IF;

    OPEN timing_cursor;

    LOOP

        FETCH timing_cursor INTO timing_row;

        EXIT WHEN timing_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(timing_row.show_id||' - ' ||timing_row.show_date || ' - ' || timing_row.show_time);

    END LOOP;

    CLOSE timing_cursor;

END;

/



-- ****************BOOK TICKETSs****************:



--    CREATE OR REPLACE PROCEDURE book_ticket (p_customer_id IN NUMBER,p_show_id IN NUMBER, p_no_of_seats IN NUMBER,p_loginFlag IN NUMBER) IS

--    v_seats_left NUMBER;

--    v_new_ticket_id NUMBER;

--BEGIN

--     IF p_loginFlag = 0 THEN

--        dbms_output.put_line('You are not logged in');

--        RETURN;

--    END IF;

--    -- Check the number of seats left for the show

--    SELECT seats_left INTO v_seats_left FROM tbl_show WHERE show_id = p_show_id;

--

--    -- If enough seats are available, book the ticket

--    IF v_seats_left >= p_no_of_seats THEN

--        -- Generate a new ticket_id by incrementing the last known one

--        SELECT NVL(MAX(ticket_id), 0) + 1 INTO v_new_ticket_id FROM tbl_tickets;

--

--        -- Insert a new record into tbl_tickets

--        INSERT INTO tbl_tickets (ticket_id,customer_id, show_id, noOfSeats)

--        VALUES (v_new_ticket_id,p_customer_id, p_show_id, p_no_of_seats);

--

--        -- Update the number of seats left for the show

--        UPDATE tbl_show SET seats_left = seats_left - p_no_of_seats WHERE show_id = p_show_id;

--

--        DBMS_OUTPUT.PUT_LINE('Ticket booked successfully. Your ticket ID is ' || v_new_ticket_id||' Amount to be paid '||p_no_of_seats*200||' Rupees ');

--    ELSE

--        DBMS_OUTPUT.PUT_LINE('Not enough seats available.');

--    END IF;

--EXCEPTION

--    WHEN NO_DATA_FOUND THEN

--        DBMS_OUTPUT.PUT_LINE('Invalid show ID.');

--    WHEN OTHERS THEN

--        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);

--END book_ticket;

--/

-- ****************BOOK TICKETSs WITH TRIGGER****************:





    CREATE OR REPLACE PROCEDURE book_ticket (

    p_customer_id   IN NUMBER,

    p_show_id       IN NUMBER,

    p_no_of_seats   IN NUMBER,

    p_loginFlag     IN NUMBER

) IS

    v_seats_left    NUMBER;

    v_new_ticket_id NUMBER;

BEGIN

    IF p_loginFlag = 0 THEN

        dbms_output.put_line('You are not logged in');

        RETURN;

    END IF;



    -- Check the number of seats left for the show

    SELECT seats_left INTO v_seats_left FROM tbl_show WHERE show_id = p_show_id;



    -- If enough seats are available, book the ticket

    IF v_seats_left >= p_no_of_seats THEN

        -- Generate a new ticket_id by incrementing the last known one

        SELECT NVL(MAX(ticket_id), 0) + 1 INTO v_new_ticket_id FROM tbl_tickets;



        -- Insert a new record into tbl_tickets

        INSERT INTO tbl_tickets (ticket_id, customer_id, show_id, noOfSeats)

        VALUES (v_new_ticket_id, p_customer_id, p_show_id, p_no_of_seats);



        -- Output ticket information

        DBMS_OUTPUT.PUT_LINE('Ticket booked successfully. Your ticket ID is ' || v_new_ticket_id || ' Amount to be paid ' || p_no_of_seats * 200 || ' Rupees ');

    ELSE

        DBMS_OUTPUT.PUT_LINE('Not enough seats available.');

    END IF;

EXCEPTION

    WHEN NO_DATA_FOUND THEN

        DBMS_OUTPUT.PUT_LINE('Invalid show ID.');

    WHEN OTHERS THEN

        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);

END book_ticket;

/



    CREATE OR REPLACE TRIGGER update_seats_left

AFTER INSERT ON tbl_tickets

FOR EACH ROW

BEGIN

    UPDATE tbl_show

    SET seats_left = seats_left - :NEW.noOfSeats

    WHERE show_id = :NEW.show_id;

END;

/





-- ****************CANCEL TICKETSs****************:

--

--    CREATE OR REPLACE PROCEDURE cancel_ticket(p_ticket_id IN NUMBER,p_loginFlag IN NUMBER) AS

--    v_show_id NUMBER;

--    v_no_of_seats NUMBER;

--BEGIN

--     IF p_loginFlag = 0 THEN

--        dbms_output.put_line('You are not logged in');

--        RETURN;

--    END IF;

--    -- Retrieve the show_id and noOfSeats for the ticket

--    SELECT show_id, noOfSeats INTO v_show_id, v_no_of_seats FROM tbl_tickets WHERE ticket_id = p_ticket_id;

--

--    -- Add the seats back to the show

--    UPDATE tbl_show SET seats_left = seats_left + v_no_of_seats WHERE show_id = v_show_id;

--

--    -- Delete the ticket

--    DELETE FROM tbl_tickets WHERE ticket_id = p_ticket_id;

--

--    DBMS_OUTPUT.PUT_LINE('Ticket cancelled successfully. Amount to be refunded '||V_no_of_seats*200||' Rupees ');

--

--EXCEPTION

--    WHEN NO_DATA_FOUND THEN

--        DBMS_OUTPUT.PUT_LINE('Invalid ticket ID.');

--    WHEN OTHERS THEN

--        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);

--END cancel_ticket;

--/

--

-- ****************CANCEL TICKETS using triggers****************:

    CREATE OR REPLACE TRIGGER add_seats_back

AFTER DELETE ON tbl_tickets

FOR EACH ROW

BEGIN

    UPDATE tbl_show

    SET seats_left = seats_left + :OLD.noOfSeats

    WHERE show_id = :OLD.show_id;

END;

/





--    CREATE OR REPLACE PROCEDURE cancel_ticket (

--    p_logged_in_user IN NUMBER,

--    p_ticket_id   IN NUMBER,

--    p_loginFlag   IN NUMBER

--) AS

--    v_logged_in_user IN NUMBER:

--    v_show_id      NUMBER;

--    v_no_of_seats  NUMBER;

--BEGIN

--    IF p_loginFlag = 0 THEN

--        dbms_output.put_line('You are not logged in');

--        RETURN;

--    END IF;

--

--    -- Retrieve the show_id and noOfSeats for the ticket

--    SELECT show_id, noOfSeats INTO v_show_id, v_no_of_seats FROM tbl_tickets WHERE ticket_id = p_ticket_id;

--

--    -- Delete the ticket

--	

--    DELETE FROM tbl_tickets WHERE ticket_id = p_ticket_id;

--

--    DBMS_OUTPUT.PUT_LINE('Ticket cancelled successfully. Amount to be refunded ' || v_no_of_seats * 200 || ' Rupees ');

--

--EXCEPTION

--    WHEN NO_DATA_FOUND THEN

--        DBMS_OUTPUT.PUT_LINE('Invalid ticket ID.');

--    WHEN OTHERS THEN

--        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);

--END cancel_ticket;

--/



    CREATE OR REPLACE PROCEDURE cancel_ticket (

    p_logged_in_user IN NUMBER,

    p_ticket_id      IN NUMBER,

    p_loginFlag      IN NUMBER

) AS

    v_show_id      NUMBER;

    v_no_of_seats  NUMBER;

    v_customer_id  NUMBER;

BEGIN

    IF p_loginFlag = 0 THEN

        dbms_output.put_line('You are not logged in');

        RETURN;

    END IF;



    -- Retrieve the show_id, noOfSeats, and customer_id for the ticket

    SELECT show_id, noOfSeats, customer_id

    INTO v_show_id, v_no_of_seats, v_customer_id

    FROM tbl_tickets

    WHERE ticket_id = p_ticket_id;



    -- Check if the logged-in user is the owner of the ticket

    IF v_customer_id <> p_logged_in_user THEN

        dbms_output.put_line('UNSUCCESSFUL!!!!You can only cancel your own tickets');

        RETURN;

    END IF;



    -- Delete the ticket

    DELETE FROM tbl_tickets WHERE ticket_id = p_ticket_id;



    DBMS_OUTPUT.PUT_LINE('Ticket cancelled successfully. Amount to be refunded ' || v_no_of_seats * 200 || ' Rupees ');



EXCEPTION

    WHEN NO_DATA_FOUND THEN

        DBMS_OUTPUT.PUT_LINE('Invalid ticket ID.');

    WHEN OTHERS THEN

        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);

END cancel_ticket;

/



    --*****************************SOME MORE PROCEDURES*****************************

    --GETS THE CAST OF THE MOVIE

        CREATE OR REPLACE PROCEDURE get_actors_for_movie(movie_id_in IN NUMBER)

IS

BEGIN

    FOR actor_rec IN (

        SELECT a.actor_name

        FROM tbl_movie_actor ma

        JOIN tbl_actor a ON ma.actor_id = a.actor_id

        WHERE ma.movie_id = movie_id_in

    )

    LOOP

        DBMS_OUTPUT.PUT_LINE('Actor Name: ' || actor_rec.actor_name);

    END LOOP;

END;

/



-- PRINTS ADDRESS OF THE THEATRE FOR GIVEN TICKET NUMBER

 CREATE OR REPLACE PROCEDURE print_ticket_details(

    ticket_id_in IN NUMBER

)

IS

    v_show_time TIMESTAMP;

    v_show_date DATE;

    v_theatre_address VARCHAR2(100);

BEGIN

    SELECT s.show_time, s.show_date, t.address

    INTO v_show_time, v_show_date, v_theatre_address

    FROM tbl_tickets tk

    JOIN tbl_show s ON tk.show_id = s.show_id

    JOIN tbl_theatre t ON s.theatre_id = t.theatre_id

    WHERE tk.ticket_id = ticket_id_in;



    DBMS_OUTPUT.PUT_LINE('Show Time: ' || TO_CHAR(v_show_time, 'HH:MI AM'));

    DBMS_OUTPUT.PUT_LINE('Show Date: ' || TO_CHAR(v_show_date, 'YYYY-MM-DD'));

    DBMS_OUTPUT.PUT_LINE('Theatre Address: ' || v_theatre_address);

EXCEPTION

    WHEN NO_DATA_FOUND THEN

        DBMS_OUTPUT.PUT_LINE('Ticket ID ' || ticket_id_in || ' not found.');

END;

/



--PRINTS ALL THE MOVIES BOOKED BY A CUSTOMER

CREATE OR REPLACE PROCEDURE show_bookings_for_customer(

    customer_id_in IN NUMBER

)

IS

BEGIN

    FOR show_rec IN (

        SELECT s.show_date, s.show_time, t.address, m.movie_name

        FROM tbl_tickets tk

        JOIN tbl_show s ON tk.show_id = s.show_id

        JOIN tbl_theatre t ON s.theatre_id = t.theatre_id

        JOIN tbl_movie m ON s.movie_id = m.movie_id

        WHERE tk.customer_id = customer_id_in

    )

    LOOP

        DBMS_OUTPUT.PUT_LINE('Movie: ' || show_rec.movie_name);

        DBMS_OUTPUT.PUT_LINE('Show Time: ' || TO_CHAR(show_rec.show_time, 'HH:MI AM'));

        DBMS_OUTPUT.PUT_LINE('Show Date: ' || TO_CHAR(show_rec.show_date, 'YYYY-MM-DD'));

        DBMS_OUTPUT.PUT_LINE('Theatre Address: ' || show_rec.address);

        DBMS_OUTPUT.PUT_LINE('----------------------------------');

    END LOOP;



    IF SQL%NOTFOUND THEN

        DBMS_OUTPUT.PUT_LINE('No bookings found for customer ID ' || customer_id_in);

    END IF;

EXCEPTION

    WHEN NO_DATA_FOUND THEN

        DBMS_OUTPUT.PUT_LINE('No data found for customer ID ' || customer_id_in);

END;

/



--***********************final procedure ***********************

DECLARE

    returnVal NUMBER;

    loginFlag NUMBER := 0;

    enteredChoice NUMBER;

    loggedInUser NUMBER;

    v_number NUMBER;

    input_search VARCHAR(30);

    input_movie_id NUMBER;

    input_show_id NUMBER;

    input_no_of_seats NUMBER;

    input_ticket_id NUMBER;





BEGIN

    

    enteredChoice :=2;



    --WHEN USER DECIDES TO CREATE ACCOUNT

    IF enteredChoice = 1 THEN

        returnVal := create_account('MarySmith', 'password', 'Mary Smith', 9988665544, TO_DATE('1992-01-04', 'YYYY-MM-DD'), 'Marysmith123@qwe.com');



        IF returnVal = -1 THEN

            dbms_output.put_line('Username already exists, try to login again');

            RETURN;

        ELSE 	

            DBMS_OUTPUT.PUT_LINE('Account Created and Logged in Successfully');

            loggedInUser := returnVal;

            loginFlag := 1;

            DBMS_OUTPUT.PUT_LINE(loggedInUser);

        END IF;



--WHEN USER DECIDES TO LOGIN

    ELSIF enteredChoice = 2 THEN

  

        returnVal := login('johndoe', 'password123');

        

        IF returnVal = -1 THEN

            DBMS_OUTPUT.PUT_LINE('Username does not exist');

        ELSIF returnVal = -2 THEN

            DBMS_OUTPUT.PUT_LINE('Password does not match');

        ELSE

            DBMS_OUTPUT.PUT_LINE('Login Successful!');

            loggedInUser := returnVal;

            loginFlag := 1;

        END IF;

    END IF;



    

v_number:=7;

    CASE v_number

        WHEN 1 THEN

            show_films(loginFlag); 

        WHEN 2 THEN

            search_movie('IncePtIon', loginFlag);

        WHEN 3 THEN

            show_dates_timings(502, loginFlag);

        WHEN 4 THEN

            show_feedbacks(503, loginFlag);

        WHEN 5 THEN

            book_ticket(loggedInUser, 301, 20, loginFlag);

        WHEN 6 THEN

            cancel_ticket(loggedInUser,105, loginFlag);

		WHEN 7 THEN

            show_bookings_for_customer(loggedInUser);

		WHEN 8 THEN

			print_ticket_details(103);

		WHEN 9 THEN

			get_actors_for_movie(501);



        ELSE

            DBMS_OUTPUT.PUT_LINE('Number not in range 1-6');

    END CASE;

END;

/







    select * from tbl_show;

select * from tbl_customer;

select * from tbl_tickets;