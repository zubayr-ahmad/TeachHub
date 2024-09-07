class RestaurantOrder:
    # Class-Level Attributes
    restaurant_name = "Gourmet Bistro"
    order_counter = 0
    current_orders = []
    total_sales = 0.0
    menu = {
        "Burger": 9,
        "Pizza": 13,
        "Pasta": 11,
        "Salad": 8,
        "Soda": 2,
        "Coffee": 3,
    }
    tables = [False] * 10  # 10 tables: False means available, True means occupied

    def __init__(self, items):
        # Increment global order counter
        RestaurantOrder.order_counter += 1
        self.order_number = RestaurantOrder.order_counter
        self.items = items
        self.total_cost = self.calculate_total_cost()
        self.table_number = self.check_table_availability()
        self.status = "pending"

    def __str__(self):
        items_str = ' | '.join(self.items)
        return (f"Order #{self.order_number} - Table {self.table_number}\n"
                f"Items: {items_str}\n"
                f"Total Cost: ${self.total_cost:.2f}\n"
                f"Status: {self.status}")

    def calculate_total_cost(self):
        return sum(RestaurantOrder.menu[item] for item in self.items)

    def add_tip(self, tip):
        self.total_cost += tip

    def place_order(self):
        if self.table_number is not None:
            RestaurantOrder.current_orders.append(self)
            self.status = "pending"
            return f"Order {self.order_number} placed successfully."
        else:
            return "No tables available to place the order."

    def cancel_order(self):
        self.status = "cancelled"
        RestaurantOrder.current_orders.remove(self)
        self.update_table_availability(False)
        return f"Order {self.order_number} cancelled."

    def check_table_availability(self):
        for i, available in enumerate(RestaurantOrder.tables):
            if not available:  # Find an available table
                RestaurantOrder.tables[i] = True  # Mark table as occupied
                return i + 1  # Return the table number
        return None  # No tables available

    def update_table_availability(self, free=True):
        if free and self.table_number:
            RestaurantOrder.tables[self.table_number - 1] = False  # Mark table as free

    def remove_order(self):
        RestaurantOrder.current_orders.remove(self)

    def complete_order(self):
        self.status = "completed"
        RestaurantOrder.total_sales += self.total_cost
        self.update_table_availability(True)  # Free the table
        self.remove_order()
        return f"Order {self.order_number} completed."
    
    def clear_orders():
        RestaurantOrder.current_orders = []
        RestaurantOrder.tables = [False] * 10
        RestaurantOrder.total_sales = 0.0
        RestaurantOrder.order_counter = 0


import unittest

class TestRestaurantOrder(unittest.TestCase):

    def setUp(self):
        RestaurantOrder.clear_orders()  # Reset all class-level attributes before each test

    def test_order_initialization(self):
        order = RestaurantOrder(["Burger", "Soda"])
        self.assertEqual(order.order_number, 1)  # Should be 1 after clear_orders reset
        self.assertEqual(order.items, ["Burger", "Soda"])
        self.assertEqual(order.total_cost, 11)  # 9 (Burger) + 2 (Soda)
        self.assertEqual(order.status, "pending")
        self.assertIsNotNone(order.table_number)
    
    def test_calculate_total_cost(self):
        order = RestaurantOrder(["Pizza", "Coffee"])
        self.assertEqual(order.calculate_total_cost(), 16)  # 13 (Pizza) + 3 (Coffee)
    
    def test_add_tip(self):
        order = RestaurantOrder(["Pasta"])
        order.add_tip(5)
        self.assertEqual(order.total_cost, 16)  # 11 (Pasta) + 5 (Tip)
    
    def test_place_order_success(self):
        order = RestaurantOrder(["Salad"])
        message = order.place_order()
        self.assertIn(order, RestaurantOrder.current_orders)
        self.assertEqual(order.status, "pending")
        self.assertEqual(message, "Order 1 placed successfully.")
    
    def test_place_order_no_table_available(self):
        # Mark all tables as occupied
        RestaurantOrder.tables = [True] * 10
        order = RestaurantOrder(["Soda"])
        message = order.place_order()
        self.assertNotIn(order, RestaurantOrder.current_orders)
        self.assertEqual(message, "No tables available to place the order.")
    
    def test_cancel_order(self):
        order = RestaurantOrder(["Burger", "Coffee"])
        order.place_order()
        message = order.cancel_order()
        self.assertEqual(order.status, "cancelled")
        self.assertNotIn(order, RestaurantOrder.current_orders)
        self.assertEqual(RestaurantOrder.tables[order.table_number - 1], False)  # Table should be free
        self.assertEqual(message, f"Order {order.order_number} cancelled.")
    
    def test_complete_order(self):
        order = RestaurantOrder(["Pizza"])
        order.place_order()
        message = order.complete_order()
        self.assertEqual(order.status, "completed")
        self.assertEqual(RestaurantOrder.total_sales, 13)  # Total cost of Pizza
        self.assertEqual(RestaurantOrder.tables[order.table_number - 1], False)  # Table should be free
        self.assertNotIn(order, RestaurantOrder.current_orders)
        self.assertEqual(message, f"Order {order.order_number} completed.")

    def test_str_method(self):
        order = RestaurantOrder(["Burger", "Soda"])
        expected_str = (
            f"Order #1 - Table {order.table_number}\n"
            "Items: Burger | Soda\n"
            "Total Cost: $11.00\n"
            "Status: pending"
        )
        self.assertEqual(str(order), expected_str)
    
    def test_clear_orders(self):
        order1 = RestaurantOrder(["Burger"])
        order1.place_order()
        order2 = RestaurantOrder(["Pizza"])
        order2.place_order()
        
        RestaurantOrder.clear_orders()
        
        # After clearing, these values should reset
        self.assertEqual(RestaurantOrder.current_orders, [])
        self.assertEqual(RestaurantOrder.tables, [False] * 10)
        self.assertEqual(RestaurantOrder.total_sales, 0.0)
        self.assertEqual(RestaurantOrder.order_counter, 0)
        # New order should start from order_number 1 again
        order3 = RestaurantOrder(["Salad"])
        self.assertEqual(order3.order_number, 1)

if __name__ == '__main__':
    unittest.main()
