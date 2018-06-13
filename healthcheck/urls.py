from django.conf.urls import url

from . import views

urlpatterns = [
    # ex: /
    url(r'^$', views.healthcheck, name='healthcheck'),
]
