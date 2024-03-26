# sql or Postgres Note 

### Note
>    sql command is case agnostic

Entering the postgresql from command without password
```
    sudo -i -u postgres psql
```

Entering with password
```
    sudo -u postgres psql
```

List the all database
```
    \l
```

Creating the database
```
    create database name
```
Connect to database
```
    \c database_name
    \connect database_name
```

Drop database
```
    drop database db_name
```

