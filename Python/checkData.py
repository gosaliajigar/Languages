"""

	Program : checkData.py
	Author  : Jigar R. Gosalia
	Verion  : 1.0
	Course  : CSC-620 - Programming Language Theory
	Prof.   : Richard Riele

	Validates given data against pre-defined validators using regular expressions.

"""

import re
import os
from datetime import datetime

""" Very crude level of regular expressions to validate data, regex can be more sophisticated then this.

CURRENT_TIME      = datetime.now().strftime("%Y%m%d%H%M%S")
BASE_DIRECTORY    = os.getcwd() + os.sep;
CUSTOMER_DATA     = BASE_DIRECTORY + "data" + os.sep + "all.csv"
LOGS_DIRECTORY    = BASE_DIRECTORY + "logs" + os.sep + CURRENT_TIME;
NAME_VALIDATOR    = re.compile('[A-Z][a-z]*')
DOB_VALIDATOR     = re.compile('(0[1-9]|1[0-2])/(0[1-9]|1[0-9]|2[0-9]|3[0-1])/(19[0-9][0-9]|(200[0-9]|201[0-6]))')
GENDER_VALIDATOR  = re.compile('([mM][aA][lL][eL]|[fF][eE][mM][aA][lL][eE])')
EMAIL_VALIDATOR   = re.compile('[a-zA-Z0-9]*@[a-zA-Z0-9-]+\.[a-z]+')
STATE_VALIDATOR   = re.compile('[A-Z][A-Z]')
ZIPCODE_VALIDATOR = re.compile('[0-9][0-9][0-9][0-9][0-9]')
PHONE_VALIDATOR   = re.compile('1-\([0-9][0-9][0-9]\)[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
IP_VALIDATOR      = re.compile('\d+\.\d+\.\d+\.\d+')

def main():
	os.system('clear')

	print ("\n" * 10)

	print ("#" * 75)
	middle = (75/2) - (len("VALIDATORS")/2)
	print ((" " * middle) + "VALIDATORS")
	print ("#" * 75)

	print ("")
	print ("Acceptable Name Format            : [A-Z][a-z]*")
	print ("Acceptable DOB Format             : mm/dd/yyyy (1900-2016)")
	print ("Acceptable Gender Format          : Male|Female (case-insensitive)")
	print ("Acceptable Email Format           : *@*.*")
	print ("Acceptable State Format           : **")
	print ("Acceptable Zip Format             : #####")
	print ("Acceptable Phone Format           : +1-(###)###-####")
	print ("Acceptable IP Format              : ###.###.###.###")
	print ("")


	processed         = 0
	insufficient      = 0
	invalid           = 0
	valid             = 0
	invalidFirstName  = 0
	invalidLastName   = 0
	invalidDob        = 0
	invalidGender     = 0
	invalidEmail      = 0
	invalidState      = 0
	invalidZipcode    = 0
	invalidHomePhone  = 0
	invalidCellPhone  = 0
	invalidWorkPhone  = 0
	invalidIP         = 0
	invalidRecord     = False

	if os.path.exists(CUSTOMER_DATA):
		with open(CUSTOMER_DATA) as file:
			lines = file.read().splitlines()
		file.close()
		if (len(lines) > 0):
			os.mkdir(LOGS_DIRECTORY)
			for line in lines:
				invalidRecord = False
				if(line.count(",") >= 11):
					processed += 1
					record = line.split(",")
					if (NAME_VALIDATOR.match(record[0]) == None):
						writeData("invalidFirstName.txt", record[0] + " ==> " + line, invalidFirstName, NAME_VALIDATOR)
						invalidRecord = True
						invalidFirstName += 1
					if (NAME_VALIDATOR.match(record[1]) == None):
						writeData("invalidLastName.txt", record[1] + " ==> " + line, invalidLastName, NAME_VALIDATOR)
						invalidRecord = True
						invalidLastName += 1
					if (DOB_VALIDATOR.match(record[2]) == None):
						writeData("invalidDob.txt", record[2] + " ==> " + line, invalidDob, DOB_VALIDATOR)
						invalidRecord = True
						invalidDob += 1
					if (GENDER_VALIDATOR.match(record[3]) == None):
						writeData("invalidGender.txt", record[3] + " ==> " + line, invalidGender, GENDER_VALIDATOR)
						invalidRecord = True
						invalidGender += 1
					if (EMAIL_VALIDATOR.match(record[4]) == None):
						writeData("invalidEmail.txt", record[4] + " ==> " + line, invalidEmail, EMAIL_VALIDATOR)
						invalidRecord = True
						invalidEmail += 1
					if (STATE_VALIDATOR.match(record[7]) == None):
						writeData("invalidState.txt", record[7] + " ==> " + line, invalidState, STATE_VALIDATOR)
						invalidRecord = True
						invalidState += 1
					if (ZIPCODE_VALIDATOR.match(record[8]) == None):
						writeData("invalidZipcode.txt", record[8] + " ==> " + line, invalidZipcode, ZIPCODE_VALIDATOR)
						invalidRecord = True
					 	invalidZipcode += 1
					if (PHONE_VALIDATOR.match(record[9]) == None):
						writeData("invalidHomePhone.txt", record[9] + " ==> " + line, invalidHomePhone, PHONE_VALIDATOR)
						invalidRecord = True
						invalidHomePhone += 1
					if (PHONE_VALIDATOR.match(record[10]) == None):
						writeData("invalidCellPhone.txt", record[10] + " ==> " + line, invalidCellPhone, PHONE_VALIDATOR)
						invalidRecord = True
						invalidCellPhone += 1
					if (PHONE_VALIDATOR.match(record[11]) == None):
						writeData("invalidWorkPhone.txt", record[11] + " ==> " + line, invalidWorkPhone, PHONE_VALIDATOR)
						invalidRecord = True
						invalidWorkPhone += 1
					if (IP_VALIDATOR.match(record[12]) == None):
						writeData("invalidIP.txt", record[12] + " ==> " + line, invalidIP, IP_VALIDATOR)
						invalidRecord = True
						invalidIP += 1
					if (invalidRecord):
						invalid += 1
					else:
						valid += 1
				else:
					insufficient += 1
		else:
			print ("")
			print ("Input File <" + CUSTOMER_DATA + "> is Empty!")
			print ("")
	else:
		print ("")
		print ("Input File <" + CUSTOMER_DATA + "> Not Available!")
		print ("")

	print ("#" * 75)
	middle = (75/2) - (len("RESULTS")/2)
	print ((" " * middle) + "RESULTS")
	print ("#" * 75)

	print ("")
	print ("Processing file at location       : " + CUSTOMER_DATA)
	print ("Records available                 : " + str(len(lines)))
	print ("Records processed                 : " + str(processed))
	print ("Records with insufficient data    : " + str(insufficient))
	print ("Records with sufficient data      : " + str(valid))
	print ("Records with unacceptable data    : " + str(invalid))
	print ("  Records with invalid First Name : " + str(invalidFirstName))
	print ("  Records with invalid Last Name  : " + str(invalidLastName))
	print ("  Records with invalid Dob        : " + str(invalidDob))
	print ("  Records with invalid Gender     : " + str(invalidGender))
	print ("  Records with invalid Email      : " + str(invalidEmail))
	print ("  Records with invalid State      : " + str(invalidState))
	print ("  Records with invalid Zipcode    : " + str(invalidZipcode))
	print ("  Records with invalid HomePhone  : " + str(invalidHomePhone))
	print ("  Records with invalid CellPhone  : " + str(invalidCellPhone))
	print ("  Records with invalid WorkPhone  : " + str(invalidWorkPhone))
	print ("  Records with invalid IP         : " + str(invalidIP))
	print ("")

	print ("#" * 75)

	print ("\n" * 10)

def writeData(fileName, data, count, pattern):
	if (count == 0):
		file = open(LOGS_DIRECTORY + os.sep + fileName, 'a')
		file.write(pattern.pattern + "\n\n")
		file.close()		
	file = open(LOGS_DIRECTORY + os.sep + fileName, 'a')
	file.write(data + "\n")
	file.close()

main()
