from graphviz import Digraph
import argparse

def create_class_diagram(input_file, output_file):
    dot = Digraph(comment='Class Diagram', format='png', graph_attr={'rankdir': 'TB'}, edge_attr={'dir': 'back'})

    # Определим главный класс как имя файла
    file_name = input_file.split("/")[-1]
    dot.node(file_name, shape='box')

    with open(input_file, 'r') as f:
        parent = file_name
        child = None
        count = 3
        for line in f: 
            if " " not in line[0:count]:
                parent = file_name
                child = line.lstrip()
                dot.node(child, shape='box')
                dot.edge(parent, child, dir='forward')
            elif " " in line[0:count]:
                parent = child
                if parent == child:
                    dot.node(line.lstrip(), shape='box')
                    dot.edge(child, line.lstrip() , dir='forward')
                    

    dot.render(output_file, cleanup=True)

parser = argparse.ArgumentParser(description="Create a class diagram from an input file")
parser.add_argument("input_file", help="Input file with class hierarchy")
parser.add_argument("output_file", help="Output image file (e.g., diagram.png)")
args = parser.parse_args()

create_class_diagram(args.input_file, args.output_file)
