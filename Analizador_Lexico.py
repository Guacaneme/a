import sys

global token_list

tokens = {
    'TextWindow': 'TextWindow',
    'And': 'And',
    'Or': 'Or',
    'Then': 'Then',
    'If': 'If',
    'ElseIf': 'ElseIf',
    'EndIf': 'EndIf',
    'Clock': 'Clock',
    'Goto': 'Goto',
    'While': 'While',
    'EndWhile': 'EndWhile',
    'For': 'For',
    'To': 'To',
    'Step': 'Step',
    'EndFor': 'EndFor',
    'Sub': 'Sub',
    'EndSub': 'EndSub',
    'Array': 'Array',
    'Stack': 'Stack',
    'Program': 'Program',

    '=': 'tkn_equals',
    '.': 'tkn_period',
    ',': 'tkn_comma',
    ':': 'tkn_colon',
    '[': 'tkn_left_brac',
    ']': 'tkn_right_brac',
    '(': 'tkn_left_paren',
    ')': 'tkn_right_paren',
    '+': 'tkn_plus',
    '-': 'tkn_minus',
    '*': 'tkn_times',
    '/': 'tkn_div',
    '<>': 'tkn_diff',
    '<': 'tkn_less',
    '<=': 'tkn_leq',
    '>': 'tkn_greater',
    '>=': 'tkn_geq',

}

simlobos = ["1","2","3","4","5","6","7","8","9","0","a","b","c","d","e","f","g","h","i","j","k","l","m","n","ñ","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","Ñ","O","P","Q","R","S","T","U","V","W","X","Y","Z","á","é","í","ó","ú","Á","É","Í","Ó","Ú","ä","ë","ï","ö","ü","Ä","Ë","Ï","Ö","Ü","ç","Ç",'+', '-', '*', '/', '=', '[',']', '<', '>', '(', ')', ',','.',':', "'", '"', " ", "\t","_"]

def isNumber(c):
    if c in ["1","2","3","4","5","6","7","8","9","0"]:
        return True
    return False

def isOperator(c):
    if c in ['+', '-', '*', '/', '=', '[',']', '<', '>', '(', ')', ',','.',':']:
        return True
    return False

def main():

    fila = 0
    global token_list
    token_list = []
    
    for linea in sys.stdin:
        fila +=1
        columna = 1

        print(fila)
        token_actual = ""
        text = False
        number = False
        point = False
        op_esp = False

        for i in range(len(linea)):
            if linea[i] == "\n": continue
            char = linea[i]
            #columna += 1
            #print(linea[i])
            #print(char,not text, (char in simlobos))

            # Si el tipo de dato no es texto y el símbolo es permitido
            if not text and char in simlobos:
                # Si es un comentario se salta la linea
                if char == "'":
                    break
                # Si se abren comillas inicia un texto, se almacena la posición
                if char == '"':
                    text = True
                    columna = i+1
                    continue
                # Si hay un espacio se revisa el token guardado hasta el momento
                if char == " ":
                    # Si no está vacío
                    if token_actual:
                        # ------------- opción de número
                        if number: 
                            tipo_token = "tkn_number"
                            number = False
                            point = False
                        # Se obtiene el tipo de token, si no se encuentra es un id.
                        else: tipo_token = tokens.get(token_actual, "id")
                        # Si es False (según el diccionario de tokens) es una palabra reservada
                        if tipo_token == "id" or tipo_token == "tkn_text" or tipo_token == "tkn_number":
                            token_list.append((tipo_token,token_actual,fila,columna))
                        else:
                            token_list.append((tipo_token,fila,columna))
                        # Si no, se pone el tipo de dato (operador, id, numero)
                          
                            
                        token_actual = ""
                        continue
                    else:
                        continue
                
                
                if isNumber(char):
                    # Si el token inicia en numero, este es su tipo de dato
                    if not token_actual:
                        number = True
                        columna = i+1
                    # Igual si no es tipo número se agrega el número al token actual
                    token_actual += char
                    continue

                # Si el caracter actual es un operador
                if isOperator(char):

                    if char == ".":
                        # Si el token act es un número y aún no tiene el punto, se agrega y se activa la bandera
                        if token_actual:
                            if number and not point and isNumber(linea[i+1]):
                                token_actual += char
                                point = True
                                continue
                            # Si el tipo numero ya tiene punto se ingresa el token de número y de punto como operador
                            if point:
                                token_list.append(("tkn_number",token_actual,fila,columna))
                                number = False
                                point = False
                            else:
                                tipo_token = tokens.get(token_actual, "id")
                                # Si es False (según el diccionario de tokens) es una palabra reservada
                                if tipo_token == "id" or tipo_token == "tkn_number":
                                    token_list.append((tipo_token,token_actual,fila,columna))
                                else:
                                    token_list.append((tipo_token,fila,columna))
                                
                        token_list.append((tokens['.'],fila,i+1))
                        token_actual = ""
                        continue

                    if char == "<":
                        columna = i+1
                        if linea[i+1] == ">" or linea[i+1] == "=":
                            token_actual += char
                            op_esp = True
                            continue
                        token_list.append((tokens[token_actual],fila,columna))
                        token_actual = ""
                        continue

                    if char == ">":
                        columna = i+1
                        if linea[i+1] == "=":
                            op_esp = True
                            token_actual += char
                            continue
                        token_list.append((tokens.get(token_actual, "id"),fila,columna))
                        token_actual = ""
                        continue
                    
                    if token_actual and not op_esp:
                        tipo_token = tokens.get(token_actual, "id")
                        if tipo_token == "id":
                            token_list.append((tipo_token,token_actual,fila,columna))
                        else: token_list.append((tipo_token,fila,columna))
                        token_actual = ""
                        columna = i+1
                    elif not token_actual and not op_esp:
                        columna = i+1

                    token_actual += char

                    tipo_token = tokens.get(token_actual, "id")
                    if tipo_token == "id":
                        token_list.append((tipo_token,token_actual,fila,columna))
                    else: token_list.append((tipo_token,fila,columna))
                    token_actual = ""
                
                else:
                    if not token_actual: columna = i+1
                    token_actual += char
                    continue

                
            elif not text:
                columna = i+1
                token_list.append((f">>> Error lexico (Linea: {fila}, Posicion: {columna})")) 
                return

            else:
                if char == "'":
                    token_list.append((f">>> Error lexico (Linea: {fila}, Posicion: {columna})")) 
                    return
                if char == '"':
                    token_list.append(("tkn_text",token_actual,fila,columna))
                    text = False
                    token_actual = ""
                    columna +=1
                else:
                    token_actual += char
        if text:
            token_list.append((f">>> Error lexico (Linea: {fila}, Posicion: {columna})")) 
            return
        if token_actual:
            if number: tipo_token = "tkn_number"
            # Se obtiene el tipo de token, si no se encuentra es un id.
            else: tipo_token = tokens.get(token_actual, "id")
            # Si es False (según el diccionario de tokens) es una palabra reservada
            if tipo_token == "id" or tipo_token == "tkn_number":
                token_list.append((tipo_token,token_actual,fila,columna))
            else:
                token_list.append((tipo_token,fila,columna))

            token_actual = ""

main()

for t in token_list:
    if len(t) > 5:
        print(t)
    else:
        print("<",end="")
        first = True
        for elem in t:
            if first:
                print(elem,end="")
                first = False
            else:
                print(",",elem,end="")
        print(">")
