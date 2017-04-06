def write(ass,ass1,bs,bs1):
    f = open("makefile","w")
    f.write("all:"+'\n'+'\t'+"dineroIV -l1-usize 4k -l1-uassoc "+ass+" -l1-ubsize "+ bs +" -l1-urepl l -l2-usize 256k -l2-uassoc "+ass1+" -l2-ubsize "+bs1+" -l2-urepl l D < trace.din > answer.out")
    f.close()

def read():
    f = open("sample.out","r")
    fw = open("answer.txt","w")
    for i in range(42):
        f.readline()
    fw.write(f.readline())
    fw.close()
    f.close()
read()