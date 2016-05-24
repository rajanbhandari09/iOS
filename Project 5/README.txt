Guidelines on how to use the App:-
1. User needs to enter Date 1 (DD,MM,YYYY) values in 3 text fields provided for Date 1
2. User needs to enter Date 2 (DD,MM,YYYY) values in 3 text fields provided for Date 2
3. On clicking ‘Calculate’ Button, application will first perform validations to check below:
i) Fields are not empty or non-numeric
ii) Dates entered are valid for e.g. zero values are not entered for day, month and year, months are not greater than 12, days are appropriate for the month entered etc.
iii) Date 1 precedes Date 2
4. If all the validations are successful i.e. no errors, then app will display days excluding first date in TextView below the Calculate button

GregorianDate class created to implement days calculate functionality which is located in GregorianDate.swift file