TASK
1. Set up a basic (latest or LTS) Django installation
2. Extend the User model to have (yes, custom user model is the way to go):
a. a birthday field of type date
b. a random number field of type integer that is assigned a value from 1-100 on creation
Do the changes in user model in a few steps - we want you to use schema migrations here.
3. Create views for: list of all users, viewing, adding, editing and deleting a single user
4. Create two template tags:
a. a tag that will display "allowed" if the user is > 13 years old otherwise display
"blocked"
b. A tag that will display the BizzFuzz result of the random number that was generated
for the user. The BizzFuzz specification is that for multiples of three print "Bizz" instead of the
number and for the multiples of five print "Fuzz". For numbers which are multiples of both three
and five print "BizzFuzz"
c. Add a column to the list view after the birthday column that uses the allowed/blocked
tag
d. Add a column to the list view after the random number column that uses the
BizzFuzz tag
5. Unit test what you feel is appropriate to test.
