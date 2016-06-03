README

https://sagefamilychiropractic.herokuapp.com

**** Elevator Pitch ****

Low impact Family Chiropractic website for appointment scheduling and email notifications. Emails will be generated when booked and bookings will update in realtime to prevent double booking. Site will show specials being run, services offered, and prior appointments booked.


**** Technologies Used ****
Ruby
Rails
jQuery
PostgreSQL


A list of installation steps for the app itself and any dependencies - how would another developer run your site locally?


**** User Story ****
User comes to page and selects sign up. Alternatively there is an option to sign in, which (if selected) will route the user to their profile page. User is brought to a signup page with a form that contains first name, last name, email address, phone number, and password. User enters information (or selects cancel which routes the user to the homepage), selects submit and is rerouted to user profile page. On user profile page, user information is displayed on left (with edit button which pops up modal), bottom shows appointment history, and right shows an image (when selected) routes to the new appointment page. User selects a date and time (1 hour slots) from 9am to 5pm of open appointment times. User also has option to cancel which will route user to profile page. If user books appointment time, an email is sent to user confirming appointment time on appointment booking and 24 hours prior to appointment.

Link to your wireframes – sketches of major views / interfaces in your application.

Link to your entity relationship diagrams – plan out your data relationships before coding.



Descriptions of any unsolved problems or future features.

Validation needs debug
Prepend rendered data of past appointments.
Add delete function for appointments.
Add 24 hour reminder email notification.
