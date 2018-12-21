import random
from MiloApp.models import User
from faker import Faker

# Generate 20 fake users
fake = Faker('pl_PL')
username_base = "user"

for x in range(1, 21):
    email = fake.email()
    first_name = fake.first_name()
    last_name = fake.last_name()
    birthdate = fake.date_between(start_date="-50y", end_date="-20y")
    rnd = random.randint(1, 100)
    User.objects.create_user(
        username=username_base + str(x),
        password="user1234",
        first_name=first_name,
        last_name=last_name,
        email=email,
        birthdate=birthdate,
        random_number=rnd,
    )

# python3 manage.py shell < working_scripts.py
