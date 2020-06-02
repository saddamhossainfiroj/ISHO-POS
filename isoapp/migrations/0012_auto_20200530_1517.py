# Generated by Django 2.0.3 on 2020-05-30 09:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('isoapp', '0011_discountsetup_discount_month'),
    ]

    operations = [
        migrations.AlterField(
            model_name='discountsetup',
            name='discount_month',
            field=models.CharField(choices=[('1', 'January'), ('2', 'February'), ('3', 'March'), ('4', 'April'), ('5', 'May'), ('6', 'June')], max_length=50),
        ),
    ]