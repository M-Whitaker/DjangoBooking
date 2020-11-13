from django.urls import path

from . import views

urlpatterns = [
    path("", views.BookingHome.as_view(), name="booking"),
]
