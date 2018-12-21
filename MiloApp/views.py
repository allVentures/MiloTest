from datetime import date

from django.db import IntegrityError
from django.shortcuts import render
from django.views import View
from MiloApp.forms import RegisterForm
from MiloApp.models import User


class MainPage(View):
    def get(self, request):
        all_users = User.objects.all().order_by('-birthdate')
        for usr in all_users:
            today = date.today()
            if usr.birthdate:
                usr.age = round((today - usr.birthdate).days / 365)
            else:
                usr.age = 0

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


class DeleteUser(View):
    def get(self, request, id):
        person_to_delete = User.objects.get(pk=id)
        person_to_delete.delete()
        msg = "User deleted!"
        ctx = {"msg": msg}
        return render(request, "show_user_details.html", ctx)


class AddNewUser(View):
    def get(self, request):
        form = RegisterForm()
        ctx = {"form": form}
        return render(request, "add_new_person.html", ctx)

    def post(self, request):
        form = RegisterForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data["username"]
            first_name = form.cleaned_data["first_name"]
            last_name = form.cleaned_data["last_name"]
            email = form.cleaned_data["email"]
            password = form.cleaned_data["password"]
            password_check = form.cleaned_data["password_check"]
            birthdate = request.POST.get("birthdate")
            if birthdate == "":
                birthdate = None

            errors = {}
            if password != password_check:
                errors["password"] = "The passwords dont match, please try again!"
                ctx = {"form": form, "errors": errors}
                return render(request, "add_new_person.html", ctx)

            try:
                new_user = User.objects.create_user(
                    username=username,
                    first_name=first_name,
                    last_name=last_name,
                    email=email,
                    password=password,
                    birthdate=birthdate,
                )
                new_user.save()

            except IntegrityError:
                errors["username"] = "This username is already taken, choose a different one!"
            if errors:
                ctx = {"form": form, "errors": errors}
                return render(request, "add_new_person.html", ctx)

            msg = "User Created!"
            ctx = {"form": form, "msg": msg}
            return render(request, "add_new_person.html", ctx)

        else:
            ctx = {"form": form}
            return render(request, "add_new_person.html", ctx)


class ModifyUser(View):
    def get(self, request, id):
        person_to_modify = User.objects.get(pk=id)

        form = RegisterForm(initial={"username": person_to_modify.username,
                                     "first_name": person_to_modify.first_name,
                                     "last_name": person_to_modify.last_name,
                                     "email": person_to_modify.email,
                                     })
        ctx = {"form": form, "modify_user": person_to_modify}
        return render(request, "modify_person.html", ctx)

    def post(self, request, id):
        form = RegisterForm(request.POST)
        person_to_modify = User.objects.get(pk=id)
        if form.is_valid():
            username = form.cleaned_data["username"]
            first_name = form.cleaned_data["first_name"]
            last_name = form.cleaned_data["last_name"]
            email = form.cleaned_data["email"]
            password = form.cleaned_data["password"]
            password_check = form.cleaned_data["password_check"]
            birthdate = request.POST.get("birthdate")
            print("BIRTHDATE:", birthdate)
            if birthdate == "":
                birthdate = None

            errors = {}
            if password != password_check:
                errors["password"] = "The passwords dont match, please try again!"
                ctx = {"form": form, "errors": errors, "modify_user": person_to_modify}
                return render(request, "modify_person.html", ctx)

            try:
                person_to_modify.username=username
                person_to_modify.first_name=first_name
                person_to_modify.last_name=last_name
                person_to_modify.email=email
                person_to_modify.birthdate=birthdate
                person_to_modify.set_password(password)
                person_to_modify.save()

            except IntegrityError:
                errors["username"] = "This username is already taken, choose a different one!"
            if errors:
                ctx = {"form": form, "errors": errors, "modify_user": person_to_modify}
                return render(request, "modify_person.html", ctx)

            msg = "User Updated!"
            ctx = {"form": form, "msg": msg}
            return render(request, "modify_person.html", ctx)

        else:
            ctx = {"form": form, "modify_user": person_to_modify}
            return render(request, "modify_person.html", ctx)