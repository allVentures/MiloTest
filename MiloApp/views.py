from datetime import date, timedelta

from django.shortcuts import render
from django.views import View

from MiloApp.models import User


class MainPage(View):
    def get(self, request):
        all_users = User.objects.all().order_by('-birthdate')
        users_age = []
        for usr in all_users:
            today = date.today()
            usr.age = round((today - usr.birthdate).days / 365)

        ctx = {"users": all_users }

        return render(request, "main_page.html", ctx)
