from django.shortcuts import render, redirect
from django.contrib.auth import get_user_model
from django.contrib.auth import authenticate, login, logout



def home(request):
    return render(request, 'index.html')

# User registration form
def create(request):
    return render(request, 'index.html')

# Registration
def store(request):
    data = {}
    
    if(request.POST['password'] != request.POST['password-conf']):
        data['msg'] = 'Passwords are not the same!'
    else:
        User = get_user_model()
        user = User.objects.create_user( request.POST['username'], request.POST['email'], request.POST['password'])
        user.first_name = request.POST['first_name']
        user.last_name = request.POST['last_name']
        user.cpf = request.POST['cpf']
        user.save()
        data['msgsuccess'] = 'Completed registration!'

    return render(request, 'index.html', data)

# Dashboard 
def dashboard(request):
    return render(request, 'dashboard/home.html')

# Login
def user_login(request):
    user = authenticate(username = request.POST['username'], password = request.POST['password'])
    
    if user is not None:
        login(request, user)
        return redirect('/dashboard/')
    else: 
        return render(request, 'dashboard/painel.html')
    
# Logout
def logouts(request):
    logout(request)
    return redirect('/')