# How to Run

1. `$ docker-compose up -d`
2. `$ open vnc://localhost:5900` (mac)  
    - cf. https://github.com/SeleniumHQ/docker-selenium#debugging
    - Enter password (default: `secret`)
2. open VNC client
3. Run RSpec `$ docker exec -it app sh -c 'LAUNCH_BROWSER=true bundle exec rspec'`
