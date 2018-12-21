from datetime import date, timedelta

from django.shortcuts import render
from django.views import View

from MiloApp.models import User


class MainPage(View):
    def get(self, request):
        all_users = User.objects.all().order_by('-birthdate')
        for usr in all_users:
            today = date.today()
            usr.age = round((today - usr.birthdate).days / 365)
            if usr.random_number % 5 == 0 and usr.random_number % 3 == 0:
                usr.bizz = 53
            elif usr.random_number % 5 == 0:
                usr.bizz = 5
            elif usr.random_number % 3 == 0:
                usr.bizz = 3
            else:
                usr.bizz = 0

        ctx = {"users": all_users}
        return render(request, "main_page.html", ctx)


class ShowUserDetails(View):
    def get(self, request, id):
        user_data = User.objects.get(id=id)

        ctx = {"user_data": user_data}

        return render(request, "show_user_details.html", ctx)
