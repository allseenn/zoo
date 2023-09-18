from sys import argv

if len(argv) != 2:
    print(f"Формат запуска: python[3] text2list.py input.txt")
    exit(-1)

text = ""
with open(argv[1], 'r', encoding='utf-8') as f: 
    text = f.read()

lines = text.split('\n')
result = []  # Создаем пустой список для структуры

stack = [result]  # Стек для отслеживания текущего уровня вложенности
current_level = 0

for line in lines:
    if line == '':
        break
    level = (len(line) - len(line.lstrip())) // 4  # Определяем уровень вложенности

    if level > current_level:
        # Вложенный уровень - добавляем новый список
        stack[-1].append([])
        stack.append(stack[-1][-1])
    elif level < current_level:
        # Уровень выше - поднимаемся наверх по стеку
        while level < current_level:
            stack.pop()
            current_level -= 1

    # Добавляем текущую строку в текущий уровень
    stack[-1].append(line.strip())
    current_level = level

print(result)
