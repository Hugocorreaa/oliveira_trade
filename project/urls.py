from django.contrib import admin
from django.urls import path
from app.views import home, create, store, user_login, dashboard, logouts

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', home),
    path('create/', create),
    path('store/', store),
    path('login/', user_login),
    path('dashboard/', dashboard),
    path('logouts/', logouts)
    
]
