# Dependencies

This software uses:

* Ruby;
* SQLite or PostgreSQL (production);

# Up and Running

## Setup in machine
```
    git clone https://github.com/renatosousafilho/rdteste
    cd rdteste
    bundle install --without test production
    bundle exec rake db:migrate
    bundle exec rails server
```

## Running with docker
```
docker-compose up
```

Open [http://localhost:3000](http://localhost:3000).

# Maintener

Renato Filho [@renatosousafilho at github](http://github.com/renatosousafilho), and
[@_renatofh at twitter](http://twitter.com/_renatofh).


