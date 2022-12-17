## How to create a function
Each function will have it's own subdirectory which contains:
- main.py
- main_test.py
- requirements.txt
- requirements_test.txt
- cloudbuild.yaml
- trigger.yaml
- README.md

1. Create a directory on your `src` folder for the function code:
Linux or MacOS
```bash
FUN=FUNCTION && mkdir src/$FUN && cd src
```
where FUNCTION is the function name

2. Copy the `cloudbuild.yaml` sample and `trigger.yaml` sample in `src` to subdirectory
```bash
cp *.yaml $FUN
```

#### Use [`storage/`](storage/) and [`helloworld/`](helloworld/) as a reference to update the created function directory
