# cloud bookmark (Based on Ruby on Rails 5 framework)

by Zhu Jiayou, Huangfu Youfeng, Li Xuanshan & Han Jinpeng

A SaaS app to manage your bookmarks.

**[To be our user here](https://bookmarkincloud.herokuapp.com/)**


## Requirements

* Development env

[Cloud9](https://c9.io/)(An excellent cloud programming IDE), Ubuntu Linux, Mac

* Primary softwares

Ruby 2.4.2p198 (2017-09-14 revision 59899) [x86_64-linux]

Rails 5.1.4

For other softwares, please see the Gemfile.

If there's no bug, we'll chose a newer version.

* Production env

[Heroku](https://www.heroku.com/)(A cloud platform supports multiple programming languages), this project deploys on Heroku.

## How to Use?

* Test env

Rails Test, you can execute `rails test` or `rails t` to run all the test cases, and they all work correctly now.

* Local test

First, clone this repo to your development platform: 

```
git clone https://github.com/ZhuJiayou/cloud_bookmark
```

Ensure that the basic softwares have been installed. 

Execute  `bundle install --without production` to install all the gems in Gemfile.

Execute  `bin/rails db:migrate` and `RAILS_ENV=development` to set up the development environment database.

Execute `rails db:migrate:reset` and `rails db:seed` to synchronize the database and set up the seed users.

At last, execute `rails server` or `rails s` to start the local server, you can open the app on http://localhost:3000 if you use local development platform and if you use Cloud9, you can click **share** at the top right-hand corner of the IDE, then click **Links to share ==> Aplication ==> (Address of the app)** in the pop-up window to open the app.

* Deployment

This project supports to deploy on heroku. You can follow the Heroku instructons to deploy it. For the configs of mail authentication service of Heroku and picture storage service of Amazon S3 in production deployment, you can contact us or you can change to your own. It's a little complicated to write here, you can refer to *Ruby on Rails Tutorial(4th edition)* on chapter 11.4 and chapter 13.4.4 to get details.

## Contact

If you encounter any problem when you use our app that you cannot solve, or wanna provide advice to us, you can send us an email, here is our contact information: 

Zhu Jiayou -- lxfdbzjy@163.com 

Huangfu Youfeng -- huangfujihuang@gmail.com 

Li Xuanshan -- xuanshanli@gmail.com 

Han Jinpeng -- hjp3701@163.com 

Address: Huairou, Beijing, University of Chinese Academy of Sciences (UCAS) Yanqi Lake Campus West 
Postcode: 101408 
