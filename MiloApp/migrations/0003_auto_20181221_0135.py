# Generated by Django 2.1.4 on 2018-12-21 01:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('MiloApp', '0002_auto_20181221_0053'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='random_number',
            field=models.IntegerField(default=101, null=True),
        ),
    ]
