from django.urls import path
from isoapp import views

urlpatterns = [
    path('', views.login),
    path('signout/', views.signout),
    path('dashboard/', views.dashboard),
    path('user-list/', views.user_list),
    path('user-add/', views.user_add),
    path('gift-card-list/', views.gift_card_list),
    path('gift-card-generate/', views.gift_card_generate),
    path('product-category-list/', views.product_category_list),
    path('product-categroy-add/', views.product_category_add),
    path('product-list/', views.product_list),
    path('product-setup/', views.product_setup),
    path('discount-list/', views.discount_list),
    path('discount-setup/', views.discount_setup),
    path('stock-information/', views.stock_information),
    path('purchase-history/', views.purchase_history),
    path('purchase-product/', views.purchase_product),
    path('sales/', views.sales),
    path('get-gift-card-amount/', views.get_gift_card_amount),
    path('get-discount/', views.get_discount_amount),
    path('convert-amount/', views.convert_amount),
    path('sales-history/', views.sales_history),
    path('invoice-print/<str:invoice_no>/', views.invoice_print),
]
