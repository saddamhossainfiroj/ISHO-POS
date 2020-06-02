from django.shortcuts import render, redirect
from django import template
from . import models
from django.conf import settings
import hashlib, socket
from django.template.loader import get_template
from django.views.decorators.csrf import csrf_exempt
from django.urls import reverse
from django.contrib.auth.hashers import PBKDF2PasswordHasher
from django.contrib import messages
from datetime import date
import datetime
from django.db.models import Sum,F,Q
from django.http import JsonResponse, HttpResponse, Http404
from django.core.serializers import json 
from django.http import HttpResponse
from django.views.generic import View
from isoapp.utils import render_to_pdf
import urllib
import requests

# Create your views here.
def login(request):
    if request.method == "POST":
        username     = request.POST["username"].strip()
        password = request.POST["password"]

        hasher = PBKDF2PasswordHasher()
        password = hasher.encode(password = request.POST["password"], salt='salt', iterations=50000)
        
        chk_user = models.UserInfo.objects.filter(user_name = username, user_pass = password).first()
        if chk_user:
            request.session["user_name_id"] = chk_user.pk
            request.session["full_name"] = chk_user.full_name
            request.session["country"] = chk_user.user_country
            return redirect("/dashboard/") 
        else:
            messages.warning(request, "User ID or Password is invalid")
            return render(request, 'isoapp/common/login.html')
    return render(request, 'isoapp/common/login.html')

def signout(request):  
    try:
        return redirect("/")
    except:
        return redirect("/")

def dashboard(request):
    return render(request, 'isoapp/common/index.html')

def usd_to_bd(amount):
    response = requests.post('http://data.fixer.io/api/latest?access_key=e7546ef7cada53aeea71524d9176e113&format=1') 
    if response.status_code == 200:
        data = response.json()
        usd = round((amount/data["rates"]["USD"]*data["rates"]["BDT"])) 
        return usd
    else: 
        return amount

def user_list(request):
    user_list = models.UserInfo.objects.all()
    return render(request, 'isoapp/common/user_list.html', {'user_list': user_list})

def user_add(request):
    if request.method == "POST":
        user_name     = request.POST["user_name"].strip()
        user_country = request.POST["user_country"]
        full_name = request.POST["full_name"]
        user_mobile = request.POST["user_mobile"]
        user_email = request.POST["user_email"]
        address = request.POST["address"]

        hasher = PBKDF2PasswordHasher()
        password = hasher.encode(password = request.POST["user_name"], salt='salt', iterations=50000)
        print("password : ", password)
        models.UserInfo.objects.create(user_name = user_name,full_name = full_name, user_email = user_email, user_mobile = user_mobile,
            address = address, user_country = user_country, user_pass = password
        )
        return redirect("/user-list/")
    else:
        return render(request, 'isoapp/common/user_add.html')

def gift_card_list(request):
    gift_card_list = models.GiftCardGenerate.objects.all()
    return render(request, 'isoapp/common/gift_card_list.html', {'gift_card_list': gift_card_list})

def gift_card_generate(request):
    if request.method == "POST":
        card_amount     = request.POST["card_amount"].strip()
        number_of_card = int(request.POST["number_of_card"])
        remarks = request.POST["remarks"]
        for i in range(0, number_of_card):
            chk_gift = models.GiftCardGenerate.objects.last()
            if chk_gift:
                card_number = "ISHO"+str(datetime.datetime.now().date())+str(chk_gift.id+1)
            else:
                card_number = "ISHO"+str(datetime.datetime.now().date())+"1"
            chk_card_number = models.GiftCardGenerate.objects.filter(card_number = card_number)
            if not chk_card_number:
                models.GiftCardGenerate.objects.create(card_number = card_number, amount = card_amount, remark = remarks, added_by_id = request.session["user_name_id"])
        return redirect("/gift-card-list/")
    else:
        return render(request, 'isoapp/common/gift_card_generate.html')

def product_category_list(request):
    product_category_list = models.ProductCategory.objects.all()
    return render(request, 'isoapp/common/product_category_list.html', {'product_category_list': product_category_list})

def product_category_add(request):
    if request.method == "POST":
        category_name     = request.POST["category_name"].strip()
        remarks = request.POST["remarks"]
        models.ProductCategory.objects.create(category_name = category_name, remark = remarks, added_by_id = request.session["user_name_id"])
        return redirect("/product-category-list/")
    else:
        return render(request, 'isoapp/common/product_category_add.html')

def product_list(request):
    product_list = models.ProductSetup.objects.all()
    return render(request, 'isoapp/common/product_list.html', {'product_list': product_list})

def product_setup(request):
    if request.method == "POST":
        product_name     = request.POST["product_name"].strip()
        category_name     = int(request.POST["category_name"])
        purchase_price     = request.POST["purchase_price"]
        sales_price     = request.POST["sales_price"]
        remarks = request.POST["remarks"]
        chk_product = models.ProductSetup.objects.last()
        if chk_product:
            barcode = "000"+str(chk_product.pk+1)
        else:
            barcode = "0001"
        chk_product_exist = models.ProductSetup.objects.filter(product_name = product_name).first()
        if not chk_product_exist:
            models.ProductSetup.objects.create(barcode = barcode, product_name = product_name, category_name_id = category_name, bdt_unit_price = purchase_price, 
                unit_sales_price = sales_price, remark = remarks, added_by_id = request.session["user_name_id"]
            )
            messages.success(request, "Porduct added.")
            return redirect("/product-list/")
        else:
            messages.warning(request, "This product already exists.")
            return render(request, 'isoapp/common/product_setup.html')
    else:
        product_category_list = models.ProductCategory.objects.all()
        return render(request, 'isoapp/common/product_setup.html', {'product_category_list': product_category_list})

def discount_list(request):
    discount_list = models.DiscountSetup.objects.all()
    return render(request, 'isoapp/common/discount_list.html', {'discount_list': discount_list})

def discount_setup(request):
    if request.method == "POST":
        country          = request.POST["country"]
        start_amount     = request.POST["start_amount"]
        end_amount       = request.POST["end_amount"]
        discount_parcentage = request.POST["discount_parcentage"]
        discount_month      = request.POST["discount_month"]
        remarks             = request.POST["remarks"]

        chk_discount_exist = models.DiscountSetup.objects.filter(start_amount = start_amount, end_amount = end_amount, store_country = country, discount_month = discount_month ).first()
        if not chk_discount_exist:
            models.DiscountSetup.objects.create(start_amount = start_amount, end_amount = end_amount, discount_parcentage = discount_parcentage, store_country = country, discount_month = discount_month, remark = remarks, added_by_id = request.session["user_name_id"]
            )
            messages.success(request, "Discount added.")
            return redirect("/discount-list/")
        else:
            messages.warning(request, "This discount setup already exists.")
            return render(request, 'isoapp/common/discount_setup.html')
    else:
        return render(request, 'isoapp/common/discount_setup.html')

def purchase_history(request):
    purchase_history = models.PurchaseHistory.objects.all()
    return render(request, 'isoapp/common/purchase_history.html', {'purchase_history': purchase_history})

def sales_history(request):
    sales_history = models.SalesHistory.objects.all().order_by('invoice_no')
    return render(request, 'isoapp/common/sales_history.html', {'sales_history': sales_history})

def stock_information(request):
    stock_information = models.StockInfo.objects.all()
    return render(request, 'isoapp/common/stock_information.html', {'stock_information': stock_information})

def purchase_product(request):
    if request.method == "POST":
        product_name     = int(request.POST["product_name"])
        quantity     = int(request.POST["quantity"])
        remarks = request.POST["remarks"]
        chk_product_exist = models.StockInfo.objects.filter(product_name_id = product_name).first()
        if not chk_product_exist:
            models.StockInfo.objects.create(product_name_id = product_name, available_quantity = quantity, 
                stock_quantity = quantity, added_by_id = request.session["user_name_id"]
            )
            models.PurchaseHistory.objects.create(product_name_id = product_name, purchase_quantity = quantity, 
                remark = remarks, added_by_id = request.session["user_name_id"]
            )
            messages.success(request, "Stock added.")
            return redirect("/purchase-history/")
        else:
            update_date = datetime.datetime.now().date()
            models.StockInfo.objects.filter(product_name_id = product_name).update( available_quantity = F('available_quantity')+ quantity, 
                stock_quantity =F('stock_quantity')+ quantity, updated_date = update_date, update_by = int(request.session["user_name_id"])
            )
            models.PurchaseHistory.objects.create(product_name_id = product_name, purchase_quantity = quantity, 
                remark = remarks, added_by_id = request.session["user_name_id"]
            )
            messages.success(request, "Stock Updated.")
            return redirect("/purchase-history/")
    else:
        product_list = models.ProductSetup.objects.all()
        return render(request, 'isoapp/common/purchase_product.html', {'product_list': product_list})

def get_gift_card_amount(request):
    if request.is_ajax():
        gift_card_no = request.GET["gift_card_no"].strip()
        gift_card = models.GiftCardGenerate.objects.filter(card_number = gift_card_no, status = False).first()
        amount = 0
        if gift_card:
            if request.session["country"] == "USA":
                amount = float(gift_card.amount)
                response = requests.post('http://data.fixer.io/api/latest?access_key=e7546ef7cada53aeea71524d9176e113&format=1') 
                if response.status_code == 200:
                    data = response.json()
                    amount = round((amount/data["rates"]["BDT"])*data["rates"]["USD"]) 
        else:
            amount = 0
        return JsonResponse(amount, safe = False)

def get_discount_amount(request):
    if request.is_ajax():
        if request.session["country"] == "USA":
            amount = float(request.GET["net_payable"])
            response = requests.post('http://data.fixer.io/api/latest?access_key=e7546ef7cada53aeea71524d9176e113&format=1') 
            if response.status_code == 200:
                data = response.json()
                net_payable = round((amount/data["rates"]["USD"]*data["rates"]["BDT"])) 
        else:
            net_payable = float(request.GET["net_payable"])
        month = datetime.datetime.now().month
        discount = models.DiscountSetup.objects.filter(start_amount__lte = net_payable, end_amount__gte = net_payable, store_country = request.session["country"], discount_month = month).first()
     
        amount = 0
        if discount:
            amount = discount.discount_parcentage
        else:
            amount = 0
        return JsonResponse(amount, safe = False)

def sales(request):
    if request.is_ajax():
        product = list(models.StockInfo.objects.values('product_name_id__barcode','product_name_id__product_name','product_name_id__unit_sales_price','available_quantity').filter(product_name_id__barcode = request.GET["product_code"]))
        if product:
            data = {
                "product":product,
            }
            return JsonResponse(data, safe = False)
        else:
            data = True
            return JsonResponse(data, safe = False)
    
    if request.method == "POST":
        payment_type       = request.POST["payment_type"]
        if request.session["country"] == "USA":
            hdn_payable_amount = usd_to_bd(float(request.POST["hdn_payable_amount"]))
            discount_amount    = usd_to_bd(float(request.POST["discount_amount"]))
            vat                = usd_to_bd(float(request.POST["vat"]))
            hdn_net_payable    = usd_to_bd(float(request.POST["hdn_net_payable"]))
            if request.POST["hdn_total_paid"] != "":
                hdn_total_paid     = usd_to_bd(float(request.POST["hdn_total_paid"]))
            else:
                hdn_total_paid  = 0
            cash_amount        = usd_to_bd(float(request.POST["cash_amount"]))

            # hdn_gift_card_amount = usd_to_bd(float(request.POST["hdn_gift_card_amount"]))
            # print("hdn_payable_amount :", hdn_payable_amount)
        else:
            hdn_payable_amount = request.POST["hdn_payable_amount"]
            discount_amount    = request.POST["discount_amount"]
            vat                = request.POST["vat"]
            hdn_net_payable    = request.POST["hdn_net_payable"]
            if request.POST["hdn_total_paid"] != "":
                hdn_total_paid     = request.POST["hdn_total_paid"]
            else:
                hdn_total_paid     = 0
            cash_amount        = request.POST["cash_amount"]
            # hdn_gift_card_amount = request.POST["hdn_gift_card_amount"]
        gift_card_no       = request.POST["gift_card_no"].strip()
        product_code       = request.POST.getlist("product_code")
        txt_total_price    = request.POST.getlist("txt_total_price")
        price              = request.POST.getlist("price")
        quantity           = request.POST.getlist("quantity")
        paid_amount = 0
        if payment_type == "Cash":
            paid_amount = float(cash_amount)
        elif payment_type == "Gift Card":
            paid_amount = float(hdn_gift_card_amount)
            models.GiftCardGenerate.objects.filter(card_number = gift_card_no).update(status = True)
        else:
            paid_amount = float(hdn_total_paid)
            models.GiftCardGenerate.objects.filter(card_number = gift_card_no).update(status = True)


        chk_sales = models.Sales.objects.last()
        if chk_sales:
            invoice_no = "ISHO"+str(datetime.datetime.now().day)+str(datetime.datetime.now().month)+str(datetime.datetime.now().year)+str(chk_sales.id+1)
        else:
            invoice_no = "ISHO"+str(datetime.datetime.now().day)+str(datetime.datetime.now().month)+str(datetime.datetime.now().year)+str(1)
        
        models.Sales.objects.create(invoice_no = invoice_no, total_price = hdn_payable_amount, vat_amount = vat, discount_amount = discount_amount, net_price = float(hdn_net_payable), paid_amount = paid_amount, added_by_id = request.session["user_name_id"])
        count = 0
        for i in product_code:
            product = models.ProductSetup.objects.filter(barcode = product_code[count]).first()
            models.SalesHistory.objects.create(invoice_no = invoice_no, product_name_id = product.id, sales_quantity = quantity[count], sales_price = price[count], total_price = txt_total_price[count], added_by_id = request.session["user_name_id"])
            models.StockInfo.objects.filter(product_name_id = product.id).update(available_quantity = F('available_quantity')-int(quantity[count]))
            count += 1
        messages.success(request, "Sale success.")
        context = {
            'invoice_no': invoice_no,
        }
        return render(request, 'isoapp/common/sales.html', context)
        
    else:
        discount = models.DiscountSetup.objects.filter()
        return render(request, 'isoapp/common/sales.html')

def invoice_print(request, invoice_no):
    sales_list = models.Sales.objects.filter(invoice_no = invoice_no).first()
    sales_history_list = models.SalesHistory.objects.filter(invoice_no = invoice_no)
    if sales_list:
        context = {
            'sales_list': sales_list,
            'sales_history_list': sales_history_list, 
        }
    pdf = render_to_pdf('isoapp/common/invoice_print.html', context)
    return HttpResponse(pdf, content_type='application/pdf')

def convert_amount(request):
    amount = float(request.GET["amount"])
    response = requests.post('http://data.fixer.io/api/latest?access_key=e7546ef7cada53aeea71524d9176e113&format=1') 
    if response.status_code == 200:
        data = response.json()
        usd = round((amount/data["rates"]["BDT"])*data["rates"]["USD"]) 
        return JsonResponse(usd, safe = False)
    else: 
        return JsonResponse(amount, safe = False)


