def create_employee(name, employee_id, position, salary):
    return {"name":name,"employee_id":employee_id, "position":position, "salary": salary}

def calculate_bonus(employee, percentage):
    bonus = (percentage / 100) * employee["salary"]
    return bonus

def promote(employee, new_position, salary_increase):
    employee["position"] = new_position
    employee["salary"] += salary_increase
    print(f"{employee['name']} is promoted to {employee['position']} with a salary of {employee['salary']}")

def print_employee(employee):
    print(f"Name: {employee['name']}, Position: {employee['position']}, Salary: {employee['salary']}")
