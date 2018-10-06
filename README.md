## Development Setup

### Clone the repo
```
git clone git@github.com:ghanshyamanand/condingninja.git
```

### Install dependencies (ensure bundler is installed)
```
cd condingninja
bundle install
```

### CREATE database config (sample config is in config/database_sample.yml)
```
cp config/database_sample.yml config/database.yml
# make the appropirate changes if necessary
```

### Setup DB

```
rails db:create
rails db:migrate
rails db:seed
```


### MailRoom
Change mail_room.yml
Make sure to delivery_url in mail_room.yml file
```
http://localhost:3000/inbox
```

### Start mail

```
mail_room -c config/mail_room.yml
```

### Logs
Command to see logs
```
tail -f production.log
tail -f development.log
```


### ProcFile
make changes in procfile as per your need and run foreman as follows
```
foreman start
```

### Some of Codes we use
```
* N.I.U:- Not In Use anymore.
```
