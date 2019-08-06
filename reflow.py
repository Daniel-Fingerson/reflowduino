#have either read or select return something indicating reading failed inorder to display alternate html page
import spidev
import RPi.GPIO as GPIO
import time
from time import sleep
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(21,GPIO.OUT)
GPIO.output(21,1)


def read():
    raw_adc=[0,0,0,0]
    voltages=[0,0,0,0]
    spi2=spidev.SpiDev()
    spi2.open(0,0)
    spi2.max_speed_hz=1350000
    buf=[[ 0x01, 0x00, 0x00],[ 0x01, 0x20, 0x00],[ 0x01, 0x40, 0x00],[ 0x01, 0x60, 0x00]]
    spi2.xfer2(buf[0])
    spi2.xfer2(buf[1])
    spi2.xfer2(buf[2])
    spi2.xfer2(buf[3])
    for i in range(4):
        raw_adc[i]=((buf[i][1] &3)<<8) +buf[i][2] #converts last 10 bits of data into an ADC reading
        voltages[i]=(raw_adc[i]*3.3)/1023 #converts ADC reading into a voltage
        #print("Ch {} - Ch{}:".format(i,i+1))
        #print('{0:.3f} volts'.format( voltages[i]))#prints voltages to 3 decimal place
    return voltages
i=1
while i !=0:
    voltages=read()
    voltage=voltages[0]
    if voltage>=180:
        print(voltage)
        GPIO.outpuut(21,0)
    if voltage<180:
        print(voltage)
        GPIO.output(21,1)
    time.sleep(15)
