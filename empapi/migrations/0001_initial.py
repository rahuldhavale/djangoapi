# Generated by Django 3.0.2 on 2020-01-31 08:30

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='employee',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('employee_code', models.CharField(max_length=255, unique=True)),
                ('department', models.CharField(blank=True, max_length=255, null=True)),
                ('score', models.IntegerField(blank=True, null=True)),
                ('date_created', models.DateTimeField(blank=True, null=True)),
            ],
            options={
                'db_table': 'employee',
                'managed': False,
            },
        ),
    ]
