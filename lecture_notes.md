Rails: Many To Many 

1) Many To Many Introduction
2) Build Migrations
3) Update Models
4) - Routes and Controllers


We're Implementing Likes to our project.
A user can have many liked_questions
A question can have many likes

Create a migration for table likes
  - user_id -> references user.id
  - question_id -> references question.id