arr = ["Axel","Grasshopper","Mr.Grimm","Hammerhead","Minion","Outlaw2","Roadkill","Shadow","Mr.Slam","Spectre","Sweettooth","Thumper","Twister","Warthog","Darktooth"]
escenarios = ["Moscow","Paris","Amazonia","NewYork","Antarctica", "Holland", "HongKong", "DarkTooth"]


a = 1
for personaje in escenarios:
    aux = ''
    
    aux += "{"+personaje+"} {escenario = "+ str(a) +";}"
    print(f'{aux}')   
    a+=1