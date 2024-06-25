class Employee:
    def __init__(self, name, employee_id, position, salary):
        self.name = name
        self.employee_id = employee_id
        self.position = position
        self.salary = salary

    def calculate_bonus(self, percentage):
        bonus = (percentage / 100) * self.salary
        return bonus

    def promote(self, new_position, salary_increase):
        self.position = new_position
        self.salary += salary_increase
        print(f"{self.name} has been promoted to {new_position}. New salary: ${self.salary}")

    def __str__(self):
        return f"Employee: {self.name}, Position: {self.position}, Salary: ${self.salary}"