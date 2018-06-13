from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse


def healthcheck(request):
    return HttpResponse("OK")
