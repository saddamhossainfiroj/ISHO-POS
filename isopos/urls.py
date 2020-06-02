from django.contrib import admin
from django.urls import include, path
from django.conf import settings
from django.conf.urls.static import static

admin.site.site_header = "ISHO Pont of Sale Admin"
admin.site.site_title = "ISHO Pont of Sale Admin"

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('isoapp.urls')),
    path('/', include('isoapp.urls')),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
