Ruby script that polls cowin server to notify availablity of vaccines.

Enviorment: 
1. MacOS
2. `Bundler`, to install do `gem install bundler`. Details at https://bundler.io

Steps
1. Clone repo
2. `cd` to repo, then do `bundle install`
3. Script expects you pincode(-p), minimum age(-a) to search for and type(-t) of vaccine(`Free` or `Paid`) 
    eg. `bundle exec ruby main.rb -t Free -a 18 -p 301001`. Do `bundle exec ruby main.rb -h` for more help.


What happens when slot is found : Script speaks out 'Hi! Vaccine is available' once it finds some slots
