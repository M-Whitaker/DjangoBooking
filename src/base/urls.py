from django.urls import path

from . import views

urlpatterns = [
    path("", views.ShowHelloWorld.as_view(), name="home"),
]
