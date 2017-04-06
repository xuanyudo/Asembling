import random
def generate(file):
    f = open(file,"w")
    for i in range(32):
        # f.write('\t'+"not n"+str(i)+"(out["+str(i)+"],x["+str(i)+"],y["+str(i)+"]);"+'\n')
        # f.write('\t' + "alu_1 alu" + str(i+1) + "(a[" + str(i+1) + "],b[" + str(i+1) + "],cout["+str(i)+"],0,opcode,out["+str(i+1)+"],cout["+str(i+1)+"]);"+ '\n')
        f.write("out["+str(i)+"],")
    f.close()
def make(file):
    f = open(file,"w")
    s =["010","110","111","100","001","000"]
    #for i in range(5001):
     #   f.write('\t\t\t'+"#100\t"+"a="+str(random.randrange(-1000000,1000000))+";b="+str(random.randrange(-1000000,1000000))+";opcode="+s[random.randrange(0,6)]+";"+"\n")
    for item in s:
        i=0
        while i<5:
            f.write('\t\t\t' + "#100\t" + "a=" + str(random.randrange(-1000, 1000)) + ";b=" + str(
                random.randrange(-1000, 1000)) + ";opcode=" + item + ";" + "\n")
            i+=1
    #for i in range(len(s)):

     #   f.write('\t\t\t' + "#100\t" + "a=" + str(random.randrange(-1000, 1000)) + ",b=" + str(
      #      random.randrange(-1000, 1000)) + ",opcode=" + s[i] + ";" + "\n")


    f.close()

def input5000(delay):
    list = []
    list2 = []
    f = open("a.txt","r")
    content = f.read()
    list = content.split('\n')
    for item in list:
        value = item.strip(' ')

        list2.append(value)
    list.clear()
    for item in list2:
        value = item.split(' ')
        list.append(value[0])
    list.pop(0)
    list.pop(0)
    list.pop()
    # list.append("1000")
    for item in list:
        print(item+'\n')
    first=0
    second = 0
    list2.clear()
    for item in list:
        item=int(item)
        if item%delay==0 and first!=0 and second!=0:
            numb = cal(first,second)
            list2.append(numb)
            first=0
            second=0
        elif item % delay == 0 and first != 0 and second==0:
            list2.append(0)
            first = 0
            second = 0
        if item%delay==0 and first==0:
            first=item
        else:
            second=item

    print("Average delay: "+str(aver(list2,len(list2))))
    print("Input size: "+str(len(list2)))
    print("delay between input: "+str(list2))

def cal(first,second):
    return second-first
def aver(list,len):
    total = 0
    for item in list:
        total=total+item
    return total/len
#input5000(100)
make("abc.txt")
