def add(a, b):
    return a + b
import unittest

class TestAddFunction(unittest.TestCase):

    def test_add_two_positive_numbers(self):
        self.assertEqual(add(1, 2), 3)

    def test_add_positive_and_negative_number(self):
        self.assertEqual(add(1, -1), 0)

    def test_add_two_negative_numbers(self):
        self.assertEqual(add(-1, -1), -2)

if __name__ == '__main__':
    unittest.main()

