# Django Flutter OAuth2 login demo

## Flutter + Django REST Framework + OAuth2.0 (Resource Owner Password Credentials Grant) + SQLite3

This is a demo project to show how to implement OAuth2.0 authentication in a Flutter app using Django REST Framework as the backend.
This project uses **Resource Owner Password Credentials Grant** flow.

### Demo

<video width="320" height="240" controls>
  <source src="https://cdn.discordapp.com/attachments/492188265487532032/1100053480141500467/django-flutter-oauth2.mp4" type="video/mp4" alt="video demonstration">
</video>

sorry for the bad quality / aspect ratio

## How to run

Set up the Django backend:

### Install dependencies

```bash
pip install -r requirements.txt
```

### Migrate

```bash
python manage.py migrate
```

### Create superuser

```bash
python manage.py createsuperuser
```

### Run server

```bash
python manage.py runserver
```

### Add oauth provider application

[http://127.0.0.1:8000/admin/oauth2_provider/application/add/](http://127.0.0.1:8000/admin/oauth2_provider/application/add/)
- Client type: Confidential
- Authorization grant type: Resource owner password-based

Copy the client id and client secret to the `flutter/lib/oauth2_login.dart` file.

Now you should be ready to go!

## Credits

This project is heavily based on:

- [Notes_Management_Flutter_Django](https://github.com/Qbason/Notes_Management_Flutter_Django)
  by [Qbason](https://github.com/Qbason/)
