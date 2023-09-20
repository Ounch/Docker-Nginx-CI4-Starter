# CI4 Stater Pack

## Stack
* Docker
* Nginx
* PHP 8.2.8-fpm

## Requirement
* Docker / Compose 

## Dev Setup
Place you CodeIgniter files in the `app` folder

### Run
With Docker running, and Compose installed, do:

```bash
# Execute
./setup.sh

# Follow the on-screen CLI instructions

# Up the instances
make up

# To put down
make down
```

### Fixes if needed
If you encounter issues executing the script take a look at the following resources
* Fix `unable to execute ./setup.sh: Operation not permitted` [Apple Discussion](https://discussions.apple.com/thread/253681758?answerId=256901300022#256901300022)
* Fix exec issues: `chmod a+x ./setup.sh`

### CI4 Testing
* CI4 Instance: [`http://localhost:8080/`](http://localhost:8080)

