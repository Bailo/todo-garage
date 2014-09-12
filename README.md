# The test task for Ruby on Rails courses from RubiGarage 

### In the first part of the service is implemented project management
### Technical stack project:

### Client-side

* <b>Specification:</b> HTML5 & CSS3
* <b>Script languages:</b> JavaScript  
* <b>JS-libraries:</b> jQuery, Underscore  
* <b>MV*-frameworks:</b> Backbone.js  
* <b>CSS-preprocessors:</b> SASS
* <b>CSS-framework:</b> Bootstrap 3

### Ruby stack

* <b>Languages:</b> Ruby 2.1  
* <b>MVC-framework:</b> Rails  
* <b>Template engine:</b> erb  
* <b>ORM:</b> Active Record  

### Database

* <b>Development:</b> SQLite3  
* <b>Production:</b> PostgreSQL

### Deployment and teamwork

* <b>Cloud platform:</b> Heroku  
* <b>Revision control:</b> git

### [Demo this project](http://evening-cliffs-1697.herokuapp.com/)

-------
### The second part - check SQL knowledge

#### SQL task Given tables:
* tasks (id, name, status, project_id)
* projects (id, name)  

#### Write the queries for:
1. get all statuses, not repeating, alphabetically ordered  
>SELECT DISTINCT status FROM tasks ORDER BY status ASC 

2. get the count of all tasks in each project, order by tasks count descending  
>SELECT projects.name, COUNT(tasks.Id) AS tasks_count FROM projects LEFT OUTER JOIN tasks ON (projects.Id=tasks.project_id) GROUP BY projects.name ORDER BY tasks_count DESC

3. get the count of all tasks in each project, order by projects names  
>SELECT projects.name, COUNT(tasks.Id) AS tasks_count FROM projects LEFT OUTER JOIN tasks ON (projects.Id=tasks.project_id) GROUP BY projects.name ORDER BY projects.name ASC
    
4. get the tasks for all projects having the name beginning with “N” letter  
>SELECT tasks.name FROM projects LEFT OUTER JOIN tasks ON (projects.Id=tasks.project_id) WHERE SUBSTRING(projects.name, 1, 1) = 'N'
    
5. get the list of all projects containing the ‘a’ letter in the middle of the name, and show the tasks count near each project. Mention that there can exist projects without tasks and tasks with project_id=NULL  
>SELECT projects.name, COUNT(tasks.Id) AS tasks_count FROM projects LEFT OUTER JOIN tasks ON (projects.Id=tasks.project_id) GROUP BY projects.name HAVING SUBSTRING(projects.name, ROUND((LEN(projects.name)+1)/2, 0), 1) = 'a'
    
6. get the list of tasks with duplicate names. Order alphabetically  
>SELECT name FROM tasks GROUP BY name HAVING COUNT(name)>1
    
7. get the list of tasks having several exact matches of both name and status, from the project ‘Garage’. Order by matches count  
>SELECT tasks.name FROM projects LEFT JOIN tasks ON (projects.Id=tasks.project_id) WHERE projects.name='Garage' GROUP BY tasks.name, tasks.status HAVING COUNT(CONCAT(tasks.name, tasks.status))>1 ORDER BY COUNT(CONCAT(tasks.name, tasks.status))

8. get the list of project names having more than 10 tasks in status ‘completed’. Order by project_id  
>SELECT projects.name, tasks.status, tasks.project_id FROM projects LEFT JOIN tasks ON (projects.Id=tasks.project_id) GROUP BY projects.name, tasks.status, tasks.project_id HAVING tasks.status='completed' AND COUNT(tasks.Id)>10 ORDER BY project_id


-------
###Grateful organization [RubyGarage](http://rubygarage.org/) for the opportunity to participate in the competition 
-------

###### Development by [Nik Bailo](https://www.linkedin.com/pub/nik-bailo/81/1a4/b6a)
