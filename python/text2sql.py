import sys

def generate_sql_hierarchy(data, parent=None, indent=0):
    for item in data:
        if isinstance(item, str):
            table_name = item.strip()
            print(f"CREATE TABLE \"{table_name}\" (")
            print(f"{'    ' * (indent + 1)}\"id\" SERIAL PRIMARY KEY,")
            print(f"{'    ' * (indent + 1)}\"вид животного\" VARCHAR(255),")
            print(f"{'    ' * (indent + 1)}\"дата рождения\" DATE,")
            print(f"{'    ' * (indent + 1)}\"кличка\" VARCHAR(255),")
            print(f"{'    ' * (indent + 1)}\"список индексов команд\" INTEGER[]")
            print(f"{'    ' * indent});")
        elif isinstance(item, list):
            if parent is not None:
                print(f"ALTER TABLE \"{parent}\" ADD COLUMN \"{item[0]}\" INTEGER;")
            generate_sql_hierarchy(item[1:], parent=parent, indent=indent)
        else:
            raise ValueError("Invalid data format")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Формат запуска: python text2sql.py input.txt")
        sys.exit(1)

    input_file = sys.argv[1]

    with open(input_file, 'r', encoding='utf-8') as file:
        hierarchy = [line.strip() for line in file.readlines()]

    generate_sql_hierarchy(hierarchy)
