# Generated by Django 2.0.3 on 2020-05-19 05:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('isoapp', '0003_purchasehistory'),
    ]

    operations = [
        migrations.AddField(
            model_name='stockinfo',
            name='update_by',
            field=models.IntegerField(default=0),
        ),
    ]