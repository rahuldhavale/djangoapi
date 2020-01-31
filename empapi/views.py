from django.shortcuts import render

from django.http import HttpResponse
from django.shortcuts import get_object_or_404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.pagination import PageNumberPagination
from empapi.pagination import PaginationHandlerMixin
from . models import employee
from . serializers import employeeSerializer

# class to override or set pagination attributes
class BasicPagination(PageNumberPagination):
    page_query_param = 'chunk'

# Create your views here.
class employeeList(APIView, PaginationHandlerMixin):
	pagination_class = BasicPagination
	serializer_class = employeeSerializer

	# API GET method to fetch the employee data
	def get(self, request, format=None, *args, **kwargs):
		# get employee data by score in descending order
		get_emp_list = employee.objects.all().order_by('-score')
		
		#final_array = []
		#final_obj = {}
		#for emp in get_emp_list:
		#	print("EMp Code: "+emp.employee_code)

		#querystring = request.query_params.get('chunk')
		page = self.paginate_queryset(get_emp_list)
		if page is not None:
			serializer = self.get_paginated_response(self.serializer_class(page, many=True).data)
		else:
			serializer = self.serializer_class(get_emp_list, many=True)

		return Response({'employees':serializer.data})
