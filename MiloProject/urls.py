"""MiloProject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf import settings
from django.conf.urls import url
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, re_path
from MiloApp.views import MainPage, ShowUserDetails, DeleteUser, AddNewUser

urlpatterns = [
    path('admin/', admin.site.urls),
    url(r'^$', MainPage.as_view(), name="main_page"),
    re_path(r'^show_person_details/(?P<id>[0-9]+)$', ShowUserDetails.as_view()),
    re_path(r'^delete_person/(?P<id>[0-9]+)$', DeleteUser.as_view()),
    re_path('new', AddNewUser.as_view()),

]
