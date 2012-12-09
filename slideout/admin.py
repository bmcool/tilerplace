from django.contrib import admin
from tiler.admin import BaseLevelAdmin

from slideout.models import *

admin.site.register(SlideoutLevel, BaseLevelAdmin)
