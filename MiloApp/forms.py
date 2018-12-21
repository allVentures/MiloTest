from django import forms


class RegisterForm(forms.Form):
    username = forms.CharField(label="Username", max_length=32, widget=forms.TextInput(attrs={"class": "form-control"}))
    password = forms.CharField(label="Password", max_length=32,
                               widget=forms.PasswordInput(attrs={"class": "form-control"}))
    password_check = forms.CharField(label="Password Check", max_length=32,
                                     widget=forms.PasswordInput(attrs={"class": "form-control"}))
    first_name = forms.CharField(label="First Name", max_length=32, required=False,
                                 widget=forms.TextInput(attrs={"class": "form-control"}))
    last_name = forms.CharField(label="Last Name", max_length=32, required=False,
                                widget=forms.TextInput(attrs={"class": "form-control"}))
    email = forms.EmailField(label="email", widget=forms.EmailInput(attrs={"class": "form-control"}), max_length=64)

    # I will generate the birthdate manually with HTML as I wanna use the HTML calendar widget
    # birthdate = forms.DateField(label="birthdate", widget=forms.D(attrs={"class": "form-control"}))

