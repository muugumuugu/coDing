#!/usr/bin/python3

"""
    autogenerator.py

    MediaWiki API Demos
    Generates python, javascript, and php files for all demos of MediaWiki API supported
    actions that support GET Requests only and can be easily built
    from a JSON Schema.

    MIT License
"""
import pathlib
import json

class CodeGeneratorBackend:
    """ A python code generator backend. Code borrowed from
    http://effbot.org/zone/python-code-generator.htm """

    def __init__(self, tab="\t"):
        """ Declare variables """
        self.code = []
        self.tab = tab
        self.level = 0

    def end(self):
        """ Get the complete code string """
        return "".join(self.code)

    def write(self, string):
        """ Append code line to a string """
        self.code.append(self.tab * self.level + string)

    def indent(self):
        """ Indent a line of code """
        self.level = self.level + 1

    def dedent(self):
        """ Dedent a line of code """
        self.level = self.level - 1

def make_python_file():
    """ Generate a Python sample code file """
    code = CodeGeneratorBackend(tab="    ")

    file = open('modules.json', 'r')
    modules = json.load(file)
    file.close()

    for module in modules:
        python_file_name = module['filename'] + '.py'
        python_file_path = 'python/' + python_file_name
        file = pathlib.Path(python_file_path)

        if file.exists():
            print('`' + python_file_name + "`: already exists, cannot re-write!")
        else:
            code.code = []
            code.write('#This file is auto-generated. See modules.json and '\
                'autogenerator.py for details\n\n')
            code.write('#!/usr/bin/python3\n\n')
            code.write('"""\n')
            code.indent()
            code.write(python_file_name + '\n\n')
            code.write('MediaWiki API Demos\n')
            code.write(module['docstring'] + '\n\n')
            code.write('MIT License\n')
            code.dedent()
            code.write('"""\n\n')
            code.write('import requests\n\n')
            code.write('S = requests.Session()\n\n')
            code.write('URL = "' + module['endpoint'] + '"\n\n')
            code.write('PARAMS = {\n')
            code.indent()

            for i, param in enumerate(module['params']):
                param_str = '"' + param + '": "' + module['params'][param]
                if i < (len(module['params'])-1):
                    code.write(param_str + '",\n')
                else:
                    code.write(param_str + '"\n')

            code.dedent()
            code.write('}\n\n')
            code.write('R = S.get(url=URL, params=PARAMS)\n')
            code.write('DATA = R.json()\n\n')
            code.write('print(DATA)\n')

            file = open(python_file_path, 'w')
            file.write(code.end())
            file.close()

            print('`' + python_file_name + "`: generated")

def make_javascript_file():
    """ Generate a Javascript sample code file """
    code = CodeGeneratorBackend(tab="    ")

    file = open('modules.json', 'r')
    modules = json.load(file)
    file.close()

    for module in modules:
        javascript_file_name = module['filename'] + '.js'
        javascript_file_path = 'javascript/' + javascript_file_name
        file = pathlib.Path(javascript_file_path)

        if file.exists():
            print('`' + javascript_file_name + "`: already exists, cannot re-write!")
        else:
            code.code = []
            code.write('//This file is autogenerated. See modules.json and autogenerator.py for details\n\n')
            code.write('/*\n')
            code.indent()
            code.write(javascript_file_name + '\n\n')
            code.write('MediaWiki API Demos\n')
            code.write(module['docstring'] + '\n\n')
            code.write('MIT License\n')
            code.dedent()
            code.write('*/\n\n')
            code.write('var url = "' + module['endpoint'] + '"; \n\n')
            code.write('var params = {\n')
            code.indent()

            for i, param in enumerate(module['params']):
                param_str =  param + ': "' + module['params'][param]
                if i < (len(module['params'])-1):
                    code.write(param_str + '",\n')
                else:
                    code.write(param_str + '"\n')

            code.dedent()
            code.write('};\n\n')
            code.write('url = url + "?origin=*";\n')
            code.write('Object.keys(params).forEach(function(key){url += "&" + key + "=" + params[key];});\n\n')
            code.write('fetch(url)\n')
            code.indent()
            code.write('.then(function(response){return response.json();})\n')
            code.write('.then(function(response) {console.log(response);})\n')
            code.write('.catch(function(error){console.log(error);});\n')
            code.dedent()

            file = open(javascript_file_path, 'w')
            file.write(code.end())
            file.close()

            print('`' + javascript_file_name + "`: generated")

def make_php_file():
    """ Generate a PHP sample code file """
    code = CodeGeneratorBackend(tab="    ")

    file = open('modules.json', 'r')
    modules = json.load(file)
    file.close()

    for module in modules:
        php_file_name = module['filename'] + '.php'
        php_file_path = 'php/' + php_file_name
        file = pathlib.Path(php_file_path)

        if file.exists():
            print('`' + php_file_name + "`: already exists, cannot re-write!")
        else:
            code.code = []
            code.write('<?php\n\n')
            code.write('//This file is autogenerated. See modules.json and autogenerator.py for details\n\n')
            code.write('/*\n')
            code.indent()
            code.write(php_file_name + '\n\n')
            code.write('MediaWiki API Demos\n')
            code.write(module['docstring'] + '\n\n')
            code.write('MIT License\n')
            code.dedent()
            code.write('*/\n\n')
            code.write('$endPoint = "' + module['endpoint'] + '";\n')
            code.write('$params = [\n')
            code.indent()

            for i, param in enumerate(module['params']):
                param_str = '"' + param + '" => "' + module['params'][param]
                if i < (len(module['params'])-1):
                    code.write(param_str + '",\n')
                else:
                    code.write(param_str + '"\n')

            code.dedent()
            code.write('];\n\n')
            code.write('$url = $endPoint . "?" . http_build_query( $params );\n\n')
            code.write('$ch = curl_init( $url );\n')
            code.write('curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );\n')
            code.write('$output = curl_exec( $ch );\n')
            code.write('curl_close( $ch );\n\n')
            code.write('$result = json_decode( $output, true );\n')
            code.write('var_dump( $result );\n')

            file = open(php_file_path, 'w')
            file.write(code.end())
            file.close()

            print('`' + php_file_name + "`: generated")

def make_mediawikijs_file():
    """ Generate a MediaWiki Javascript sample code file """
    code = CodeGeneratorBackend(tab="\t")

    file = open('modules.json', 'r')
    modules = json.load(file)
    file.close()

    for module in modules:
        mediawikijs_file_name = module['filename'] + '.js'
        mediawikijs_file_path = 'mediawikijs/' + mediawikijs_file_name
        file = pathlib.Path(mediawikijs_file_path)

        if file.exists():
            print('`' + mediawikijs_file_name + "`: already exists, cannot re-write!")
        else:
            code.code = []
            code.write('// This file is autogenerated. See modules.json and autogenerator.py for details\n\n')
            code.write('/*\n')
            code.indent()
            code.write(mediawikijs_file_name + '\n\n')
            code.write('MediaWiki API Demos\n')
            code.write(module['docstring'] + '\n\n')
            code.write('MIT License\n')
            code.dedent()
            code.write('*/\n\n')
            code.write('var params = {\n')
            code.indent()
            code.indent()

            for i, param in enumerate(module['params']):
                param_str =  param + ': \'' + module['params'][param]
                if i < (len(module['params'])-1):
                    code.write(param_str + '\',\n')
                else:
                    code.write(param_str + '\'\n')

            code.dedent()
            code.write('},\n')
            code.write('api = new mw.Api();\n\n')
            code.dedent()
            code.write('api.get( params ).done( function ( data ) {\n')
            code.indent()
            code.write('console.log( data );\n')
            code.dedent()
            code.write('} );\n')

            file = open(mediawikijs_file_path, 'w')
            file.write(code.end())
            file.close()

            print('`' + mediawikijs_file_name + "`: generated")

if __name__ == '__main__':
    make_python_file()
    make_javascript_file()
    make_php_file()
    make_mediawikijs_file()