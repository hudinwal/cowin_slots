Ruby script that polls cowin server to notify availablity of vaccines.

Enviorment: 
1. MacOS
2. `Bundler`, to install do `gem install bundler`. Details at https://bundler.io

Steps
1. Clone repo
2. `cd` to repo, then do `bundle install`
3. Script expects you pincode, minimum age to search for and type of vaccine(`Free` or `Paid`) 
    eg. `bundle exec ruby main.rb 301002 18 Free`

What happens when slot is found : Script speaks out 'Hi! Vaccine is available' once it finds some slots

Todo: Use OptionParser for script arguments
