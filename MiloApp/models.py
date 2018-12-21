import random
from django.contrib.auth.models import AbstractUser
from django.db import models


class User(AbstractUser):
    rnd = random.randint(1, 100)
    birthdate = models.DateField(null=True)
    random_number = models.IntegerField(default=rnd)
