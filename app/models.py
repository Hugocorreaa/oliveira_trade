from django.db import models
from django.contrib.auth.models import AbstractUser

class CustomUser(AbstractUser):
    cpf = models.CharField(max_length=50, default=False)