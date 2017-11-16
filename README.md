# Stranger Rails

### _Epicodus Practice in Rails, November 16, 2017_

### By Kelsey Langlois and L. D. MacKrell

## Description

_This is a fan site for the Netflix show_ Stranger Things. _It allows users to add scenes from the show's various episodes and plotlines, and to review episodes._

## Set-up/Installation Instructions

* Clone this repository
* From the project root directory, run the following commands:
  * **Note: seeding the database will remove all existing data and replace it.**
  ```
  bundle install
  rake db:create
  rake db:migrate
  rake db:seed
  rake db:test:prepare
  rails s
  ```
* You can then access the app in your web browser at ```localhost:3000```

## Specifications

* Users can add, view, edit, and remove episodes.
* Users can add, view, edit, and remove scenes.
* Users can view plotlines.
* Users can add, view, edit, and remove their own episode reviews.
* Users can only view other users' reviews.
* Users can log in using email and password.
* Users can view:
  * Episodes with no reviews
  * Episodes with most reviews
  * Episodes in chronological or alphabetical order
  * Recent reviews (within the past week)
  * Users with the most reviews

## Planned Functionality

* Featured Episode

* For Friday Project Practice:
  * Integration Testing
  * Faker seeding
  * bootstrap moar

## Support and contact details

_Please contact [kels.langlois@gmail.com](mailto:kels.langlois@gmail.com) or [ldmackrell@gmail.com](mailto: ldmackrell@gmail.com) with questions, comments, or issues._

## Technologies Used

* Ruby
* Rails
* Bootstrap

### License

Copyright (c) 2017 **Kelsey Langlois and L. D. MacKrell**

*This software is licensed under the MIT license.*
