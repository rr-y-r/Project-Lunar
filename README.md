Implementation of "Ordering Process" Information System 
Group = Lunar; 
Class = IF-36-03; 
Member {
Alwan M Ubaidillah Al-Fath (1103124293 | https://bitbucket.org/alwanubaidillah), 
Keri Wisnu Nurhidayat (1103120018 |https://bitbucket.org/keriwisnu), 
Putri Febri Yanti (1103120022 | https://bitbucket.org/putrifebriyanti), 
Ryan Rynaldo (1103120167|https://bitbucket.org/rr_y_r)
};

requirement :
- updated internet browser
- php server and mysql server

What need to be fixed and done :
lots of this apps module need to be fix and recreated, lots of function is not even working. Needs more time to re-develope this web apps.
- Registration -> add more store information.
- CMS.User -> fix update, intergrated delete with binded store + product
- CMS.Store -> Intergrated with user.
- CMS.Product -> lot of module not working, including view into CMS
- Create Product -> need more information in creating form
- Upload Image -> script error, even upload is working, it shown error
- Uploaded product image -> binded to user + store data.
- User Privileges -> need more module for customize user profile
- Store System -> need feedback module
- Guest -> need shop interaction (buy, feedback, etc)
- Shop system -> need feedback module for guest and rating for store

How To Use:
- turn the php server and mysql server
- import 'patarana.sql' into mysql server
- create a new folder named 'shop_ver-a' on htdocs in php server folder
- put 'serverside', 'clientside', '.htaccess' into the created folder
- open web browser and navigate to 'localhost/shop_ver-a/clientside/'
- or, user the desktop application "patarana.exe" in '/clientside/build' for user and admin
- there are 3 privileges in this apps : admin, user, guest
    - for admin, login as admin with this data {username : admin ; password : admin }
    - for user, {username : awaw ; password : awaw} or see the database with table user to get the data
    - for guest, on the login page, last address from "login.html" into "guest.html"
- ADMIN :
    - have all privileges such as CRUD : store, item, product
    - activate newly creaated user account (verify / approve registration)
    
- USER :
    - newly created account must be approved by admin in order to use
    - CRUD product
    - upload product image
    
- GUEST :
    - browse catalog

Basic feature:
- one page web apps
- angular.js as front-end web apps, codeigniter as serverside
- privileges detection from login
- member activation by admin
- member activity monitoring via mysql database
- multiple image file upload
- and a lot more..