# README: Inventory Tracking App by Hannah Warren

## View the working site for this replit at: https://inventory.hannahwarren.repl.co

### Configuration:

* Ruby version: 2.5.1
  
* Rails 6.1

* Sqlite3

### Tour of Functionality:

This inventory tracking application works by:

Allowing users to create Items (attributes: name, description, weight_lbs) and Warehouses (attributes: name, address, city, state, zip). 

Then, because logistics companies are most concerned with *where* a thing is located, *how much* it weighs, and *how many* they're responsible for...

Users can click "Add Inventory to #{warehouse.name}" and correlate items with a given warehouse location. These Warehouse_Items exist in a join table with an item_id and warehouse_id, and have attributes for quantity and aisle number for easy finding of a given item when it's time to ship. 