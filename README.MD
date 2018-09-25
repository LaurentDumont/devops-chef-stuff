recipe ---> Contains ressources which describe the state of the system.  
Ressources --> Contains actions that act upon the system. You do not tell Chef the "HOW" you tell it that "WHAT".  
Ressources Default Action --> If no action is specified, a default action is chosen. Valid for reach ressource within the recipe.  

Commands:
* chef generate cookbook cookbooks/learn_chef_apache2
* chef generate template cookbooks/learn_chef_apache2 index.html
* chef-client --local-mode delete-motd.rb
* chef-client --local-mode --runlist 'recipe[learn_chef_apache2]'
