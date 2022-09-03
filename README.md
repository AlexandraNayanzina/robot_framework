# Usage

#### Robotframework installation
1. pip install robotframework
2. pip install -U requests
3. pip install robotframework-requests

#### Saving and installing packages
``` shell
# Create file requirements.txt and save all packages here
pip freeze > requirements.txt 

# Install all packages from file
pip install -r requirements.txt
```

#### Run .robot files
``` shell
robot tests/TC_001_Get_Requiest.robot
```