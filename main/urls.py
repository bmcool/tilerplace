from django.conf.urls.defaults import patterns, include, url
from django.contrib import admin
from django.conf.urls.static import static
from django.conf import settings

from mezzanine.core.views import direct_to_template

admin.autodiscover()

urlpatterns = patterns("",
    ("^login/", 'main.views.login'),
    ("^logout/", 'main.views.logout'),
    ("^password_change/", 'main.views.password_change'),
    
    ("^game/slideout/(?P<user_id>\d+)/$", 'slideout.views.game_member'),
    ("^game/slideout/(?P<user_id>\d+)/(?P<level_id>\d+)/$", 'slideout.views.game_level'),
    
    url("^$", 'main.views.home', name="home"),
    ("^admin/orderedmove/", include("order.urls")),
    ("^admin/login/", 'main.views.login'),
    ("^admin/", include(admin.site.urls)),
    url("^$", direct_to_template, {"template": "index.html"}, name="home"),
    ("^", include("mezzanine.urls")),
)

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

handler500 = "mezzanine.core.views.server_error"
