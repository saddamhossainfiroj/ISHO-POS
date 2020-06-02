from django import template
from django.shortcuts import render, redirect
import requests
from isoapp.models import (
    UserInfo
)
register = template.Library()
@register.filter(name='user_profile') 
def get_user_profile(user_id):
    profile = UserInfo.objects.filter(pk = request.session["user_name_id"])
    return profile

@register.filter(name='convert_amount')
def convert_amount(amount):
    response = requests.post('http://data.fixer.io/api/latest?access_key=e7546ef7cada53aeea71524d9176e113&format=1') 
    if response.status_code == 200:
        data = response.json()
        usd = round((amount/data["rates"]["BDT"])*data["rates"]["USD"]) 
        return usd 
    else: amount
