import sys

from dataclasses import dataclass
from jinja2 import FileSystemLoader, Environment
from bs4 import BeautifulSoup

@dataclass
class IrqInfo:
    name: str 
    desc: str
    number: int


def translate(tplFileName, tplData):
    loader = FileSystemLoader(searchpath='./') # tosolve
    enviroment = Environment(loader=loader, trim_blocks=True)
    tpl = enviroment.get_template(tplFileName)
  
    # do render
    output = tpl.render(irqs=tplData)

    return output

# return svd-filepath
def getInputParameters():
    if len(sys.argv) != 2:
        print("Usage: . <svd-file-path>")
        sys.exit(1)

    return sys.argv[1]


def parse(svdFilePath):
    ret = []

    with open(svdFilePath, 'r') as f:
        soup = BeautifulSoup(f.read(),"xml")
        rawData = soup.find_all('interrupt')

        """ format example
            <interrupt>
            <name>FPU</name>
            <description>FPU interrupt</description>
            <value>81</value>
            </interrupt>
        """
        for elem in rawData:
            soup = elem 
            ret.append(IrqInfo(soup.find('name').string, soup.find('description').string.replace("\n", " ").replace("         ", " "), soup.find('value').string))

        # adjust order
        ret.sort( key=lambda elem: int(elem.number))    

        return ret

if __name__ == '__main__':
    tplData = parse(getInputParameters())

    # add fixed number to irq.number for real number
    for i in range(len(tplData)):
        tplData[i].number = str(int(tplData[i].number) + 16)

    result = translate("tpl.jinja2", tplData)
    print(result)