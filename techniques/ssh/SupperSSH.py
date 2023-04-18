import paramiko

##################### Liste IP #####################

liste_IP = []

def IP(liste_IP=liste_IP):
    ips = open("IPs/ip_liste.txt")
    lines = ips.readlines()

    for line in lines:

        ip = line.replace("\n","")
        liste_IP.append(ip)

##################### Liste CMD #####################

liste_CMD = []

def CMD(liste_CMD=liste_CMD):
    cmds = open("CMDs/cmd_liste.txt")
    lines = cmds.readlines()
    
    for line in lines:

        cmd = line.replace("\n","")
        liste_CMD.append(cmd)

######################################################


client = paramiko.SSHClient()
client.set_missing_host_key_policy(paramiko.AutoAddPolicy())

def runCommandes():

    for cmd in range(len(liste_CMD)):
        stdin, stdout, stderr = client.exec_command(liste_CMD[cmd])

        print("---commandes {} envoye---".format(cmd+1))
        print("="*30,"\n",stdout,"\n","="*30)



##########################################################
def connect(ip,port,name,passwd):
    try:
        client.connect(ip, port=port, username=name, password=passwd)
        print("---connection reussi---")

        runCommandes()

        client.close()
        print("---connection terminee---")
    except:
        print("erreur survenue lors dela connection ({})".format(ip))

##########################################################


def SupperSSH():

    name = str(input("username: "))
    passwd = str(input("password: "))
    port = int(input("port:")) 

    try:
        try:
            IP()
        except:
            print("Erreur survenue dans la fonction 'IP()'\nverifier le fichier 'IP/ip_liste.txt'")
            print("voici votre liste d'adresses IP: ",liste_IP)

        try:
            CMD()
        except:
            print("Erreur survenue dans la fonction 'CMD()'\n! verifier le fichier 'CMD/cmd_liste.txt' !")
            print("\nvoici votre liste de commandes: ",liste_CMD)
    except:
        return False

    for ip in liste_IP:
        connect(ip,port,name,passwd)

SupperSSH()
