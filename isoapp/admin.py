from django.contrib import admin
from . import models

# Register your models here.
admin.site.register(models.GiftCardGenerate)
admin.site.register(models.DiscountSetup)
admin.site.register(models.ProductCategory)
admin.site.register(models.UserInfo)
admin.site.register(models.StockInfo)
admin.site.register(models.PurchaseHistory)
admin.site.register(models.SalesHistory)
admin.site.register(models.ProductSetup)

