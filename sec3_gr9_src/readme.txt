Y2T2 Project: Goods Days

This project is written by:
1. Kongphob Wutthiumphol
2. Chommakorn Sontesadisai
3. Nattanicha Sinsawet
4. Poohtanmai Siriwachirapap

Project Description:
 Our website is marketplace that show all the source of anime goods, and then link to website that sell on each product  
 It has anime goods from Onepiece, Gundam, and Attack On Titan.

individually work:
First Phase:
Work together: Readme.txt and Navigation Dream
- Kongphob Wutthiumphol: Search page/ detail page
- Chommakorn Sontesadisai: Admin page / User management page / Product management page
- Nattanicha Sinsawet: About us page / Contact us page
- Poohtanmai Siriwachirapap: Homepage + Log-in + sign-up

Second Phase:
Work together: Readme.txt and Navigation Dream
- Kongphob Wutthiumphol: Task 1 Database and task 2 Product search criteria
- Chommakorn Sontesadisai: Task 2 admin authentication and Task 2 admin CRUD operation/admin search criteria
- Nattanicha Sinsawet: Task 3 API, report, and slide of presentation
- Poohtanmai Siriwachirapap: Task 2 Product CRUD and Task 2 product search criteria

Step For Running Project:

Installation Application
1. Install VSCode via this link:
    https://code.visualstudio.com/
2. Install HTML
    Name: HTML CSS Support
    Id: ecmel.vscode-html-css
    Description: CSS Intellisense for HTML
    Version: 1.13.1
    Publisher: ecmel
    VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=ecmel.vscode-html-css
3. Install LiveServer
    Name: Live Server
    Id: ritwickdey.LiveServer
    Description: Launch a development local Server with live reload feature for static & dynamic pages
    Version: 5.7.9
    Publisher: Ritwick Dey
    VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer
4. Name: EJS language support
    Id: DigitalBrainstem.javascript-ejs-support
    Description: 2019 - EJS language support for Visual Studio Code.
    Version: 1.3.3
    Publisher: DigitalBrainstem
    VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=DigitalBrainstem.javascript-ejs-support

Create connection of database following this:
    host: "localhost",
    user: "pjweb",
    password: "Pjweb1234",
    database: "webpro"

Installation Node-modules:
Our dependencies:
    "bcryptjs": "^2.4.3",
    "cookie-parser": "~1.4.4",
    "debug": "~2.6.9",
    "dotenv": "^16.0.3",
    "ejs": "~2.6.1",
    "express": "~4.16.1",
    "express-flash": "^0.0.2",
    "express-session": "^1.17.3",
    "http-errors": "~1.6.3",
    "jsonwebtoken": "^9.0.0",
    "method-override": "^3.0.0",
    "mongoose": "^7.0.4",
    "morgan": "~1.9.1",
    "mysql": "^2.18.1",
    "nodemon": "^2.0.22"

Type following command in terminal 
(access to folder)
cd Sec3_Group9_ws_src 
bcryptjs: npm install bcryptjs
cookie-parser: npm install cookie-parser
debug: npm install debug
dotenv: npm install dotenv
ejs: npm install ejs
express: npm install express
express flash: npm install express-flash
express-session: npm install express-session
http-errors: npm install http-errors
jsonwebtoken: npm install jsonwebtoken
method-override: npm install method-override
mongoose: npm install mongoose
morgan: npm install morgan
mysql: npm install mysql
nodemon: npm install nodemon

OR don't want to waste time to install, you can download this following node modules via this link:
https://drive.google.com/file/d/1qyCNm3PQFt7z8QgR1WelYFwrFMoTFCIJ/view?usp=sharing 

Running
This project has 2 side which is Front-end(Client) and Back-End(Admin)

`step to Running Admin side`
1. open folder Sec3_Group9_ws_src
2. type 'npm start' in the terminal 
3. Open Google Chrome or Safari, then type "http://localhost:3000/"
4. It will directly go to Log in authentication of admin (Please look at database `administrator_login_information` table)
5. If Username and password is correct, it will show your username. Then button "Go to Admin management page" will appear.

`step to Running Client side`
1. open folder Sec3_Group9_ws_src
2. type 'npm start' in the terminal 
3. Open Google Chrome or Safari, then type "http://localhost:3000/html/index.html"
4. It will directly go to home page

Noted:
- Insert products price please do not contain , or ¥
- Update and delete product is in the detail of product page PLEASE CLICK AT THE PRODUCT in page ( Please Login first(http://localhost:3000/) -> Product Management Page (http://localhost:3000/products))
- /views/search.ejs and /views/productpage.ejs (search of users)
- /views/products.ejs and /views/p_detail.ejs  (search and CRUD of admins)

-----------------------------------------------------------------------------------------
Font Family
https://fonts.googleapis.com/css?family=Poppins
http://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swa

Font Awesome (icon)
https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css
https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css
https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css
https://unpkg.com/boxicons@latest/css/boxicons.min.css

Bootstrap:
https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css 

Theme
https://cdn.discordapp.com/attachments/1074658173765550151/1077974289493544970/IMG_1732.png

References
Phase1:
Search Bar: https://www.youtube.com/watch?v=9hnJsNIBq1g&feature=youtu.be
User Management: https://www.youtube.com/watch?v=IqAPhLLd_bM&t=1s
Product Result and Product Admin /Header/Footer: https://www.youtube.com/watch?v=cLOT0APQzDs
About us: https://www.youtube.com/watch?v=s3NDJ4twCDg&list=PLeZhXsDkBWaXDFSC0P9CpF_q9gocJ8KRy&index=6
Contact us: https://www.youtube.com/watch?v=f0DcnrpeBv8 

Phase2:
CRUD Operation: https://youtu.be/tFQtHDceixw 
Log-in authrntication: https://youtu.be/e5yZKTADxfk


