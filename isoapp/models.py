from django.db import models

# Create your models here.

class UserInfo(models.Model):
    user_name           = models.CharField(max_length = 30, unique = True)
    full_name           = models.CharField(max_length = 50)
    user_img            = models.ImageField(upload_to='user_images', blank=True)
    user_email          = models.CharField(max_length = 100, blank = True, null = True)
    user_mobile         = models.CharField(max_length = 15, blank = True, null = True)
    user_countries = (
        ('Bangladesh', 'Bangladesh'),
        ('USA', 'USA'),
    )
    user_country        = models.CharField(max_length = 50, choices = user_countries)
    user_pass           = models.CharField(max_length = 200)
    address             = models.TextField(blank = True)
    added_by            = models.CharField(max_length = 30)
    status              = models.BooleanField(default = True) 

    def __str__(self):
        return self.user_name

    class Meta:
        verbose_name = "User"
        verbose_name_plural = "User Information" 

class ProductCategory(models.Model):
    category_name    = models.CharField(max_length = 50, unique=True)
    remark       = models.TextField(max_length = 100, blank = True)
    added_by     = models.ForeignKey(UserInfo, on_delete = models.CASCADE)
    status       = models.BooleanField(default = True) 

    def __str__(self):
        return str(self.category_name) 

    class Meta:
        verbose_name = "product category"
        verbose_name_plural = "product category" 

class ProductSetup(models.Model):
    product_name       = models.CharField(max_length = 50)
    category_name    = models.ForeignKey(ProductCategory, on_delete = models.CASCADE)    
    barcode          = models.CharField(max_length = 50, unique=True)
    bdt_unit_price   = models.FloatField(default=0)
    unit_sales_price = models.FloatField(default=0)
    remark           = models.TextField(max_length = 100, blank = True)
    added_by         = models.ForeignKey(UserInfo, on_delete = models.CASCADE)
    added_date       = models.DateTimeField(auto_now_add = True)
    updated_date     = models.DateTimeField(auto_now_add = False, blank = True, null = True)
    status           = models.BooleanField(default = True) 

    def __str__(self):
        return str(self.product_name) 

    class Meta:
        verbose_name = "Product Setup"
        verbose_name_plural = "Product Setup" 

class DiscountSetup(models.Model):
    store_countries = (
        ('Bangladesh', 'Bangladesh'),
        ('USA', 'USA'),
    )
    store_country    = models.CharField(max_length = 50, choices = store_countries)   
    discount_months = (
        ('1', 'January'),
        ('2', 'February'),
        ('3', 'March'),
        ('4', 'April'),
        ('5', 'May'),
        ('6', 'June'),
    )
    discount_month    = models.CharField(max_length = 50, choices = discount_months)   
    discount_parcentage = models.FloatField(default=0)
    start_amount     = models.FloatField(default=0)
    end_amount       = models.FloatField(default=0)
    remark           = models.TextField(max_length = 100, blank = True)
    added_by         = models.ForeignKey(UserInfo, on_delete = models.CASCADE)
    added_date       = models.DateTimeField(auto_now_add = True)
    status           = models.BooleanField(default = True) 

    class Meta:
        verbose_name = "Discount Setup"
        verbose_name_plural = "Discount Setup" 

class GiftCardGenerate(models.Model):   
    card_number      = models.CharField(max_length = 50, unique=True)
    amount           = models.FloatField(default=0)
    remark           = models.TextField(max_length = 100, blank = True)
    added_by         = models.ForeignKey(UserInfo, on_delete = models.CASCADE)
    added_date       = models.DateTimeField(auto_now_add = True)
    status           = models.BooleanField(default = False) 

    def __str__(self):
        return str(self.card_number) 

    class Meta:
        verbose_name = "Gift Card  Generate"
        verbose_name_plural = "Gift Card  Generate" 

class StockInfo(models.Model):
    added_by                = models.ForeignKey(UserInfo, on_delete = models.CASCADE)
    product_name            = models.ForeignKey(ProductSetup, on_delete = models.CASCADE)
    available_quantity      = models.IntegerField(default=0) #Current available Quantity
    stock_quantity          = models.IntegerField(default=0) #Total stock quantity
    update_by               = models.IntegerField(default=0) #update by
    remark                  = models.TextField(max_length = 100, blank = True)
    added_date              = models.DateTimeField(auto_now_add = True)
    updated_date            = models.DateTimeField(auto_now_add = False, blank = True, null = True)
    status                  = models.BooleanField(default = True) 

    def __str__(self):
        return str(self.product_name) 

    class Meta:
        verbose_name = "Stock Information"
        verbose_name_plural = "Stock Information"

class PurchaseHistory(models.Model):
    added_by                = models.ForeignKey(UserInfo, on_delete = models.CASCADE)
    product_name            = models.ForeignKey(ProductSetup, on_delete = models.CASCADE)
    purchase_quantity       = models.IntegerField(default=0) 
    remark                  = models.TextField(max_length = 100, blank = True)
    added_date              = models.DateTimeField(auto_now_add = True)
    status                  = models.BooleanField(default = True) 

    def __str__(self):
        return str(self.product_name) 

    class Meta:
        verbose_name = "Purchase Information"
        verbose_name_plural = "Purchase Information"

class Sales(models.Model):
    invoice_no      = models.CharField(max_length = 30, unique=True)
    added_by        = models.ForeignKey(UserInfo, on_delete = models.CASCADE)
    total_price     = models.FloatField(default=0) 
    vat_amount      = models.FloatField(default=0) 
    discount_amount = models.FloatField(default=0) 
    net_price       = models.FloatField(default=0) 
    paid_amount     = models.FloatField(default=0) 
    remark          = models.TextField(max_length = 500, blank = True)
    added_date      = models.DateTimeField(auto_now_add = True)
    status          = models.BooleanField(default = True) 

    def __str__(self):
        return str(self.invoice_no) 

    class Meta:
        verbose_name = "Sales"
        verbose_name_plural = "Sales"

class SalesHistory(models.Model):
    invoice_no      = models.CharField(max_length = 30)
    added_by        = models.ForeignKey(UserInfo, on_delete = models.CASCADE)
    product_name    = models.ForeignKey(ProductSetup, on_delete = models.CASCADE)
    sales_quantity  = models.IntegerField(default=0) 
    sales_price     = models.FloatField(default=0) 
    total_price     = models.FloatField(default=0) 
    added_date      = models.DateTimeField(auto_now_add = True)
    status          = models.BooleanField(default = True) 

    def __str__(self):
        return str(self.product_name) 

    class Meta:
        verbose_name = "Sales History"
        verbose_name_plural = "Sales History"
