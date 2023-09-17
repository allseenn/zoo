import matplotlib.pyplot as plt
import networkx as nx
import argparse

def create_class_diagram(input_file, output_file):
    G = nx.DiGraph()

    # Открываем файл и считываем его содержимое
    with open(input_file, 'r') as f:
        current_parent = None
        for line in f:
            # Удаляем символы перевода строки и ведущие пробелы
            line = line.strip()
            # Определяем уровень вложенности (количество символов табуляции)
            level = line.count('\t')
            # Убираем символы табуляции
            class_name = line.lstrip('\t')

            # Добавляем узлы и связи в граф
            if level == 0:
                current_parent = class_name
            else:
                G.add_node(class_name)
                G.add_edge(current_parent, class_name)

    # Отрисовываем диаграмму
    pos = nx.spring_layout(G)
    nx.draw(G, pos, with_labels=True, node_size=2000, node_color="skyblue", font_size=10, font_color="black", font_weight="bold", arrows=True)

    # Сохраняем диаграмму в файл
    plt.savefig(output_file)
    plt.show()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Create a class diagram from an input file")
    parser.add_argument("input_file", help="Input file with class hierarchy")
    parser.add_argument("output_file", help="Output image file (e.g., diagram.png)")
    args = parser.parse_args()

    create_class_diagram(args.input_file, args.output_file)

