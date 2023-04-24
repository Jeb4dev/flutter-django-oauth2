from django.urls import path,include
from .views import NotesViewSet,UserViewSet
from rest_framework.routers import DefaultRouter
from rest_framework.documentation import include_docs_urls
from rest_framework.authentication import BasicAuthentication
from rest_framework.permissions import IsAuthenticated

router = DefaultRouter()

router.register(
    r'notes',
    NotesViewSet,
    basename='notes'
)
router.register(
    r'user',
    UserViewSet,
    basename='user'
)


urlpatterns = [
    path('',include(router.urls)),
    path(r'docs/', include_docs_urls(title='Polls API',public=True,authentication_classes=[BasicAuthentication],permission_classes=[IsAuthenticated]))

]