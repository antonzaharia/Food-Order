
# FoodOrder

Welcome ! 

This is a web app created in Sinatra that simulates a website for food orders.

## Overview

This web app has two interfaces:

A Restaurant Interface: login, signup, see orders(recieved from users), create items (dishes), edit item, delete item.
### and
A User Interface: login, signup, orders history, create new order, cancel order (available only for new orders).

## Installation

Clone this repository 

## How to run the program

#### In your terminal, run 'bundle install' to install all required gems.
#### In your terminal, type 'shotgun' to start the server.
#### In your browser, visit: http://127.0.0.1:9393/ to visit the homepage.

## Files information

#### '/db/migrate' has all the migrations files
#### '/config' has the setup environment
#### '/app' has the actual code files where all the work is done.
#### '/app/controllers' has the sinatra controllers files
#### '/app/models' has the ruby models
#### '/app/views' has the .erb files to be rendered
#### Gemfile has all the required gems to run this project

## Usage

In your terminal, type 'shotgun' to start the server.
In your browser, visit: http://127.0.0.1:9393/ to visit the homepage.
Signup as a User or as a restaurant.
Firstly singup as a Restaurant and create some items, than signup as a User and create a new order.
Log back in as the restaurant you just created and see the new order in the "Orders" section.

## Development

After checking out the repo, run `bundle install` to install dependencies.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/antonzaharia/BestSellerBook. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the (https://github.com/antonzaharia/BestSellerBook/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Food Order project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/antonzaharia/BestSellerBook/blob/master/CODE_OF_CONDUCT.md).
