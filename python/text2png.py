from graphviz import Digraph
from sys import argv

if len(argv) != 3:
    print(f"Формат запуска: python[3] text2png.py input.txt output.png")
    exit(-1)

with open(argv[1], 'r') as f:
    text = f.read()

lines = text.split('\n')

dot = Digraph(comment='Hierarchy Diagram', format='png')
parent_stack = []

for line in lines:
    if line == '':
        break
    level = len(line) - len(line.lstrip())
    node_name = line.strip()

    while parent_stack and level <= parent_stack[-1][0]:
        parent_stack.pop()

    if parent_stack:
        parent_name = parent_stack[-1][1]
        dot.edge(parent_name, node_name)
    
    parent_stack.append((level, node_name))
    dot.node(node_name, shape='box')  # Задаем форму прямоугольника

dot.render(argv[2], cleanup=True)

