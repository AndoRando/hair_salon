# _Hair Salon_

##### _Client and Stylist management app for a hair salon, August 21, 2015_

#### By _**Andrew Brennwald**_

## Description

_This application allows the hair salon manager(s) to add, view, update, and delete stylists and their respective clients to their system._

## Setup

* _Clone repository to desired staging location_
* _Create and connect to a Postgres SQL database using the PG and PSQL gems with the following information:_
* _-In PSQL:_
* _- $ CREATE DATABASE hair_salon;_
* _- $ CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);_
* _- $ CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);_
* _Point your termial to the top directory of the repository folder and run: $ ruby app.rb_
* _In your browser of choice, navigate to: localhost:4567_
* _Manage your salon!_

## Technologies Used

* _App Logic: ruby_
* _Framework: Sinatra_
* _Testing: RSpec and capybara_
* _Database: PostgreSQL_

### Legal

Copyright (c) 2015 **_Andrew Brennwald_**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
