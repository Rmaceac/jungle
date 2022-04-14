# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Features

- A home page that displays all of the products on offer.
- Each product has it's own "Details" page that users can explore.
- Login, register and authentication functionality (users are not limited by their logged-in status).
- Stripe integration.
- Detailed "My Cart" page with adjustment options for items in cart.
- Multiple Administration pages: a dashboard with overview information, a product catalogue and functionality for viewing/creating new product categories.

## Screenshots

#### The Home Page:
![Home Page](https://github.com/Rmaceac/jungle/blob/master/docs/screenshots/main%20page.png?raw=true)

#### Product Details Page:
![Product Details Page](https://github.com/Rmaceac/jungle/blob/master/docs/screenshots/product%20details.png?raw=true)

#### Viewing the Cart:
![Viewing the Cart](https://github.com/Rmaceac/jungle/blob/master/docs/screenshots/cart.png?raw=true)

#### Products (Admin view) :
![Products (Admin view) ](https://github.com/Rmaceac/jungle/blob/master/docs/screenshots/admin_products.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe