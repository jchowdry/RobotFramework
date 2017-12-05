RobotFramework
	This is a RF Test Automation Sample Suite using open source framework called Robot Framework.RF is a generic open source test 		automation framework for acceptance testing and acceptance test-driven development (ATDD). It has easy-to-use tabular test data 	syntax and it utilizes the keyword-driven testing approach. Its testing capabilities can be extended by test libraries 	implemented either with Python or Java.
    
 Dependecies:

        Python 2.7 or above

        Robot Framework

        Selenium

Install RF and Selenium:

	pip install robotframework or
	pip install robotframework-selenium2library
		
To learn more about robot framework visit:

	http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html

Some useful commands to run your test:

	To run test against specific browser and environment:
    	   robot -d Results -i tagname -v BROWSER:chrome -v ENVIRONMENT:QA  Tests/Pledge//MonthlyDonationSuite.robot

	Run Test with specific Tags:
    	   robot -d Results -i tagname Tests/suitename.robot

	Run Multiple Suites:
    	   robot -d Results -i tagname  Tests

	Store test results to absolute path
    	   robot -d -i tagname /Users/******/Workspace/TestResults Tests/Suite.robot

	To change the report name to be specific to what type of testing you are performing:
    	   robot -d Results -i tagname  -N "Full Regression" Tests/suitename.robot

	Supply Data into variable:
    	   robot -d Results -v Browser:chrome -v https://google.com -i tagname Tests/suitename.robot

	Randomize test:
    	   robot -d Results -randomize Tests/suitename.robot

	Debug your test:
    	   robot -d Results --loglevel debug  -i tagname  Tests/suitename.robot
