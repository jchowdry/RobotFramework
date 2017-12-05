# RobotFramework
This is a RF Test Automation Sample Suite using open source framework called Robot Framework.RF is a generic open source test automation framework for acceptance testing and acceptance test-driven development (ATDD). It has easy-to-use tabular test data syntax and it utilizes the keyword-driven testing approach. Its testing capabilities can be extended by test libraries implemented either with Python or Java.
Dependecies:

Python 2.7 or above

Robot Framework

Selenium

Install RF and Selenium:

pip install robotframework-selenium2library
Getting Started:

Git clone https://github.com/nypublicradio/rf-pledge-test-suite.git
To run test against QA env:

Robot -v BROWSER:chrome -v ENVIRONMENT:QA Tests/Pledge/
To run smoke test against production env:

Robot -v BROWSER:chrome -v ENVIRONMENT:PRD Tests/PrdPledge//PrdSmokeTestSuite.robot
To learn more about robot framework visit:

http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html

Some useful commands to run your test:

To run test against specific browser and environment:
    robot -d Results -i demo -v BROWSER:chrome -v ENVIRONMENT:QA  Tests/Pledge//MonthlyDonationSuite.robot

Run Test with specific Tags:
    robot -d Results -i SmokeTest Tests/Pledge//MonthlyDonationSuite.robot

Run Multiple Suites:
    robot -d Results SmokeTest Tests

Store test results to absolute path
    robot -d /Users/jchowdry/Workspace/TestResults Tests/Pledge//MonthlyDonationSuite.robot


To change the report name to be specific to what type of testing you are performing:
    robot -d Results -N "Full Regression" Tests/Pledge/OneTimeDonationSuite.robot

Supply Data into variable:
    robot -d Results -v Browser:chrome -v https://pledge-demo.wnyc.org/donate/main-test/onestep/ -i demo Tests/Pledge//MonthlyDonationSuite.robot

Randomize test:
    robot -d Results -randomize Tests/Pledge//MonthlyDonationSuite.robot

Debug your test:
    robot -d Results --loglevel debug  -i demo  Tests/Pledge//MonthlyDonationSuite.robot
