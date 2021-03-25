# LP-Store
After the [LP Database](https://github.com/AugustoPresto/LP-Database), now we have an app for a **LP Store**! 👊

Imagine we're in a pandemic and it's recommended to everyone stay safe at home (just imagine...). So the sales are made online, that's why orders have a boolean delivered variable. We have two types of employees, managers and salespeople. Each role has specific actions. To do that, the user must login so the router gives you the actions based on the role. Nice!
Again, it's terminal-based and all in Ruby using the MVC pattern.

To store data, it uses CSV files for our four models:
1. LP
   * Artist name
   * Title
   * Released year
   * Price
1. Employee (manager or salesperson)
   * Username
   * Password
1. Customer
   * Name
   * Email
   * Address
1. Order: the model where everybody goes together!
   * LP
   * Employee
   * Customer
   * Delivered?