from django.views.generic import View
from django.shortcuts import render


class BookingHome(View):

    def get(self, request, *args, **kwargs):
        return render(request, "booking/booking.html", context={})
