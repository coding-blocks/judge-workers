from django.db import models

# Create your models here.
class Animal(models.Model):
  name = models.CharField(max_length = 1024)
  sound = models.CharField(max_length = 1024)

  def speak(self):
    return f'The {self.name} says \"{self.sound}\"'
    