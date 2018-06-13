from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
import os


def healthcheck(request):
    hostname = os.uname()[1]
    return HttpResponse("Hello, from {}".format(hostname))
