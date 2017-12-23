# README
Fork Friendly application is mainly for the patients for healthy dining based on their existing
health issues and to know their availability in various grocery stores for them to purchase.

As an “Admin”, user will get an option after login (using admin credentials which are provided to the customer) on top left
corner through the tabs (Upload Data, Upload Concerns) to upload the database of the Products and
health concerns diet map from the excel sheets data and import those files to create its corresponding
database of groceries and health concerns.

## Sign up page
  When a new user wants to access the portal they are required to sign up by providing details for the following fields which are visible to the user on the sign up page
-First name
-Last name
-Email
-Gender
-Password
  There is also a hidden field “admin” which is set to true or false in the database which can be used to identify if the admin has logged in or the patient has logged in and can be directed to different views and features according to their requirements.

## Upload Groceries and Health Concerns Database - Only for Admin 
  To import the grocery database and health concerns database from an excel sheet shared by the customer. We have written a parser code for this which checks the structure of the excel sheet and based on it, the data can be imported to the database in the corresponding fields of groceries and health concerns. Since the parser depends on the structure of the excel sheet, the data provided by the customer should be consistent across all the excel sheets data provided by her which is a constraint to the customer. The Upload Data and Upload Concerns buttons would be visible on the UserHome page if logged in with the Admin credentials.

## User Home Page
  Once the user enters the valid login credentials by providing their username and password in the login page. It will redirect the user to the Home page to select Grocery Shopping or Eating Out for Restaurants. Eating Out Feature is not expected to be implemented from the Customer and Grocery feature is fully implemented.

## Health Concerns Page
  When the user selects Grocery Shopping in the user Home page, it will redirect the user to the Health Concerns page which has options like “Blood Pressure Friendly”, “Cholesterol Friendly”, “IBS Friendly”, “Sodium Friendly”, “Heart Healthy”, “Weight Loss”, “FOD Map”, “Kidney Friendly”, “Diabetes Friendly”, “Gluten Free”, “Soy Free”, “Diary Free”, “Egg Free”, “Diary Free” for the user to select according to the user’s existing health conditions.

## Product Line Page
  After the user selects any Health Concern in the Health Concerns page, it will redirect the user to Product Line page to select the main Product line which they want to buy like “Diary” for “Milk”. Various Product Lines in the page are “Bread”, “Snacks”, “Frozen Items”, “Condiments”, “Meats”, “Diary”, “Nuts & Bread”, “Meals Prepared”, “Drinks”, “Produce”. Due to security reasons Customer has provided only subset of data and can be tested for “Meat” and “Diary”. Rest of the data will be uploaded in the database by the customer with the admin credentials given to her.

## Product Category Page
  Once the User selects Product Line in the Product Line Page, it will redirect the user to Product Line Search Page which gives various options for the selected Product Line. For example, if user has selected “Diary” as a product line, this page would have options like “Sour Cream”, “Whipped Cream”, “Yogurt” or if “Drinks” is selected in product line page, this page may have “Juice”, “Syrup”.

## Products Page
  After the user selects particular product line in the Product line search page, this page would list various available products for that selected product line. For example, if the user has selected “Whipped Cream” in the Product Line search page for “Diary” Product line. This page would list its corresponding products like “Cool Whip Fat Free”, “Kroger Fat Free Whip Topping”, “Redi Wip Fat Free” for the user to select and add to his shopping cart. After selecting the products “My Cart” button can be clicked to check the products added to the cart.

## Shopping Cart Page
  This page will list all the various products selected by the user for shopping in previous pages and also here the user is given an option to remove any product which is not required.

## Log Out Feature
  Each page in the application has the Log out link available for the user to log out in between and that link would redirect the user to the sign in page. It can be seen in the screenshot below.

## Forgot Password Feature
  In the Welcome Page, user is given a Forgot Password option to Log In if the user forgets the password with which they have created their account. Once the user clicks the “Forgot Password” Link, it will redirect him to next page to provide the user’s email address. A mail will be sent to the user’s email address with the Link to reset their account password. The user can click the link provided in their mail and can reset with a new password.

## Heroku Link:
https://fork-friendly-app.herokuapp.com/

## How to modify the code
If you want to modify the codes in this project, fork this repo to your own GitHub account, and then
clone your fork:

```sh
$ git clone git@github.com:your_github_username/sankeerth/Fork_Friendly_app.git
```
Then you should run Bundler, to make sure all the app's gems are installed.  Switch to the app's root directory:

```sh
$ cd Fork_Friendly_app
```
and run:

```sh
$ bundle install
```

To get the local database created, run:

```sh
$ rake db:migrate
```

Now insert "seed data" into the database--initial data items that the app needs to run:

```sh
$ rake db:seed
```

At this point you should be able to run the app locally:

```sh
$ rails server
```

And navigating to `http://localhost:8000` in your browser.  
If you are using Cloud 9, use:

```sh
$ rails s -p $PORT -b $IP
```
And navigate to the link `http://workspacename-username.c9users.io` generated within c9.
<br />


