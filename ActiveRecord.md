####What are some books that Martin Fowler has written?
NoSQL Distilled
Domain Specific Languages
Refactoring
Patterns of Enterprise Application Architecture
UML Distilled
Refactoring Ruby Edition
Analysis Patterns
Planning Extreme Programming

####What's the difference between "active record" and "ActiveRecord"?
What's the difference between "active record" and "ActiveRecord"?
"Active ^^ Record" is the M in MVC - the model - which is the layer of the system responsible for representing business data and logic. Active Record facilitates the creation and use of business objects whose data requires persistent storage to a database. It is an implementation of the Active Record pattern which itself is a description of an Object Relational Mapping system.
"Active Record" objects don’t specify their attributes directly, but rather infer them from the table definition with which they’re linked. Adding, removing, and changing attributes and their type is done directly in the database. Any change is instantly reflected in the Active Record objects. The mapping that binds a given Active Record class to a certain database table will happen automatically in most common cases, but can be overwritten for the uncommon ones.

####Is the "active record" pattern an ORM?
In Active Record, objects carry both persistent data and behavior which operates on that data. Active Record takes the opinion that ensuring data access logic as part of the object will educate users of that object on how to write to and read from the database.

####Why might we want to use an ORM in our code?

1. Productivity
2. Application design
3. Code Reuse
4. Application Maintainability

####What gem do we need to allow Sinatra to interact with ActiveRecord?
sinatra/activerecord

####What is rake?
Rake is a build language, similar in purpose to make and ant. Like make and ant it's a Domain Specific Language, unlike those two it's an internal DSL programmed in the Ruby language. In this article I introduce rake and describe some interesting things that came out of my use of rake to build this web site: dependency models, synthesized tasks, custom build routines and debugging the build script.

####What is a database migration?
Data migration is the process of transferring data between storage types, formats, or computer systems. It is a key consideration for any system implementation, upgrade, or consolidation.

####What command can we use to create a new ActiveRecord migration?
rake db:create

####What command runs our existing migrations?
rake db:create_migration

####What commands reverses a migration?
rake db:rollback

####What command tells us which migrations have run and which have not?
rake db:status

####Which class do we have to extend if we want to create a new model?
ActiveRecord::Base

####What's the difference between ActiveRecord's .new and .create methods?
Basically the new method creates an object instance and the create method additionally tries to save it to the database if it is possible.
#####create method
Creates an object (or multiple objects) and saves it to the database, if validations pass. The resulting object is returned whether the object was saved successfully to the database or not.
#####new method 
New objects can be instantiated as either empty (pass no construction parameter) or pre-set with attributes but not yet saved (pass a hash with key names matching the associated table column names).

####What's the difference between ActiveRecord's .find and .find_by methods?
#####.find
The find method is usually used to retreive a row by ID
#####find_by is 
Find_by is used as a helper when you're searching for information within a column, and it maps to such with naming conventions. For instance, if you have a column named name in your database, you'd use the following syntax:Model.find_by_name("Bob")
I believe find_by is being deprecated, however.
.where is more of a catch all that lets you use a bit more complex logic for when the conventional helpers won't due.

####What's the difference between ActiveRecord's .find_by and .where methods?
find_by_<columnname>(<columnvalue>)

find(:first, :conditions => { <columnname> => <columnvalue> }

where(<columnname> => <columnvalue>).first | .where is more of a catch all that lets you use a bit more complex logic for when the conventional helpers won't due.

####What ActiveRecord method do we use to change a value in the database?
.save

####What ActiveRecord method do we use to remove an item from the database?
.destroy