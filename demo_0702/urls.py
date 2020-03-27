"""demo_0702 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
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
from django.contrib import admin
from django.urls import path
from userApp import views
urlpatterns = [
    path('admin/', admin.site.urls),
    path('',views.index),
    path('index', views.index),
    path('index.html',views.index),
    path('data_mining.html', views.datamining),
    path('data_display.html', views.products),
    path('chart_display_send.html', views.add_product),
    path('insert_data.html', views.edit_product),
    path('login.html', views.login),
    path('userLogin',views.login),
    path('userRegister',views.userregister),
    path('register2db',views.register2db),
    path('logout',views.logoutView),
    path('crawlInfo',views.crawlInfo),
    path('data_cleaning.html',views.datacleaning),
    path('dataclean',views.dataclean),
    path('listing',views.listing),
    path('chart_display.html',views.chartdisplay),
    path('temp.html',views.temp),
    path('data/',views.get_data),
    path('update_data.html',views.updatedata),
    path('insertdata',views.insertdata),
    path('chart_display_send.html',views.chartdisplay),
    path('showdata/',views.chartdisplay)
]
