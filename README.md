# LP-Store
After the [LP Database](https://github.com/AugustoPresto/LP-Database), now we have an app for a **LP Store**! 👊

Imagine we're in a pandemic and it's recommended to everyone stay safe at home (just imagine...). So the sales are made online, so orders have a boolean delivered variable. We have two types of employees, managers and salespeople. Each role has specific actions.
Again, it's terminal-based and all in Ruby using the MVC pattern.

To store data, it uses CSV files for our four models:
1. LP
    1. Artist name
    1. Title
    1. Released year
    1. Price
1. Employee (manager or salesperson)
    1. Username
    1. Password
1. Customer
    1. Name
    1. Email
    1. Address
1. Order: the model where everybody goes together!
    1. LP
    1. Employee
    1. Customer
    1. Delivered?