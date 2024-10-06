#Guilherme Saad Botrel 12121ECP018 - trab6

import tabelas
# Descomente qual arquivo você deseja testar!
#nome_do_arquivo = "Add.asm"
#nome_do_arquivo = "Max.asm"
#nome_do_arquivo = "Pong.asm"
#nome_do_arquivo = "Rect.asm"

nome_hack = 'arquivos_hack/' + nome_do_arquivo.replace("asm","hack")

with open('arquivos_asm/'+nome_do_arquivo, 'r') as asm:
    linhas = asm.readlines()

def limpa_txt(linhas): #limpa espaços em branco e comentários
    new = ''
    for linha in linhas:
        if not '//' in linha:
            new += linha
    return new.split()

def traduz_inst_A_C(linhas): # entrada deve ser linhas já limpas
    new = ''
    for linha in linhas:
        #inst A: @xxx 
        if linha[0] =='@':
            new +=  f'{int(linha[1:]):016b}' +'\n'
        
        #inst C: 
        else:
            dest_part = "null"
            comp_part = ""
            jump_part = "null"
            
            if '=' in linha and ';' in linha: # dest = comp ; jump
                dest_part, restante = linha.split('=')
                comp_part, jump_part = restante.split(';')
                
            if '='in linha and not ';' in linha: # dest = comp
                dest_part, comp_part = linha.split('=')

            if ';'in linha and not '=' in linha: # comp ; jump
                comp_part, jump_part = linha.split(';')   

            dest_bin = tabelas.dest.get(dest_part.strip(), "000")  # Se não encontrar, assume "null"
            comp_bin = tabelas.comp.get(comp_part.strip(), "0101010")  # Se não encontrar, assume "0"
            jump_bin = tabelas.jump.get(jump_part.strip(), "000")  # Se não encontrar, assume "null"   
            new += '111'+f'{comp_bin}{dest_bin}{jump_bin}'+'\n'
          
    return new.split()

def printa(x):
    res = ''
    for el in x:
        res += el +'\n'
    return res

with open(nome_hack, 'w') as arquivo:
    arquivo.write(printa(traduz_inst_A_C(limpa_txt(linhas))))

print(f"Os resultados foram salvos no arquivo '{nome_hack}'.")
printa(traduz_inst_A_C(limpa_txt(linhas)))



        